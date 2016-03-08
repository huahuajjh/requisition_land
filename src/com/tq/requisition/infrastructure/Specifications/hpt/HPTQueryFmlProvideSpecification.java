package com.tq.requisition.infrastructure.Specifications.hpt;

import java.util.UUID;

import com.tq.requisition.domain.Specification.Specification;
import com.tq.requisition.domain.Specification.expression.IHqlExpression;
import com.tq.requisition.domain.Specification.expression.OperationType;
import com.tq.requisition.domain.model.housePuraseTicket.HousePuraseTicket;
import com.tq.requisition.infrastructure.Specifications.Expression.HqlExpression;

/**
 * ��ѯ��Լ�����ݻ������֤��ѯ�û����й���ȯ��Ϣ����Ա��Ϣ
 * @author jjh
 * @time 2015-01-04
 */
public class HPTQueryFmlProvideSpecification extends Specification<HousePuraseTicket>{
	private UUID fmlId;
	
	public HPTQueryFmlProvideSpecification(Class<HousePuraseTicket> _t,UUID fmlId) {
		super(_t);
		this.fmlId = fmlId;
	}

	@Override
	public IHqlExpression getHqlExpression() {
		IHqlExpression expression = new HqlExpression();
		StringBuilder sb = new StringBuilder();
		sb.append("select new com.tq.requisition.presentation.dto.hpt.HPTDisplayFmlDto(");
		sb.append(" fi.proName,fi.proId,h.id,fi.id,fi.name,fi.idNumber,h.ticketNumber,h.bonus,h.state,h.makeDate,fi.relationshipStr,fi.otherRelationship) ");
		sb.append(" from FamilyItem fi, Family f ,HousePuraseTicket h");
		sb.append(" where h.fmlItemId=fi.id and h.del=false and f.id=fi.fmlId and fi.fmlId=?");
		expression.setHql(sb.toString());
		expression.setParameters(fmlId);
		expression.setType(OperationType.HQL);
		return expression;
	}

}
