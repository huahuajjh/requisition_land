package com.tq.requisition.domain.service.transferMgt;

import java.util.List;

import com.tq.requisition.domain.IRepository.IRepositoryContext;
import com.tq.requisition.domain.model.familyMember.FamilyItem;
import com.tq.requisition.domain.model.familyMember.IFamilyItemRepository;
import com.tq.requisition.domain.model.transferHouseholdInfo.ITransferInfoRepository;
import com.tq.requisition.domain.model.transferHouseholdInfo.TransferHouseholdInfo;
import com.tq.requisition.domain.service.BaseDomainService;
import com.tq.requisition.domain.service.idomainservice.ITransferMgtService;
import com.tq.requisition.exception.DomainException;

/**
 * ת������ҵ��ӿ�ʵ��
 * @author jjh
 * @time 2015-12-30 19:09
 */
public class TransferMgtServiceImpl extends BaseDomainService implements ITransferMgtService{
	private ITransferInfoRepository transferInfoRepository;
	private IFamilyItemRepository itemRepository;
	
	public TransferMgtServiceImpl(IRepositoryContext context,//
			ITransferInfoRepository transferInfoRepository,//
			IFamilyItemRepository itemRepository) {
		super(context);
		this.transferInfoRepository = transferInfoRepository;
		this.transferInfoRepository.setAggregatorRootClass(TransferHouseholdInfo.class);
		
		this.itemRepository = itemRepository;
		this.itemRepository.setAggregatorRootClass(FamilyItem.class);
	}

	@Override
	public void addTransferInfo(TransferHouseholdInfo model) throws DomainException {
		transferInfoRepository.addTransferInfo(model);
		
		//���²�Ǩ��Աת����Ϣ
		FamilyItem item = itemRepository.getByKey(FamilyItem.class, model.getFmlItemId());
		
		//��Ǳ���Ǩ��Աת��״̬
		if(null == item)
		{
			throw new NullPointerException("δ��ѯ��ת����Ӧ�Ĳ�Ǩ��Ա��Ϣ");
		}
		item.setHouseholdId(model.getHouseHoldTypeId());
		item.setHouseholdStr(model.getHouseHoldTypeStr());
		item.markTransferState();
		itemRepository.update(item);				
	}

	@Override
	public void addBatchTransferInfo(List<TransferHouseholdInfo> list) throws DomainException {
		if(null == list || list.size()==0){throw new NullPointerException("������ת����Ϣ����Ϊ��");}
		//�־û�ת����Ϣ
		transferInfoRepository.addBatch(list);
		//���²�Ǩ��Ա��Ϣ
		for (TransferHouseholdInfo transferHouseholdInfo : list) {
			FamilyItem item = itemRepository.getByKey(FamilyItem.class, transferHouseholdInfo.getFmlItemId());
			if(null==item){throw new DomainException("δ��ѯ��ת����Ϣ");}
			item.transferHousehold(transferHouseholdInfo);
			itemRepository.update(item);
		}
	}

	@Override
	public void editBatchTransferInfo(List<TransferHouseholdInfo> list) {
		// TODO Auto-generated method stub
		
	}
	
}
