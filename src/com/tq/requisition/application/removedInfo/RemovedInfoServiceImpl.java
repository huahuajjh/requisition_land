package com.tq.requisition.application.removedInfo;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.tq.requisition.application.BaseApplication;
import com.tq.requisition.autoMapper.RemovedInfoMapper;
import com.tq.requisition.domain.IRepository.IRepositoryContext;
import com.tq.requisition.domain.model.removedInfo.IRemovedInfoRepository;
import com.tq.requisition.domain.model.removedInfo.RemovedInfo;
import com.tq.requisition.exception.DomainException;
import com.tq.requisition.infrastructure.utils.Formater;
import com.tq.requisition.infrastructure.utils.PageFormater;
import com.tq.requisition.presentation.dto.removedinfo.RemovedInfoDto;
import com.tq.requisition.presentation.dto.removedinfo.RemovedInfoImportAndExportDto;
import com.tq.requisition.presentation.dto.removedinfo.RemovedInfoQueryModel;
import com.tq.requisition.presentation.dto.share.PageModel;
import com.tq.requisition.presentation.serviceContract.removedInfo.IRemovedInfoServiceContract;

/**
 * ��Ǩ����������ʵ��
 * @author jjh
 * @time 2016 01-12 12:57
 */
public class RemovedInfoServiceImpl extends BaseApplication implements IRemovedInfoServiceContract{
	private IRemovedInfoRepository removedInfoRepository;
	
	public RemovedInfoServiceImpl(IRepositoryContext context,IRemovedInfoRepository removedInfoRepository) {
		super(context);
		this.removedInfoRepository = removedInfoRepository;
		this.removedInfoRepository.setAggregatorRootClass(RemovedInfo.class);
	}

	@Override
	public String addInfo(RemovedInfoDto dto) {
		try {
			context().beginTransaction();
			removedInfoRepository.addRemovedInfo(RemovedInfoMapper.toModel(dto));
			context().commit();
			return toJson("������Ǩ�������ɹ�", null, Formater.OperationResult.SUCCESS);
		} catch (DomainException e) {
			return toJson("������Ǩ������ʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
		
	}

	@Override
	public String addBatch(List<RemovedInfoDto> list) {
		try {
			context().beginTransaction();
			removedInfoRepository.addBatch(RemovedInfoMapper.toModelList(list));
			context().commit();
			return toJson("������Ǩ�������ɹ�", null, Formater.OperationResult.SUCCESS);
		} catch (DomainException e) {
			context().rollback();
			return toJson("������Ǩ������ʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
		finally{
			context().close();
		}
	}

	@Override
	public String editInfo(RemovedInfoDto dto) {
		try {
			context().beginTransaction();
			removedInfoRepository.editRemovedInfo(RemovedInfoMapper.toModel(dto));
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
			removedInfoRepository.delRemovedInfo(id);
			context().commit();
			return toJson("ɾ�����ݳɹ�", null, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			return toJson("ɾ������ʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
	}

	@Override
	public String queryByPage4Json(RemovedInfoQueryModel queryModel,
			PageModel pageModel) {
		return toJsonByPage(queryByPage4List(queryModel, pageModel), "��ѯ�ɹ�", Formater.OperationResult.SUCCESS);
	}

	@Override
	public PageFormater queryByPage4List(
			RemovedInfoQueryModel queryModel, PageModel pageModel) {
		return removedInfoRepository.queryByPage(queryModel, pageModel);
	}
	
	@Override
	public String importRemovedInfo(List<RemovedInfoImportAndExportDto> list) {
		if(null==list || list.size()==0){
			return toJson("��Ǩ���б�Ϊ��", null, Formater.OperationResult.FAIL);
		}
		List<RemovedInfo> infos = new ArrayList<RemovedInfo>();
		for (RemovedInfoImportAndExportDto removedInfoImportAndExportDto : list) {
			infos.add(removedInfoImportAndExportDto.toRemovedInfo());
		}
		try {
			context().beginTransaction();
			removedInfoRepository.addBatch(infos);
			context().commit();
			return toJson("������Ǩ����Ϣ�ɹ�", null, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			context().rollback();
			return toJson("������Ǩ����Ϣʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
		finally{
			context().close();
		}
	}
	
	@Override
	public List<RemovedInfo> exportByQueryModel(RemovedInfoQueryModel queryModel) {
		if(null==queryModel){
			return null;
		}
		return removedInfoRepository.queryByModel(queryModel);
	}

}
