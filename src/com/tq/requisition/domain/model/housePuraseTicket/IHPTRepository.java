package com.tq.requisition.domain.model.housePuraseTicket;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.domain.IRepository.IRepository;
import com.tq.requisition.domain.model.familyMember.FamilyItem;
import com.tq.requisition.exception.DomainException;
import com.tq.requisition.exception.SpecifiedObjectDoesNotExistsException;
import com.tq.requisition.infrastructure.utils.PageFormater;
import com.tq.requisition.presentation.dto.hpt.HPTDisplayDto;
import com.tq.requisition.presentation.dto.hpt.HPTDisplayFmlDto;
import com.tq.requisition.presentation.dto.hpt.HPTFuzzyQueryModel;
import com.tq.requisition.presentation.dto.hpt.HPTQueryModel;
import com.tq.requisition.presentation.dto.hpt.HPTReceiveTableDto;
import com.tq.requisition.presentation.dto.hpt.HptUseAndCashQueryModel;
import com.tq.requisition.presentation.dto.share.PageModel;

/**
 * ����ȯ�ִ��ӿ�
 * 
 * @author jjh
 * @time 2015-12-31 22:20
 */
public interface IHPTRepository extends IRepository<HousePuraseTicket> {
	/**
	 * ��������ȯ
	 * 
	 * @param hpt
	 *            �������Ĺ���ȯ
	 */
	void addHPT(HousePuraseTicket hpt) throws DomainException;

	/**
	 * ��ȯ����
	 * 
	 * @param exHPT
	 *            ��ȯ��Ϣ
	 * @param newTicket
	 *            ��ȯʵ��
	 */
	void exchange(HPTExchangeInfo exHPT, HousePuraseTicket newTicket)
			throws SpecifiedObjectDoesNotExistsException;

	/**
	 * ����ȯ��ȡ
	 * 
	 * @param revieveHPT
	 *            ��ȡ��Ϣ
	 */
	void provider(HPTProviderInfo revieveHPT)
			throws SpecifiedObjectDoesNotExistsException;

	/**
	 * ���ջ����Ź���ȯ
	 * 
	 * @param list
	 *            ������Ϣ����
	 */
	void provideByFml(List<HPTProviderInfo> list)
			throws SpecifiedObjectDoesNotExistsException;

	/**
	 * ����ȯ��ʧ
	 * 
	 * @param lossPHT
	 *            ��ʧ��Ϣ
	 */
	void reportOfLoss(HPTReportOfLossInfo lossPHT)
			throws SpecifiedObjectDoesNotExistsException;

	/**
	 * ����ȯ��ȯ
	 * 
	 * @param mendHPT
	 *            ��ȯ��Ϣ
	 * @param newTicket
	 *            ��ȯʵ��
	 */
	void mend(HPTMendInfo mendHPT, HousePuraseTicket newTicket)
			throws SpecifiedObjectDoesNotExistsException;

	/**
	 * ����ȯ��ʹ��
	 * 
	 * @param useAndCashHPT
	 *            ʹ����Ϣ
	 */
	void useOrCash(HPTUseAndCash useAndCashHPT)
			throws SpecifiedObjectDoesNotExistsException;

	/**
	 * ������������ȯ��Ϣ
	 * 
	 * @param list
	 *            ����ȯ��Ϣ����
	 */
	void addBatch(List<HousePuraseTicket> list) throws DomainException;

	/**
	 * ��ѯ����ȯ����̨��
	 * 
	 * @param queryModel
	 *            ��ѯmodel
	 * @return ���ط���̨��model
	 */
	PageFormater queryProvideTable(HPTFuzzyQueryModel queryModel,
			PageModel pageModel);

	/**
	 * ��ѯ�Ҹ�̨��
	 * 
	 * @param queryModel
	 *            ��ѯmodel
	 * @return �Ҹ�̨��model
	 */
	PageFormater queryUseTable(HPTFuzzyQueryModel queryModel,
			PageModel pageModel);

	/**
	 * ��ѯ����ȯ��ʹ����Ը�
	 * 
	 * @param queryModel
	 * @param pageModel
	 * @return
	 */
	PageFormater queryByPage(HptUseAndCashQueryModel queryModel,
			PageModel pageModel);

	/**
	 * �������֤�Ų�ѯ����ȯ����Ա��Ϣ
	 * 
	 * @param idNumber
	 *            ���֤
	 * @return ����ȯ����Ա��Ϣmodel
	 */
	List<HPTDisplayDto> queryByIdnumber(String idNumber);

	/**
	 * ���ݲ�ѯmodel��ѯ����ȯ����Ա��Ϣ
	 * 
	 * @param queryModel
	 *            ��ѯmodel
	 * @return HPTDisplayDto
	 */
	HPTDisplayDto queryByIdnumberAndTicketNum(HPTQueryModel queryModel);

	/**
	 * �������֤��ѯ�Ի�Ϊ��λ�Ĺ���ȯ��Ϣ
	 * 
	 * @param idNumber
	 *            �������֤
	 * @return �����Ĺ���ȯ��Ϣ����
	 */
	List<HPTDisplayFmlDto> queryFmlByFmlId(UUID fmlId);

	/**
	 * ������Ա��ѯδ���Ź���ȯ�б�
	 * @param fmlItem
	 * 		��Ա�б�
	 * @param pageModel
	 * 		��ҳ����
	 * @return
	 */
	PageFormater queryNotFmlByFmlItem(String proName,
			PageModel pageModel);
	
	/**
	 * ��ȡ���еķ���̨������
	 * @param proName
	 * 		��Ŀ����
	 * @return
	 */
	List<HPTReceiveTableDto> getHPTReceiveTableDtoAll(String proName);
}
