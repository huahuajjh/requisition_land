package com.tq.requisition.application.socialsecurityMgt;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.commons.lang3.NotImplementedException;

import com.tq.requisition.application.BaseApplication;
import com.tq.requisition.autoMapper.SSMapper;
import com.tq.requisition.domain.IRepository.IRepositoryContext;
import com.tq.requisition.domain.model.familyMember.FamilyItem;
import com.tq.requisition.domain.model.familyMember.IFamilyItemRepository;
import com.tq.requisition.domain.model.socialsecurity.ISocialsecurityRepository;
import com.tq.requisition.domain.model.socialsecurity.SocialsecurityInfo;
import com.tq.requisition.domain.model.socialsecurityType.ISocialsecurityTypeRepository;
import com.tq.requisition.domain.model.socialsecurityType.SocialsecurityType;
import com.tq.requisition.domain.service.idomainservice.ISSService;
import com.tq.requisition.exception.DomainException;
import com.tq.requisition.infrastructure.utils.Formater;
import com.tq.requisition.infrastructure.utils.PageFormater;
import com.tq.requisition.presentation.dto.share.PageModel;
import com.tq.requisition.presentation.dto.socialsecurityMgt.NewSocialsecurityDto;
import com.tq.requisition.presentation.dto.socialsecurityMgt.SocialsecurityQueryModel;
import com.tq.requisition.presentation.dto.socialsecurityMgt.SsImportAndExportDto;
import com.tq.requisition.presentation.serviceContract.socialsecurityMgt.ISocialsecurityMgtServiceContract;

/**
 * �籣����ʵ����
 * @author jjh
 * @time 2015-12-31 20:17
 */
public class SocialsecurityMgtServiceImpl extends BaseApplication implements ISocialsecurityMgtServiceContract{
	private ISocialsecurityRepository ssRepository;
	private ISSService ssService;
	private ISocialsecurityTypeRepository typeRepository;
	private IFamilyItemRepository itemRepository;
	
	public SocialsecurityMgtServiceImpl(
			IRepositoryContext context,//
			ISSService ssService,//
			ISocialsecurityRepository ssRepository,//
			ISocialsecurityTypeRepository typeRepository,//
			IFamilyItemRepository itemRepository) {
		super(context);
		this.ssRepository = ssRepository;
		this.ssRepository.setAggregatorRootClass(SocialsecurityInfo.class);
		
		this.typeRepository = typeRepository;
		this.typeRepository.setAggregatorRootClass(SocialsecurityType.class);
		
		this.itemRepository = itemRepository;
		this.itemRepository.setAggregatorRootClass(FamilyItem.class);
		
		this.ssService = ssService;	
	}

	@Override
	public String addSSInfo(NewSocialsecurityDto dto)  {
		try {
			context().beginTransaction();
			ssService.addSSInfo(SSMapper.toModel(dto));
			context().commit();
			return toJson("�����籣��Ϣ�ɹ�", null, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			context().rollback();
			return toJson("�����籣��Ϣʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
		finally{
			context().close();
		}
	}

	@Override
	public String addBatch(List<NewSocialsecurityDto> list){
		try {
			context().beginTransaction();
			ssService.addSSBatch(SSMapper.toModelList(list));
			context().commit();
			return toJson("�����������ݳɹ�", null, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			return toJson("������������ʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
	}

	@Override
	public PageFormater queryFuzzyByAdd(SocialsecurityQueryModel queryModel,
			PageModel pageModel) {
		return ssRepository.query4AddByFuzzy(queryModel, pageModel);
	}

	@Override
	public String queryFuzzyByAddJson(SocialsecurityQueryModel queryModel,
			PageModel pageModel) {
		try {
			return toJsonByPage(queryFuzzyByAdd(queryModel, pageModel), "�ɹ�", Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			return toJsonByPage(null, "ʧ��-"+e.getMessage(), Formater.OperationResult.FAIL);
		}
	}

	@Override
	public String editSS(NewSocialsecurityDto dto) {
		try {
			context().beginTransaction();
			SocialsecurityInfo info = SSMapper.toModel(dto);
			info.setId(dto.getId());
			ssRepository.editSS(info);
			context().commit();
			return toJson("�༭���ݳɹ�", null, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			return toJson("�༭����ʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
	}

	@Override
	public String deleteSS(UUID... uuids) {
		throw new NotImplementedException("δʵ�ֵķ���");
	}
	
	@Override
	public PageFormater query4TableListByFuzzy(
			SocialsecurityQueryModel queryModel, PageModel pageModel) {
		return  ssRepository.query4TableByFuzzy(queryModel, pageModel);
	}
	
	@Override
	public String query4TableByFuzzy(SocialsecurityQueryModel queryModel,
			PageModel pageModel) {
		try {
			return toJsonByPage(query4TableListByFuzzy(queryModel, pageModel), "�ɹ�", Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			return toJsonByPage(null, "ʧ��-"+e.getMessage(), Formater.OperationResult.FAIL);
		}
	}
	
	@Override
	public String importSS(List<SsImportAndExportDto> items) {
		try {
			 List<SocialsecurityInfo> list = new ArrayList<>();
			 for (SsImportAndExportDto item : items) {
				list.add(item.toSocialsecurityInfo());
			}
			for (SocialsecurityInfo socialsecurityInfo : list) {
				UUID itemId = itemRepository.getIdByIdNumber(socialsecurityInfo.getIdNumber());
				if(null==itemId){return toJson("δ��ѯ�����֤["+socialsecurityInfo.getIdNumber()+"]����Ա��Ϣ", null, Formater.OperationResult.FAIL);}
				
				UUID typeId = typeRepository.getIdByName(socialsecurityInfo.getTypeStr());
				if(null==typeId){return toJson("δ��ѯ���籣����["+socialsecurityInfo.getTypeStr()+"]��id��Ϣ", null, Formater.OperationResult.FAIL);}
				
				socialsecurityInfo.setSocialsecurityTypeId(typeId);
				socialsecurityInfo.setFmlItemId(itemId);
			}
			context().beginTransaction();
			ssService.addSSBatch(list);
			context().commit();
			return toJson("�����籣��Ϣ�ɹ�", items, Formater.OperationResult.SUCCESS);
		} catch (DomainException e) {
			context().rollback();
			return toJson("�����籣��Ϣʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
		finally{
			context().close();
		}
	}
}
