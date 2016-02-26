package com.tq.requisition.infrastructure.Specifications.familyItem;

import java.util.ArrayList;
import java.util.List;

import com.tq.requisition.domain.Specification.Specification;
import com.tq.requisition.domain.Specification.expression.IHqlExpression;
import com.tq.requisition.domain.Specification.expression.OperationType;
import com.tq.requisition.domain.model.familyMember.FamilyItem;
import com.tq.requisition.infrastructure.Specifications.Expression.HqlExpression;
import com.tq.requisition.infrastructure.utils.ThreeState;
import com.tq.requisition.presentation.dto.rmHousehold.FamilyItemQueryModel;

public class FmlItemTotalItemCountSpecification extends Specification<FamilyItem>{	
	private FamilyItemQueryModel queryModel;
	
	public FmlItemTotalItemCountSpecification(Class<FamilyItem> _t,FamilyItemQueryModel queryModel) {
		super(_t);
		this.queryModel = queryModel;
	}

	@Override
	public IHqlExpression getHqlExpression() {
		IHqlExpression expression = new HqlExpression();
		List<Object> list = new ArrayList<Object>();
		StringBuilder sb = new StringBuilder();
		sb.append("select count(1) from tb_family_item where 1=1 ");
		//�Ƿ�ת��
		if(queryModel.getIsTransfer() == ThreeState.YES)
		{
			sb.append(" and is_transferd=1");
		}
		//�Ƿ�ת��
		if(queryModel.getIsTransfer() == ThreeState.NO)
		{
			sb.append(" and is_transferd=0");
		}
		//�Ƿ������籣
		if(queryModel.getIsSSecurity()==ThreeState.YES)
		{
			sb.append(" and is_socialsecurity=1");
		}
		//�Ƿ������籣
		if(queryModel.getIsSSecurity()==ThreeState.NO)
		{
			sb.append(" and is_socialsecurity=0");
		}
		if(queryModel.isHalf() == ThreeState.YES)
		{
			sb.append(" and is_half=1");
		}
		if(queryModel.isHalf() == ThreeState.NO)
		{
			sb.append(" and is_half=0");
		}
		if(queryModel.getCommunityId()!=null)
		{
			sb.append(" and street_id=?");
			list.add(queryModel.getStreetId().toString());
		}
		if(queryModel.getCommunityId()!=null)
		{
			sb.append(" and community_id=?");
			list.add(queryModel.getCommunityId().toString());
		}
		if(queryModel.getGroupId()!=null)
		{
			sb.append(" and group_id=?");
			list.add(queryModel.getGroupId().toString());
		}
		if(queryModel.getIdNumber()!=null)
		{
			sb.append(" and id_number=?");
			list.add(queryModel.getIdNumber());
		}
		if(queryModel.getProId()!=null)
		{
			sb.append(" and pro_id=?");
			list.add(queryModel.getProId().toString());
		}
		if(null!=queryModel.getName() && !(queryModel.getName().trim().equals("")))
		{
			sb.append(" and name=?");
			list.add(queryModel.getName());
		}
		//������Ů
		if(queryModel.getIsOnlyChild()==ThreeState.YES)
		{
			sb.append(" and only_child_number is not null");
		}
		//������Ů
		if(queryModel.getIsOnlyChild()==ThreeState.NO)
		{
			sb.append(" and only_child_number is null");
		}
		
		
		Object[] objects = new Object[list.size()];
		for (int i = 0; i < objects.length; i++) {
			objects[i] = list.get(i);
		}
		expression.setSql(sb.toString());
		expression.setParameters(objects);
		expression.setType(OperationType.SQL);
		return expression;
	}
	
}
