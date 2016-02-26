package com.tq.requisition.presentation.serviceContract.registedAgric;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.infrastructure.utils.PageFormater;
import com.tq.requisition.presentation.dto.registedAgr.RegistedAgricQueryModel;
import com.tq.requisition.presentation.dto.registedAgr.RegistedAgricultureInfoDto;
import com.tq.requisition.presentation.dto.share.PageModel;

/**
 * �ڼ�ũҵ�˿���Ϣ���������Լ
 * @author jjh
 * @time 2016 01-12 19:55
 */
public interface IRegistedAgricServiceContract{
	/**
	 * �����ڼ�ũҵ
	 * @param dto
	 * 		�ڼ�ũҵ�˿�dto
	 * @return String
	 * 		Formater ���л�����
	 */
	String addInfo(RegistedAgricultureInfoDto dto);
	
	/**
	 * ���������ڼ�ũҵ�˿���Ϣ
	 * @param list
	 * 		�ڼ�ũҵ�˿ڼ���
	 * @return String
	 * 		Formater ���л�����
	 */
	String addBatch(List<RegistedAgricultureInfoDto> list);
	
	/**
	 * �༭�ڼ�ũҵ�˿���Ϣ
	 * @param dto
	 * 		���༭���ڼ�ũҵ�˿�dto
	 * @return String
	 * 		Formater ���л�����
	 */
	String editInfo(RegistedAgricultureInfoDto dto);
	
	/**
	 * ����idɾ��ָ�����ڼ�ũҵ�˿���Ϣ
	 * @param id
	 * 		id
	 * @return String
	 * 		Formater ���л�����
	 */
	String delInfo(UUID id);
	
	/**
	 * ���ݲ�ѯmodel�ͷ�ҳmodel��ѯ�����
	 * @param queryModel
	 *		��ѯmodel
	 * @param pageModel
	 * 		��ҳmodel
	 * @return String
	 * 		List<RegistedAgricultureInfoDto> ���л�����
	 */
	String queryByPage4Json(RegistedAgricQueryModel queryModel,PageModel pageModel);
	
	/**
	 * ���ݲ�ѯmodel�ͷ�ҳmodel��ѯ�����
	 * @param queryModel
	 *		��ѯmodel
	 * @param pageModel
	 * 		��ҳmodel
	 * @return String
	 * 		List<RegistedAgricultureInfoDto>
	 */
	PageFormater queryByPage4List(RegistedAgricQueryModel queryModel,PageModel pageModel);
	
	
}
