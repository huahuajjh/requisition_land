package com.tq.requisition.domain.service.idomainservice;

import java.util.List;

import com.tq.requisition.domain.model.transferHouseholdInfo.TransferHouseholdInfo;
import com.tq.requisition.exception.DomainException;

/**
 * ת������ҵ��ӿڷ���
 * @author jjh
 * @time 2015-12-30 19:00
 */
public interface ITransferMgtService {
	/**
	 * ����ת����Ϣ���÷����漰��Ǩ����Ա��Ϣ�䶯���ǹ��ڲ�Ǩ����Ա�ִ���ת����Ϣ�ִ���ͬ��ɵ�ҵ�����
	 * @param model
	 * 		��������ת����Ϣʵ��
	 */
	void addTransferInfo(TransferHouseholdInfo model) throws DomainException ;
	
	/**
	 * ��������ת����Ϣ���÷����漰��Ǩ����Ա��Ϣ���£��ɲ�Ǩ����Ա�ִ���ת���ִ���ͬ��ɸ�ҵ��
	 * @param list
	 * 		�����������ݼ���
	 */
	void addBatchTransferInfo(List<TransferHouseholdInfo> list) throws DomainException ;
	
	/**
	 * ��������ת����Ϣ���÷����漰��Ǩ����Ա��Ϣ���£��ɲ�Ǩ����Ա�ִ���ת���ִ���ͬ��ɸ�ҵ��
	 * @param list
	 * 		�����µ����ݼ���
	 */
	void editBatchTransferInfo(List<TransferHouseholdInfo> list);
	
}
