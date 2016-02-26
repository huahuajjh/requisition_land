package com.tq.requisition.presentation.serviceContract.removedInfo;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.domain.model.removedInfo.RemovedInfo;
import com.tq.requisition.infrastructure.utils.PageFormater;
import com.tq.requisition.presentation.dto.removedinfo.RemovedInfoDto;
import com.tq.requisition.presentation.dto.removedinfo.RemovedInfoImportAndExportDto;
import com.tq.requisition.presentation.dto.removedinfo.RemovedInfoQueryModel;
import com.tq.requisition.presentation.dto.share.PageModel;

/**
 * ��Ǩ������������Լ 
 * @author jjh
 * @time 2016 01-12 12:57
 */
public interface IRemovedInfoServiceContract {
	/**
	 * ������Ǩ����Ա��Ϣ
	 * @param dto
	 * 		��Ǩ����Ա��Ϣdto
	 * @return String
	 * 		���� Formater ���л� String ����
	 */
	String addInfo(RemovedInfoDto dto);
	
	/**
	 * ����������Ǩ����Ա��Ϣ����
	 * @param list
	 * 		�ڼ�ũҵ�˿���Ϣ����
	 * @return String
	 * 		���� Formater ���л� String ����
	 */
	String addBatch(List<RemovedInfoDto> list);
	
	/**
	 * �༭ָ����Ǩ����Ա����
	 * @param dto
	 * 		���༭��dto
	 * @return String
	 * 		���� Formater ���л� String ����
	 */
	String editInfo(RemovedInfoDto dto);
	
	/**
	 * ����idɾ��Ǩ����Ա��Ϣ
	 * @param id
	 * 		id
	 * @return String
	 * 		���� Formater ���л� String ����
	 */
	String delInfo(UUID id);
	
	/**
	 * ���ݲ�ѯmodel�ͷ�ҳmodel��������
	 * @param queryModel
	 * 		��ѯmodel
	 * @param pageModel
	 * 		��ҳmodel
	 * @return String
	 * 		List<RemovedInfoDto>
	 */
	String queryByPage4Json(RemovedInfoQueryModel queryModel,PageModel pageModel);
	
	/**
	 * ���ݲ�ѯmodel�ͷ�ҳmodel��������
	 * @param queryModel
	 * 		��ѯmodel
	 * @param pageModel
	 * 		��ҳmodel
	 * @return List<RemovedInfoDto>
	 * 		���� List<RemovedInfoDto> �������
	 */
	PageFormater queryByPage4List(RemovedInfoQueryModel queryModel,PageModel pageModel);
	
	/**
	 * ������Ǩ���б�
	 * @param list
	 * 		��Ǩ�����뵼��model
	 * @return String
	 * 		json
	 */
	String importRemovedInfo(List<RemovedInfoImportAndExportDto> list);
	
	/**
	 * ���ݲ�ѯmodel������Ǩ���б�
	 * @param queryModel
	 * 		��ѯmodel
	 * @return ��Ǩ���б�
	 */
	List<RemovedInfo> exportByQueryModel(RemovedInfoQueryModel queryModel);
}
