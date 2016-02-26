package com.tq.requisition.infrastructure.Specifications.account;

import java.util.UUID;

import com.tq.requisition.domain.Specification.Specification;
import com.tq.requisition.domain.Specification.expression.IHqlExpression;
import com.tq.requisition.domain.Specification.expression.OperationType;
import com.tq.requisition.domain.model.account.Account;
import com.tq.requisition.infrastructure.Specifications.Expression.HqlExpression;

/**
 * ��Լ�������˻��ִ����Ѿ���ɾ���˵�������֯�Ͳ���
 * @author jjh
 * @time 2015-12-26 15:11
 */
public class UserUpdateOrgSpecification extends Specification<Account>{
	private String orgId;

	public UserUpdateOrgSpecification(Class<Account> _t,UUID _orgId) {
		super(_t);
		this.orgId = _orgId.toString();
	}

	@Override
	public IHqlExpression getHqlExpression() {
		IHqlExpression expression = new HqlExpression();
		expression.setSql("update tb_account set org_id=?,dept_id=? where org_id=?");
		expression.setParameters(null,null,orgId);
		expression.setType(OperationType.SQL);
		return expression;
	}
}
