package com.tq.requisition.domain.service.socialsecurity;

import java.util.List;

import com.tq.requisition.domain.IRepository.IRepositoryContext;
import com.tq.requisition.domain.Specification.SpecificationExt;
import com.tq.requisition.domain.Specification.expression.OperationType;
import com.tq.requisition.domain.model.familyMember.FamilyItem;
import com.tq.requisition.domain.model.familyMember.IFamilyItemRepository;
import com.tq.requisition.domain.model.socialsecurity.ISocialsecurityRepository;
import com.tq.requisition.domain.model.socialsecurity.SocialsecurityInfo;
import com.tq.requisition.domain.service.BaseDomainService;
import com.tq.requisition.domain.service.idomainservice.ISSService;
import com.tq.requisition.exception.DomainException;
import com.tq.requisition.exception.SpecifiedObjectDoesNotExistsException;

/**
 * �籣�����������
 * @author jjh
 * @time 2015-01-04 17:35
 */
public class SocialsecurityServiceImpl extends BaseDomainService implements ISSService{
	private ISocialsecurityRepository ssRepository;
	private IFamilyItemRepository itemRepository;
	
	public SocialsecurityServiceImpl(IRepositoryContext context,//
			ISocialsecurityRepository ssRepository,//
			IFamilyItemRepository itemRepository) {
		
		super(context);
		this.ssRepository = ssRepository;
		this.ssRepository.setAggregatorRootClass(SocialsecurityInfo.class);
		
		this.itemRepository = itemRepository;
		this.itemRepository.setAggregatorRootClass(FamilyItem.class);
	}

	@Override
	public void addSSInfo(final SocialsecurityInfo ss) throws DomainException {		
		ssRepository.addSS(ss);
		//��ǲ�Ǩ��Ա�籣״̬
		FamilyItem item = itemRepository.getByKey(FamilyItem.class, ss.getFmlItemId());
		if(null == item)
		{
			throw new SpecifiedObjectDoesNotExistsException("δ��ѯ��Ҫ�籣�Ĳ�Ǩ��Ա��Ϣ");
		}
		item.markSocialsecurityState();
		itemRepository.update(item);
	}

	@Override
	public void addSSBatch(List<SocialsecurityInfo> list)  throws DomainException  {
		final StringBuilder sb = new StringBuilder();
		for (int i = 0; i < list.size(); i++) {
			if(i==list.size()-1)
			{
				sb.append("'").append(list.get(i).getFmlItemId().toString()).append("'");
				break;
			}
			sb.append("'").append(list.get(i).getFmlItemId().toString()).append("',");
		}
		ssRepository.addBatch(list);
		int res = itemRepository.executeUpdate(new SpecificationExt<FamilyItem>(FamilyItem.class) {

			@Override
			public String getAbsHql() {
				// TODO Auto-generated method stub
				return null;
			}

			@Override
			public String getAbsSql() {
				return "update tb_family_item set is_socialsecurity=1 where id in("+sb.toString()+")";
			}

			@Override
			public Object[] getAbsParameters() {
				// TODO Auto-generated method stub
				return null;
			}

			@Override
			public OperationType getAbsType() {
				return OperationType.SQL;
			}
		});
		if(res!=list.size())
		{
			throw new RuntimeException("Ӱ�����������������һ��");
		}
		
	}
	
}
