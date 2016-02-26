package com.tq.requisition.application.registedAgric;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.application.BaseApplication;
import com.tq.requisition.autoMapper.RegistedAgricMapper;
import com.tq.requisition.domain.IRepository.IRepositoryContext;
import com.tq.requisition.domain.model.registedAgricultureInfo.IRegistedAgricultureInfoRepository;
import com.tq.requisition.domain.model.registedAgricultureInfo.RegistedAgricultureInfo;
import com.tq.requisition.infrastructure.utils.Formater;
import com.tq.requisition.infrastructure.utils.PageFormater;
import com.tq.requisition.presentation.dto.registedAgr.RegistedAgricQueryModel;
import com.tq.requisition.presentation.dto.registedAgr.RegistedAgricultureInfoDto;
import com.tq.requisition.presentation.dto.share.PageModel;
import com.tq.requisition.presentation.serviceContract.registedAgric.IRegistedAgricServiceContract;

/**
 * ��Ǩ������ʵ����
 * @author jjh
 * @version 1.0
 * @time 2016-01-12 22:12
 *
 */
public class RegistedAgricServiceImpl extends BaseApplication implements IRegistedAgricServiceContract{
	private IRegistedAgricultureInfoRepository registedAgricultureInfoRepository;
	
	public RegistedAgricServiceImpl(IRepositoryContext context,IRegistedAgricultureInfoRepository registedAgricultureInfoRepository) {
		super(context);
		this.registedAgricultureInfoRepository = registedAgricultureInfoRepository;
		this.registedAgricultureInfoRepository.setAggregatorRootClass(RegistedAgricultureInfo.class);
	}

	@Override
	public String addInfo(RegistedAgricultureInfoDto dto) {
		try {
			context().beginTransaction();
			registedAgricultureInfoRepository.addInfo(RegistedAgricMapper.toModel(dto));
			context().commit();
			return toJson("�������ݳɹ�", null, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			return toJson("��������ʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);			
		}
	}

	@Override
	public String addBatch(List<RegistedAgricultureInfoDto> list) {
		try {
			context().beginTransaction();
			registedAgricultureInfoRepository.addBatch(RegistedAgricMapper.toModelList(list));
			context().commit();
			return toJson("�������ݳɹ�", null, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			return toJson("��������ʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
	}

	@Override
	public String editInfo(RegistedAgricultureInfoDto dto) {
		try {
			context().beginTransaction();
			registedAgricultureInfoRepository.editInfo(RegistedAgricMapper.toModel(dto));
			context().commit();
			return toJson("�༭���ݳɹ�", null, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			return toJson("�༭����ʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
	}

	@Override
	public String delInfo(UUID id) {
		try {
			context().beginTransaction();
			registedAgricultureInfoRepository.delById(id);
			context().commit();
			return toJson("ɾ�����ݳɹ�",null , Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			return toJson("ɾ������ʧ��-"+e.getMessage(),null , Formater.OperationResult.FAIL);
		}
	}

	@Override
	public String queryByPage4Json(RegistedAgricQueryModel queryModel,
			PageModel pageModel) {
		return toJson("��ȡ���ݳɹ�", queryByPage4List(queryModel, pageModel), Formater.OperationResult.SUCCESS);
	}

	@Override
	public PageFormater queryByPage4List(RegistedAgricQueryModel queryModel,
			PageModel pageModel) {
		return registedAgricultureInfoRepository.queryByPage(queryModel, pageModel);
	}

}
