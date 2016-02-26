package com.tq.requisition.domain.model.transferHouseholdInfo;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.domain.IRepository.IRepository;
import com.tq.requisition.exception.DomainException;
import com.tq.requisition.exception.SpecifiedObjectDoesNotExistsException;
import com.tq.requisition.infrastructure.utils.PageFormater;
import com.tq.requisition.presentation.dto.share.PageModel;
import com.tq.requisition.presentation.dto.transferMgt.TransferInfoQueryModel;

/**
 * ת����Ϣ�ִ��ӿ�
 * @author jjh
 * @time 2015-12-30 23:04
 */
public interface ITransferInfoRepository  extends IRepository<TransferHouseholdInfo>{
	/**
	 * ¼��ת����Ϣ	
	 * @param entity
	 * 		��¼���ת����Ϣʵ��
	 */
	void addTransferInfo(TransferHouseholdInfo entity) throws DomainException ;
	
	/**
	 * ����¼��ת����Ϣ
	 * @param list
	 * 		ת����Ϣ����
	 */
	void addBatch(List<TransferHouseholdInfo> list) throws DomainException ;
	
	/**
	 * ����ת����Ϣ
	 * @param entity
	 * 		�����µ�ת��ʵ��
	 */
	void editTransferInfo(TransferHouseholdInfo entity) throws SpecifiedObjectDoesNotExistsException ;
	
	/**
	 * ��������ת����Ϣ
	 * @param list
	 * 		�����µļ���
	 */
	void editBact(List<TransferHouseholdInfo> list) throws SpecifiedObjectDoesNotExistsException ;
	
	/**
	 * ����ɾ��ת����Ϣ
	 * @param uuids
	 */
	void deleteBact(UUID... uuids);
	
	/**
	 * ģ����ѯת������
	 * @param queryModel
	 * 		��ѯmodel
	 * @param pageModel
	 * 		��ҳmodel
	 * @return List<TransferHouseholdInfo>
	 * 		ת��������Ϣ
	 */
	PageFormater queryByFuzzy(TransferInfoQueryModel queryModel,PageModel pageModel);
	
	/**
	 * ��������ʱ��Ϣ��ѯ
	 * @param queryModel
	 * 		��ѯmodel
	 * @param pageModel
	 * 		��ҳmodel
	 * @return
	 */
	PageFormater queryByFuzzy4Add(TransferInfoQueryModel queryModel,PageModel pageModel);
}
