package com.tq.requisition.presentation.serviceContract.visits;

import java.util.UUID;

import com.tq.requisition.infrastructure.utils.PageFormater;
import com.tq.requisition.presentation.dto.share.PageModel;
import com.tq.requisition.presentation.dto.visits.VisitsDto;
import com.tq.requisition.presentation.dto.visits.VisitsQueryModel;

/**
 * �Ϸù�����Լ�ӿ�
 * @author jjh
 * @time 2016-01-13 16:12
 *
 */
public interface IVisitsServiceContract {
	/**
	 * �����Ϸ���Ϣ
	 * @param dto
	 * 		�Ϸ���Ϣdto
	 * @return String
	 * 		Formater json����
	 */
	String addInfo(VisitsDto dto);
	
	/**
	 * �༭�Ϸ���Ϣ
	 * @param dto
	 * 		���༭���Ϸ���Ϣdto
	 * @return String
	 * 		Formater json ����
	 */
	String editInfo(VisitsDto dto);
	
	/**
	 * ���ݲ�ѯmodel�ͷ�ҳmodel��ѯ�Ϸ���Ϣ����
	 * @param queryModel
	 * 		��ѯmodel
	 * @param pageModel
	 * 		��ҳmodel
	 * @return PageFormater
	 * 		PageFormater json����
	 */
	String queryByPage4Json(VisitsQueryModel queryModel,PageModel pageModel);
	
	/**
	 * ���ݲ�ѯmodel�ͷ�ҳmodel��ѯ�Ϸ���Ϣ����
	 * @param queryModel
	 * 		��ѯmodel
	 * @param pageModel
	 * 		��ҳmodel
	 * @return List<VisitsDto>
	 * 		List<VisitsDto>
	 * 		
	 */
	PageFormater queryByPage4List(VisitsQueryModel queryModel,PageModel pageModel);
	
	/**
	 * ����idɾ���Ϸ���Ϣ
	 * @param id
	 * 		��ɾ���Ϸ�ʵ��id
	 * @return String
	 * 		Formater json����
	 */
	String delById(UUID id);
}
