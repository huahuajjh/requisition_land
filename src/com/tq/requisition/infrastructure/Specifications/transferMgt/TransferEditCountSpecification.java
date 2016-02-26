package com.tq.requisition.infrastructure.Specifications.transferMgt;

import java.util.ArrayList;
import java.util.List;

import com.tq.requisition.domain.Specification.Specification;
import com.tq.requisition.domain.Specification.expression.IHqlExpression;
import com.tq.requisition.domain.Specification.expression.OperationType;
import com.tq.requisition.domain.model.transferHouseholdInfo.TransferHouseholdInfo;
import com.tq.requisition.infrastructure.Specifications.Expression.HqlExpression;
import com.tq.requisition.presentation.dto.transferMgt.TransferInfoQueryModel;

/**
 * �༭�Լ�����ת���Ĳ�ѯ������Լ
 * @author jjh
 * @time 2015-12-31 16:34
 *
 */
public class TransferEditCountSpecification extends Specification<TransferHouseholdInfo>{
	private TransferInfoQueryModel queryModel;
	
	public TransferEditCountSpecification(Class<TransferHouseholdInfo> _t,TransferInfoQueryModel queryModel) {
		super(_t);
		this.queryModel = queryModel;		
	}

	@Override
	public IHqlExpression getHqlExpression() {
		IHqlExpression expression = new HqlExpression();
		//���ʽ
		StringBuilder sb = new StringBuilder();
		//�����б�
		List<Object> list = new  ArrayList<Object>();
		sb.append("select count(1) from tb_transfer_household_info t ");
		sb.append("inner join tb_family_item f on f.id=t.fml_item_id");
		if(queryModel.getProId()!=null)
		{
			sb.append(" inner join tb_project p on p.id=f.pro_id ");
		}
		sb.append(" where 1=1 ");
		if(queryModel.getCommunityId()!=null)
		{
			sb.append(" and t.community_id=?");
			list.add(queryModel.getCommunityId().toString());
		}
		if(queryModel.getStreetId()!=null)
		{
			sb.append(" and t.street_id=?");
			list.add(queryModel.getStreetId().toString());
		}
		Object[] objects = new Object[list.size()];
		for (int i = 0; i < objects.length; i++) {
			objects[i] = list.get(i);					
		}		
		expression.setSql(sb.toString());
		expression.setType(OperationType.SQL);
		return expression;
	}	
}
