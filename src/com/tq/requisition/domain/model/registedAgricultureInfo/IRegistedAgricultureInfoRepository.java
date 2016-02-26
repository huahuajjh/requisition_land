package com.tq.requisition.domain.model.registedAgricultureInfo;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.domain.IRepository.IRepository;
import com.tq.requisition.exception.DomainException;
import com.tq.requisition.infrastructure.utils.PageFormater;
import com.tq.requisition.presentation.dto.registedAgr.RegistedAgricQueryModel;
import com.tq.requisition.presentation.dto.share.PageModel;

/**
 * �ڼ�ũҵ�˿���Ϣ�ִ��ӿ�
 * @author jjh
 * @time 2015-01-05 18:50
 *
 */
public interface IRegistedAgricultureInfoRepository extends IRepository<RegistedAgricultureInfo>{
	/**
	 * ���ݷ�ҳ���ѯmodel��ѯ
	 * @param queryModel
	 * 		��ѯmodel
	 * @param pageModel
	 * 		��ҳmodel
	 * @return List<RegistedAgricultureInfo>
	 * 		�ڼ�ũҵ�˿���Ϣ����
	 */
	PageFormater queryByPage(RegistedAgricQueryModel queryModel,PageModel pageModel);
	
	/**
	 * �����ڼ�ũҵ�˿���Ϣ
	 * @param entity
	 * 		�ڼ�ũҵ�˿���Ϣʵ��
	 */
	void addInfo(RegistedAgricultureInfo entity);
	
	/**
	 * ���������ڼ�ũҵ��Ϣ
	 * @param list
	 * 		��Ϣ����
	 */
	void addBatch(List<RegistedAgricultureInfo> list);
	
	/**
	 * �༭�ڼ�ũҵ�˿���Ϣ
	 * @param entity
	 * 		�ڼ�ũҵ�˿���Ϣʵ��
	 */
	void editInfo(RegistedAgricultureInfo entity) throws DomainException ;
	
	/**
	 * ����idɾ��ָ������Ϣ
	 * @param id
	 * 		id
	 */
	void delById(UUID id);
	
}
