package com.tq.requisition.infrastructure.Specifications.account;

import java.util.UUID;

import com.tq.requisition.domain.Specification.Specification;
import com.tq.requisition.domain.Specification.expression.IHqlExpression;
import com.tq.requisition.domain.Specification.expression.OperationType;
import com.tq.requisition.domain.model.account.Account;
import com.tq.requisition.infrastructure.Specifications.Expression.HqlExpression;

/**
 * ��Լ�������ű�ɾ���󣬸��²���idΪnull
 * @author jjh
 * @time 2015-12-26 15:55
 * @version 1.0
 */
public class UserUpdateDeptSpecification extends Specification<Account>{
	private String deptId;
	
	public UserUpdateDeptSpecification(Class<Account> _t,UUID _deptId) {
		super(_t);
		this.deptId = _deptId.toString();
	}

	@Override
	public IHqlExpression getHqlExpression() {
		IHqlExpression expression = new HqlExpression();
		expression.setSql("update tb_account set dept_id=? where dept_id=?");
		expression.setParameters(null,deptId);
		expression.setType(OperationType.SQL);
		return expression;
	}
	 
}
