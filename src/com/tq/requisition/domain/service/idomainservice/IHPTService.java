package com.tq.requisition.domain.service.idomainservice;

import java.util.List;

import com.tq.requisition.domain.model.housePuraseTicket.HPTExchangeInfo;
import com.tq.requisition.domain.model.housePuraseTicket.HPTMendInfo;
import com.tq.requisition.domain.model.housePuraseTicket.HPTProviderInfo;
import com.tq.requisition.domain.model.housePuraseTicket.HPTReportOfLossInfo;
import com.tq.requisition.domain.model.housePuraseTicket.HPTUseAndCash;
import com.tq.requisition.domain.model.housePuraseTicket.HousePuraseTicket;
import com.tq.requisition.exception.DomainException;
import com.tq.requisition.exception.SpecifiedObjectDoesNotExistsException;
import com.tq.requisition.infrastructure.utils.PageFormater;
import com.tq.requisition.presentation.dto.hpt.HPTDisplayFmlDto;
import com.tq.requisition.presentation.dto.share.PageModel;

/**
 * ����ȯ�����������
 * @author jjh
 * @time 2015-01-01 10:48
 */
public interface IHPTService {
	/**
	 * ��������ȯ��Ϣ,���ҷ������������Ϣ
	 * @param hpt
	 * 		�������Ĺ���ȯ��Ϣʵ��
	 * @return String
	 * 		����һ��String���ţ������������
	 */
	void addHPT(HousePuraseTicket hpt) throws DomainException ;
	
	/**
	 * ������������ȯ
	 * @param hpts
	 * 		����ȯ��Ϣ����
	 * @throws DomainException
	 */
	void addHPT(List<HousePuraseTicket> hpts) throws DomainException ;
	
	/**
	 * ��ȯ����
	 * @param exHPT
	 * 		��ȯ��Ϣ
	 */
	void exchange(HPTExchangeInfo exHPT,HousePuraseTicket newTicket) throws SpecifiedObjectDoesNotExistsException;
	
	/**
	 * ����ȯ��ȡ
	 * @param revieveHPT
	 * 		��ȡ��Ϣ
	 */
	void provider(HPTProviderInfo revieveHPT) throws SpecifiedObjectDoesNotExistsException;
	
	/**
	 * ����ȯ��ʧ
	 * @param lossPHT
	 * 		��ʧ��Ϣ
	 */
	void reportOfLoss(HPTReportOfLossInfo lossPHT) throws SpecifiedObjectDoesNotExistsException;
	
	/**
	 * ����ȯ��ȯ
	 * @param mendHPT
	 * 		��ȯ��Ϣ
	 */
	void mend(HPTMendInfo mendHPT,HousePuraseTicket newTicket) throws SpecifiedObjectDoesNotExistsException;
	
	/**
	 * ����ȯ��ʹ��
	 * @param useAndCashHPT
	 * 		ʹ����Ϣ
	 */
	void useOrCash(HPTUseAndCash useAndCashHPT) throws SpecifiedObjectDoesNotExistsException;
	
	/**
	 * ���ݻ�����ݲ�ѯ�û�����ȯ��Ϣ
	 * @param idNumber
	 * 		�������֤
	 * @throws SpecifiedObjectDoesNotExistsException 
	 */
	public List<HPTDisplayFmlDto> queryByFml(String idNumber) throws SpecifiedObjectDoesNotExistsException;
	
	/**
	 * ������ĿID��ȡδ���ŵĹ���ȯ��Ϣ
	 * @param proId
	 * 		��Ŀ���
	 * @return
	 * @throws SpecifiedObjectDoesNotExistsException
	 */
	public PageFormater queryNotByPro(String proName, PageModel pageModel) throws SpecifiedObjectDoesNotExistsException;
}
