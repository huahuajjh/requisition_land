package com.tq.requisition.infrastructure.Repository.transferMgt;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.domain.IRepository.IRepositoryContext;
import com.tq.requisition.domain.Specification.SpecificationExt;
import com.tq.requisition.domain.Specification.expression.OperationType;
import com.tq.requisition.domain.model.transferHouseholdInfo.ITransferInfoRepository;
import com.tq.requisition.domain.model.transferHouseholdInfo.TransferHouseholdInfo;
import com.tq.requisition.exception.DomainException;
import com.tq.requisition.exception.SpecifiedObjectDoesNotExistsException;
import com.tq.requisition.infrastructure.Repository.HbRepository;
import com.tq.requisition.infrastructure.Specifications.transferMgt.TransferAddCountSpecification;
import com.tq.requisition.infrastructure.Specifications.transferMgt.TransferAddQuerySpecification;
import com.tq.requisition.infrastructure.Specifications.transferMgt.TransferCountSpecification;
import com.tq.requisition.infrastructure.Specifications.transferMgt.TransferQueryFuzzySpecifiaction;
import com.tq.requisition.infrastructure.utils.PageFormater;
import com.tq.requisition.infrastructure.utils.PageHelper;
import com.tq.requisition.presentation.dto.share.PageModel;
import com.tq.requisition.presentation.dto.transferMgt.TransferInfo4AddDto;
import com.tq.requisition.presentation.dto.transferMgt.TransferInfoDto4Table;
import com.tq.requisition.presentation.dto.transferMgt.TransferInfoQueryModel;

/**
 * ת������ӿ�ʵ��
 * @author jjh
 * @time 2015-12-30 23:38
 */
public class TransferMgtRepository extends HbRepository<TransferHouseholdInfo> implements ITransferInfoRepository{

	public TransferMgtRepository(IRepositoryContext context) {
		super(context);
	}

	@Override
	public void addTransferInfo(final TransferHouseholdInfo entity) throws DomainException {
		if(entity==null)
		{
			throw new NullPointerException("����ת����ϢΪ��");
		}
		//����Ƿ��Ѿ�ת������
		boolean r = exists(new SpecificationExt<TransferHouseholdInfo>(TransferHouseholdInfo.class) {

			@Override
			public String getAbsHql() {
				// TODO Auto-generated method stub
				return null;
			}

			@Override
			public String getAbsSql() {
				return "select count(1) from tb_transfer_household_info where fml_item_id=?";
			}

			@Override
			public Object[] getAbsParameters() {
				if(entity.getFmlItemId()==null){throw new NullPointerException("��ԱidΪ��");}
				return new Object[]{entity.getFmlItemId().toString()};
			}

			@Override
			public OperationType getAbsType() {
				return OperationType.SQL;
			}
		});
		if(r){
			throw new DomainException("���û��Ѿ�ת������");
		}
		add(entity);
	}

	@Override
	public void addBatch(List<TransferHouseholdInfo> list) throws DomainException {
		if(list==null)
		{
			throw new NullPointerException("����ת����Ϣ����Ϊ��");
		}
		for (TransferHouseholdInfo transferHouseholdInfo : list) {
			addTransferInfo(transferHouseholdInfo);
		}
		
	}

	@Override
	public void editTransferInfo(TransferHouseholdInfo entity) throws SpecifiedObjectDoesNotExistsException {
		if(entity==null)
		{
			throw new NullPointerException("���޸ĵ�ת����ϢΪ�գ�δ��ѯ���ü�¼");
		}
		TransferHouseholdInfo t = getByKey(TransferHouseholdInfo.class, entity.getId());
		if(t==null)
		{
			throw new SpecifiedObjectDoesNotExistsException("ָ���༭�����ݲ�����");
		}
		t.modify(entity);
		update(t);
	}

	@Override
	public void editBact(List<TransferHouseholdInfo> list) throws SpecifiedObjectDoesNotExistsException {
		if(list==null)
		{
			throw new NullPointerException("���༭��ת����Ϣ����Ϊ��");
		}
		for (TransferHouseholdInfo transferHouseholdInfo : list) {
			editTransferInfo(transferHouseholdInfo);
		}
	}

	@Override
	public void deleteBact(UUID... uuids) {
		if(uuids==null)
		{
			throw new NullPointerException("��ɾ���Ķ���id������");
		}
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < uuids.length; i++) {
			if(i==uuids.length)
			{				
				sb.append("'").//
					append(uuids[i].toString()).//
					append("'");
				break;
			}
			sb.append("'").//
				append(uuids[i].toString()).//
				append("'").//
				append(",");
		}
		updateBySql("update tb_transfer_household_info set is_del=? where id in(?)", true,sb.toString());
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public PageFormater queryByFuzzy(
			TransferInfoQueryModel queryModel, PageModel pageModel) {
		int count = getTotalCount(new TransferCountSpecification(TransferHouseholdInfo.class	, queryModel));
		
		List<TransferInfoDto4Table> list = getAllByHqlJoin(//
				new TransferQueryFuzzySpecifiaction(TransferHouseholdInfo.class, queryModel),//
				PageHelper.getPageIndex(pageModel.pageIndex, pageModel.pageSize),//
				pageModel.pageSize);
		
		return PageFormater.obtain(list, count);
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public PageFormater queryByFuzzy4Add(TransferInfoQueryModel queryModel,
			PageModel pageModel) {
		int count = getTotalCount(new TransferAddCountSpecification(TransferHouseholdInfo.class, queryModel));
		
		//���δ��ѯ����¼��ֱ���˳�
		if(count==0){
			return PageFormater.obtain(null, count);
		}
		
		List<TransferInfo4AddDto> list = getAllByHqlJoin(//
				new TransferAddQuerySpecification(TransferHouseholdInfo.class, queryModel),//
				PageHelper.getPageIndex(pageModel.pageIndex, pageModel.pageSize),//
				pageModel.pageSize);
		
		return PageFormater.obtain(list, count);
	}
}
