package com.tq.requisition.infrastructure.Repository.fmlItem;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.domain.IRepository.IRepositoryContext;
import com.tq.requisition.domain.Specification.SpecificationExt;
import com.tq.requisition.domain.Specification.expression.OperationType;
import com.tq.requisition.domain.model.familyMember.FamilyItem;
import com.tq.requisition.domain.model.familyMember.IFamilyItemRepository;
import com.tq.requisition.exception.SpecifiedObjectDoesNotExistsException;
import com.tq.requisition.infrastructure.Repository.HbRepository;
import com.tq.requisition.infrastructure.Specifications.familyItem.FmlItemQueryFuzzySpecification;
import com.tq.requisition.infrastructure.Specifications.familyItem.FmlItemTotalItemCountSpecification;
import com.tq.requisition.infrastructure.utils.PageFormater;
import com.tq.requisition.presentation.dto.rmHousehold.FamilyItemQueryModel;
import com.tq.requisition.presentation.dto.share.PageModel;

public class FamilyItemRepository extends HbRepository<FamilyItem> implements IFamilyItemRepository{

	public FamilyItemRepository(IRepositoryContext context) {
		super(context);
	}

	@Override
	public PageFormater queryByFuzzy(FamilyItemQueryModel queryModel,
			PageModel pageModel) {
		int count = getTotalCount(new FmlItemTotalItemCountSpecification(FamilyItem.class, queryModel));
		if(count==0){
			return PageFormater.obtain(null, count);
		}
		
		List<FamilyItem> list = getAll(new FmlItemQueryFuzzySpecification(FamilyItem.class, queryModel, pageModel));
		return PageFormater.obtain(list, count);
	}

	@Override
	public FamilyItem editFamilyItem(FamilyItem item) {
		FamilyItem i = getByKey(FamilyItem.class, item.getId());
		if(null==i)
		{
			throw new NullPointerException("δ��ѯ��ָ���Ĳ�Ǩ����Ա��Ϣ");
		}
		i.modify(item);
		update(i);
		return i;
	}

	@Override
	public void deleteFamilyItem(UUID id) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public FamilyItem queryByIdNumber(final String idNumber) throws SpecifiedObjectDoesNotExistsException {
		List<FamilyItem> item = getAll(new SpecificationExt<FamilyItem>(FamilyItem.class) {

			@Override
			public String getAbsHql() {
				// TODO Auto-generated method stub
				return null;
			}

			@Override
			public String getAbsSql() {
				return "select * from tb_family_item where id_number=?";
			}

			@Override
			public Object[] getAbsParameters() {
				return new Object[]{idNumber};
			}

			@Override
			public OperationType getAbsType() {
				return OperationType.SQL;
			}
		});
		if(item==null || item.size()<=0)
		{
			throw new SpecifiedObjectDoesNotExistsException("δ��ѯ�������֤��������Ӧ�ļ�¼");
		}
		return item.get(0);
	}
	
	@Override
	public boolean existsByIdNumAndName(final String idNumber, final String name) {
		boolean r = exists(new SpecificationExt<FamilyItem>(FamilyItem.class) {

			@Override
			public String getAbsHql() {
				// TODO Auto-generated method stub
				return null;
			}

			@Override
			public String getAbsSql() {
				return "select count(1) from tb_family_item where id_number=? and name=?";
			}

			@Override
			public Object[] getAbsParameters() {
				return new Object[]{idNumber,name};
			}

			@Override
			public OperationType getAbsType() {
				return OperationType.SQL;
			}
			
		});
		
		if(r)
		{
			return true;
		}
		return false;
	}
	
	@Override
	public List<FamilyItem> queryItemsByFmlId(final UUID fmlId) {
		if(null==fmlId){throw new NullPointerException("��Ǩ��idΪ��");}
		List<FamilyItem> list = getAll(new SpecificationExt<FamilyItem>(FamilyItem.class) {

			@Override
			public String getAbsHql() {
				// TODO Auto-generated method stub
				return null;
			}

			@Override
			public String getAbsSql() {
				return "select * from tb_family_item where fml_id=?";
			}

			@Override
			public Object[] getAbsParameters() {
				return new Object[]{fmlId.toString()};
			}

			@Override
			public OperationType getAbsType() {
				return OperationType.SQL;
			}
		});
		if(null==list||list.size()==0)
		{
			return null;
		}
		return list;
	}
	
	@Override
	public FamilyItem queryByIdNumberAndName(final String idNumber,final String name) {
		List<FamilyItem> items = getAll(new SpecificationExt<FamilyItem>(FamilyItem.class) {

			@Override
			public String getAbsHql() {
				// TODO Auto-generated method stub
				return null;
			}

			@Override
			public String getAbsSql() {
				return "select * from tb_family_item where id_number=? and name=?";
			}

			@Override
			public Object[] getAbsParameters() {
				return new Object[]{idNumber,name};
			}

			@Override
			public OperationType getAbsType() {
				return OperationType.SQL;
			}
		});
		if(items==null || items.size()==0)
		{
			throw new NullPointerException("δ��ѯ����Ӧ�Ĳ�Ǩ��Ա��Ϣ");
		}
		return items.get(0);
	}

	
	@Override
	public UUID getIdByIdNumber(String idnumber) {
		return getIdByUniqueCol("select id from tb_family_item where id_number=?", idnumber);
	}
	
}
