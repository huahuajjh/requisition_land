package com.tq.requisition.infrastructure.Repository.removeFamily;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.domain.IRepository.IRepositoryContext;
import com.tq.requisition.domain.Specification.Specification;
import com.tq.requisition.domain.Specification.expression.IHqlExpression;
import com.tq.requisition.domain.Specification.expression.OperationType;
import com.tq.requisition.domain.model.familyMember.FamilyItem;
import com.tq.requisition.domain.model.removeFamily.Family;
import com.tq.requisition.domain.model.removeFamily.IFamilyRepository;
import com.tq.requisition.infrastructure.Repository.HbRepository;
import com.tq.requisition.infrastructure.Specifications.Expression.HqlExpression;
import com.tq.requisition.infrastructure.Specifications.removeFamily.Fml4PrintSpecification;
import com.tq.requisition.infrastructure.Specifications.removeFamily.FmlBasicInfoSpecification;
import com.tq.requisition.infrastructure.Specifications.removeFamily.FmlQueryFuzzySpecification;
import com.tq.requisition.infrastructure.Specifications.removeFamily.FmlTotalCountSpecification;
import com.tq.requisition.infrastructure.utils.PageFormater;
import com.tq.requisition.infrastructure.utils.PageHelper;
import com.tq.requisition.presentation.dto.rmHousehold.FamilyBasicInfoDto;
import com.tq.requisition.presentation.dto.rmHousehold.FamilyQueryModel;
import com.tq.requisition.presentation.dto.share.PageModel;

/**
 * ��Ǩ���ۺϸ��ִ�ʵ����
 * @author jjh
 * @time 2015-12-29 21:34
 */
public class FamilyRepository extends HbRepository<Family> implements IFamilyRepository{

	public FamilyRepository(IRepositoryContext context) {
		super(context);
	}

	@Override
	public Family addFamily(Family fml) {
		if(fml.getItems()!=null)
		{
			for (final FamilyItem item : fml.getItems()) {
				item.setFmlId(fml.getId());
				if(item.getRelationshipStr().equals("����"))
				{
					fml.setHeadId(item.getId());
				}
				int count = getTotalCount(new Specification<Family>(Family.class) {
					@Override
					public IHqlExpression getHqlExpression() {
						IHqlExpression expression = new HqlExpression();
						String sqlStr = "select count(1) from tb_family_item where id_number = '" + item.getIdNumber() + "'";
						expression.setSql(sqlStr);
						expression.setType(OperationType.SQL);
						return expression;
					}
				});
				if(count > 0){
					throw new NullPointerException("ʧ��-���֤[" + item.getIdNumber() + "]�Ѿ�����");
				}
				add(item);
			}
		}
		add(fml);
		return fml;
	}

	@Override
	public PageFormater getListByFuzzy(FamilyQueryModel queryModel,
			PageModel pageModel) {
		int count = getTotalCount(new FmlTotalCountSpecification(Family.class, queryModel));
		if(count==0){
			return PageFormater.obtain(null, count); 
		}
		
		List<Family> list = getAll(new FmlQueryFuzzySpecification(Family.class, queryModel, pageModel));
		return PageFormater.obtain(list, count);
	}

	@Override
	public Family editFamily(Family fml) {
		Family f = getByKey(Family.class, fml.getId());
		if(null == f)
		{
			throw new NullPointerException("δ��ѯ��ָ���Ĳ�Ǩ������");
		}
		f.modify(fml);
		update(f);
		return f;
	}

	@Override
	public void deleteFamily(UUID id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Family> getFml4Print(String uuids) {
		List<Family> fmls = getAll(new Fml4PrintSpecification(Family.class, uuids));
		if(null==fmls || fmls.size()==0){return null;}
		return fmls;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public PageFormater getFmlBasicInfo(
			FamilyQueryModel queryModel, PageModel pageModel) {
		int count = getTotalCount(new FmlTotalCountSpecification(Family.class, queryModel));
		if(count==0){
			return PageFormater.obtain(null, count);
		}
		
		List<FamilyBasicInfoDto> list = getAllByHqlJoin(
				new FmlBasicInfoSpecification(Family.class, queryModel),//
				PageHelper.getPageIndex(pageModel.pageIndex, pageModel.pageSize), //
				pageModel.pageSize);
				
		return PageFormater.obtain(list, count);
	}

}
