package com.tq.requisition.infrastructure.Specifications.familyItem;

import java.util.ArrayList;
import java.util.List;

import com.tq.requisition.domain.Specification.Specification;
import com.tq.requisition.domain.Specification.expression.IHqlExpression;
import com.tq.requisition.domain.Specification.expression.OperationType;
import com.tq.requisition.domain.model.familyMember.FamilyItem;
import com.tq.requisition.infrastructure.Specifications.Expression.HqlExpression;
import com.tq.requisition.infrastructure.utils.PageHelper;
import com.tq.requisition.infrastructure.utils.ThreeState;
import com.tq.requisition.presentation.dto.rmHousehold.FamilyItemQueryModel;
import com.tq.requisition.presentation.dto.share.PageModel;

public class FmlItemQueryFuzzySpecification extends Specification<FamilyItem>{
	private FamilyItemQueryModel queryModel;
	private PageModel pageModel;
	
	public FmlItemQueryFuzzySpecification(Class<FamilyItem> _t,FamilyItemQueryModel queryModel,PageModel pageModel) {
		super(_t);
		this.queryModel = queryModel;
		this.pageModel = pageModel;
	}

	@Override
	public IHqlExpression getHqlExpression() {
		IHqlExpression expression = new HqlExpression();
		List<Object> list = new ArrayList<Object>();
		StringBuilder sb = new StringBuilder();
		sb.append("select * from tb_family_item as fi,tb_family as f where fi.fml_id=f.id ");
		
		if(queryModel.getCreateUId() != null && !queryModel.getCreateUId().equals("")){
			sb.append(" and f.create_uId='" + queryModel.getCreateUId() + "'");
		}
		//�Ƿ�ת��
		if(queryModel.getIsTransfer() == ThreeState.YES)
		{
			sb.append(" and fi.is_transferd=1");
		}
		//�Ƿ�ת��
		if(queryModel.getIsTransfer() == ThreeState.NO)
		{
			sb.append(" and fi.is_transferd=0");
		}
		//�Ƿ������籣
		if(queryModel.getIsSSecurity()==ThreeState.YES)
		{
			sb.append(" and fi.is_socialsecurity=1");
		}
		//�Ƿ������籣
		if(queryModel.getIsSSecurity()==ThreeState.NO)
		{
			sb.append(" and fi.is_socialsecurity=0");
		}
		if(queryModel.isHalf() == ThreeState.YES)
		{
			sb.append(" and fi.is_half=1");
		}
		if(queryModel.isHalf() == ThreeState.NO)
		{
			sb.append(" and fi.is_half=0");
		}
		if(queryModel.getCommunityId()!=null)
		{
			sb.append(" and fi.street_id=?");
			list.add(queryModel.getStreetId().toString());
		}
		if(queryModel.getCommunityId()!=null)
		{
			sb.append(" and fi.community_id=?");
			list.add(queryModel.getCommunityId().toString());
		}
		if(queryModel.getGroupId()!=null)
		{
			sb.append(" and fi.group_id=?");
			list.add(queryModel.getGroupId().toString());
		}
		if(queryModel.getIdNumber()!=null)
		{
			sb.append(" and fi.id_number=?");
			list.add(queryModel.getIdNumber());
		}
		if(queryModel.getProName()!=null)
		{
			sb.append(" and fi.pro_name like " + "'%" + queryModel.getProName() + "%'");
		}
		if(queryModel.getAddress()!=null && !queryModel.getAddress().equals(""))
		{
			sb.append(" and fi.address like " + "'%" + queryModel.getAddress() + "%'");
		}
		if(null!=queryModel.getName() && !(queryModel.getName().trim().equals("")))
		{
			sb.append(" and fi.name  like '%" + queryModel.getName() + "%'");
		}
		//������Ů
		if(queryModel.getIsOnlyChild()==ThreeState.YES)
		{
			sb.append(" and fi.only_child_number is not null");
		}
		//������Ů
		if(queryModel.getIsOnlyChild()==ThreeState.NO)
		{
			sb.append(" and fi.only_child_number is null");
		}
		
		//��ҳ
		sb.append(" limit ?,?");
		list.add(PageHelper.getPageIndex(pageModel.pageIndex, pageModel.pageSize));
		list.add(pageModel.pageSize);
		
		Object[] objects = new Object[list.size()];
		for (int i = 0; i < objects.length; i++) {
			objects[i] = list.get(i);
		}	
		
		expression.setParameters(objects);
		expression.setSql(sb.toString());
		expression.setType(OperationType.SQL);
		return expression;
	}
}
