package com.tq.requisition.domain.service.HPTServuceImpl;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.domain.IRepository.IRepositoryContext;
import com.tq.requisition.domain.model.familyMember.FamilyItem;
import com.tq.requisition.domain.model.familyMember.IFamilyItemRepository;
import com.tq.requisition.domain.model.housePuraseTicket.HPTExchangeInfo;
import com.tq.requisition.domain.model.housePuraseTicket.HPTMendInfo;
import com.tq.requisition.domain.model.housePuraseTicket.HPTProviderInfo;
import com.tq.requisition.domain.model.housePuraseTicket.HPTReportOfLossInfo;
import com.tq.requisition.domain.model.housePuraseTicket.HPTUseAndCash;
import com.tq.requisition.domain.model.housePuraseTicket.HousePuraseTicket;
import com.tq.requisition.domain.model.housePuraseTicket.IHPTRepository;
import com.tq.requisition.domain.service.BaseDomainService;
import com.tq.requisition.domain.service.idomainservice.IHPTService;
import com.tq.requisition.exception.DomainException;
import com.tq.requisition.exception.SpecifiedObjectDoesNotExistsException;
import com.tq.requisition.infrastructure.utils.Formater;
import com.tq.requisition.infrastructure.utils.PageFormater;
import com.tq.requisition.presentation.dto.hpt.HPTDisplayFmlDto;
import com.tq.requisition.presentation.dto.share.PageModel;

/**
 * ����ȯ�����������ӿ�
 * @author jjh
 * @time 2015-01-01 10:54
 */
public class HPTServiceImpl extends BaseDomainService implements IHPTService{
	private IFamilyItemRepository familyItemRepository;
	private IHPTRepository hptRepository;

	public HPTServiceImpl(//
			IRepositoryContext context,//
			IFamilyItemRepository familyItemRepository,//
			IHPTRepository hptreIhptRepository) {
		
		super(context);
		this.familyItemRepository = familyItemRepository;
		this.familyItemRepository.setAggregatorRootClass(FamilyItem.class);
		
		this.hptRepository = hptreIhptRepository;
		this.hptRepository.setAggregatorRootClass(HousePuraseTicket.class);
	}

	@Override
	public void addHPT(HousePuraseTicket hpt) throws DomainException {
		//�������Ĺ���ȯ�����������֤����Ǩ����Ϣ�в�ѯ�������ƥ���򲻲�����������Ϣ��������
		FamilyItem fi = familyItemRepository.queryByIdNumber(hpt.getIdNumber()); 
		if(fi == null)
		{
			throw new DomainException("����ʧ�ܣ�δ��ѯ����Ӧ�Ĳ�Ǩ��Ա��Ϣ");
		}
		//��������ȯ��Ϣ��ȯ����
		hptRepository.addHPT(hpt);
	}
	
	@Override
	public void addHPT(List<HousePuraseTicket> hpts) throws DomainException {
		if(hpts==null)
		{
			throw new NullPointerException("�������Ĺ���ȯ����Ϊ��");
		}
		for (HousePuraseTicket housePuraseTicket : hpts) {
			addHPT(housePuraseTicket);
		}
	}

	@Override
	public void exchange(HPTExchangeInfo exHPT,HousePuraseTicket newTicket) throws SpecifiedObjectDoesNotExistsException {
		hptRepository.exchange(exHPT, newTicket);
	}

	@Override
	public void provider(HPTProviderInfo revieveHPT) throws SpecifiedObjectDoesNotExistsException {
		hptRepository.provider(revieveHPT);
	}

	public void provideFml(List<HPTProviderInfo> list) {
		
	}
	
	@Override
	public void reportOfLoss(HPTReportOfLossInfo lossPHT)  throws SpecifiedObjectDoesNotExistsException{
		hptRepository.reportOfLoss(lossPHT);
	}

	@Override
	public void mend(HPTMendInfo mendHPT,HousePuraseTicket newTicket)  throws SpecifiedObjectDoesNotExistsException{
		hptRepository.mend(mendHPT, newTicket);
	}

	@Override
	public void useOrCash(HPTUseAndCash useAndCashHPT) throws SpecifiedObjectDoesNotExistsException {
			hptRepository.useOrCash(useAndCashHPT);
	}

	/**
	 * ���ݻ�����ݲ�ѯ�û�����ȯ��Ϣ
	 * @param idNumber
	 * 		�������֤
	 * @throws SpecifiedObjectDoesNotExistsException 
	 */
	public List<HPTDisplayFmlDto> queryByFml(String idNumber) throws SpecifiedObjectDoesNotExistsException {
		FamilyItem item = familyItemRepository.queryByIdNumber(idNumber);
		if(null == item){throw new NullPointerException("δ��ѯ��������Ϣ");}
		return hptRepository.queryFmlByFmlId(item.getFmlId());
	}

	@Override
	public PageFormater queryNotByPro(String proName, PageModel pageModel)
			throws SpecifiedObjectDoesNotExistsException {
		return hptRepository.queryNotFmlByFmlItem(proName, pageModel);
	}
		
}
