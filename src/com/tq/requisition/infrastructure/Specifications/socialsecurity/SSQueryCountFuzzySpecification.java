package com.tq.requisition.infrastructure.Specifications.socialsecurity;

import com.tq.requisition.domain.Specification.Specification;
import com.tq.requisition.domain.Specification.expression.IHqlExpression;
import com.tq.requisition.domain.Specification.expression.OperationType;
import com.tq.requisition.domain.model.socialsecurity.SocialsecurityInfo;
import com.tq.requisition.infrastructure.Specifications.Expression.HqlExpression;
import com.tq.requisition.presentation.dto.socialsecurityMgt.SocialsecurityQueryModel;

/**
 * ���ݲ�ѯmodel��ѯ�籣��Ϣ�ܼ�¼������Լ
 * @author jjh
 * @time 2015-12-31 20:26
 */
public class SSQueryCountFuzzySpecification extends Specification<SocialsecurityInfo>{
	private SocialsecurityQueryModel queryModel;
	
	public SSQueryCountFuzzySpecification(Class<SocialsecurityInfo> _t,SocialsecurityQueryModel queryModel) {
		super(_t);
		this.queryModel = queryModel;
	}

	@Override
	public IHqlExpression getHqlExpression() {
		IHqlExpression expression = new HqlExpression();
		StringBuilder sb = new StringBuilder();
		sb.append("select count(1) from tb_socialsecurity_info t inner join tb_family_item i ");
		sb.append(" where i.id=t.fml_item_id and is_del=0");
		if(queryModel.getProId()!=null)
		{
			sb.append(" and i.pro_id='"+queryModel.getProId().toString()+"'");
		}
		if(queryModel.getCommunityId()!=null)
		{
			sb.append(" and i.community_id='"+queryModel.getCommunityId().toString()+"'");
		}
		if(queryModel.getStreetId()!=null)
		{
			sb.append(" and i.street_id='"+queryModel.getStreetId().toString()+"'");
		}
		if(queryModel.getGroupId()!=null){
			sb.append(" and i.group_id='"+queryModel.getGroupId().toString()+"'");
		}
		if(queryModel.getIdNumber()!=null && !(queryModel.getIdNumber().trim().equals(""))){
			sb.append(" and i.id_number='"+queryModel.getIdNumber()+"'");
		}
		expression.setSql(sb.toString());
		expression.setType(OperationType.SQL);
		return expression;
	}

}