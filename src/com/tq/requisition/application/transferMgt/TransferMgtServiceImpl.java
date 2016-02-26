package com.tq.requisition.application.transferMgt;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.application.BaseApplication;
import com.tq.requisition.autoMapper.NewTransferInfoMapper;
import com.tq.requisition.domain.IRepository.IRepositoryContext;
import com.tq.requisition.domain.model.transferHouseholdInfo.ITransferInfoRepository;
import com.tq.requisition.domain.model.transferHouseholdInfo.TransferHouseholdInfo;
import com.tq.requisition.domain.service.idomainservice.ITransferMgtService;
import com.tq.requisition.infrastructure.utils.Formater;
import com.tq.requisition.infrastructure.utils.PageFormater;
import com.tq.requisition.presentation.dto.share.PageModel;
import com.tq.requisition.presentation.dto.transferMgt.NewAndEditTransferHouseholdInfoDto;
import com.tq.requisition.presentation.dto.transferMgt.TransferInfoQueryModel;
import com.tq.requisition.presentation.serviceContract.transferMgt.ITransferMgtServiceContract;

/**
 * ת������ҵ��ӿ�ʵ��
 * @author jjh
 * @time 2015-12-30 17:07
 *
 */
public class TransferMgtServiceImpl extends BaseApplication implements ITransferMgtServiceContract{
	private ITransferInfoRepository transferInfoRepository;
	private ITransferMgtService transferMgtService;
	
	public TransferMgtServiceImpl(
			IRepositoryContext context,//
			ITransferInfoRepository transferInfoRepository,//
			ITransferMgtService transferMgtService) {
		super(context);
		this.transferInfoRepository = transferInfoRepository;
		this.transferInfoRepository.setAggregatorRootClass(TransferHouseholdInfo.class);
		
		this.transferMgtService = transferMgtService;
	}

	@Override
	public String addTransferInfo(NewAndEditTransferHouseholdInfoDto dto) {
		context().beginTransaction();
		try {
			transferMgtService.addTransferInfo(NewTransferInfoMapper.toModel(dto));
			context().commit();
			return toJson("����ת����Ϣ�ɹ�", null, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			context().rollback();
			return toJson("����ת����Ϣʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
		finally{
			context().close();
		}
	}

	@Override
	public String addBatchTransferInfo(List<NewAndEditTransferHouseholdInfoDto> list) {
		try {
			context().beginTransaction();
			transferMgtService.addBatchTransferInfo(NewTransferInfoMapper.toModelList(list));
			context().commit();
			return toJson("���������ɹ�", null, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			context().rollback();
			return toJson("��������ʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
		finally{
			context().close();
		}
	}

	@Override
	public String queryJsonByFuzzy(TransferInfoQueryModel queryModel,
			PageModel pageModel) {
		PageFormater page = null;
		try {
			page = queryListByFuzzy(queryModel, pageModel);
			return toJsonByPage(page,"��ѯ�ɹ�",Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			return toJsonByPage(page,"��ѯʧ��-"+e.getMessage(),Formater.OperationResult.FAIL);
		}
	}

	@Override
	public PageFormater queryListByFuzzy(
			TransferInfoQueryModel queryModel, PageModel pageModel) {
		return transferInfoRepository.queryByFuzzy(queryModel, pageModel);
	}

	@Override
	public String deleteBatch(UUID... uuids) {
		try {
			context().beginTransaction();
			transferInfoRepository.deleteBact(uuids);
			context().commit();
			return toJson("ɾ���ɹ�", null, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			context().rollback();
			return toJson("ɾ��ʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
		finally{
			context().close();
		}
	}

	@Override
	public PageFormater queryList4AddByFuzzy(TransferInfoQueryModel queryModel,
			PageModel pageModel) {
		PageFormater page = transferInfoRepository.queryByFuzzy4Add(queryModel, pageModel);
		return page;
	}

	@Override
	public String query4AddByFuzzy(TransferInfoQueryModel queryModel,
			PageModel pageModel) {
		try {
			return toJsonByPage(queryList4AddByFuzzy(queryModel, pageModel), "�ɹ�", Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			return toJsonByPage(null, "ʧ��-"+e.getMessage(), Formater.OperationResult.FAIL);
		}
	}

	@Override
	public String editTransferInfo(NewAndEditTransferHouseholdInfoDto dto) {
		try {
			context().beginTransaction();
			TransferHouseholdInfo t = NewTransferInfoMapper.toModel(dto);
			t.setId(dto.getId());
			transferInfoRepository.editTransferInfo(t);
			context().commit();
			return toJson("�ɹ�",t , Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			context().rollback();
			return toJson("ʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
		finally{
			context().close();
		}
	}
	
}
