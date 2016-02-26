package com.tq.requisition.infrastructure.Specifications.account;

import org.hibernate.criterion.Restrictions;

import com.tq.requisition.domain.Specification.Specification;
import com.tq.requisition.domain.Specification.expression.ICriteriaExpression;
import com.tq.requisition.domain.Specification.expression.IHqlExpression;
import com.tq.requisition.domain.model.account.Account;
import com.tq.requisition.infrastructure.Specifications.Expression.CriteriaExpression;
import com.tq.requisition.infrastructure.Specifications.Expression.HqlExpression;

/**
 * ͨ���û���������֤�˻��������--��Լ
 * @author jjh
 * @time 2015-12-23 16:22
 */
public class UserExistsSpecification extends Specification<Account>{
	private Account account;
	
	public UserExistsSpecification(Class<Account> t,Account _account) {
		super(t);
		account = _account;
	}

	/**
	 * ��ȡhql���ʽ
	 * @return IHqlExpression
	 * 		hql���ʽʵ��
	 */
	@Override
	public IHqlExpression getHqlExpression() {
		HqlExpression hqlExpression = new HqlExpression();	
		hqlExpression.setParameters(new Object[]{account.getAccount(),account.getPwd()});		
		hqlExpression.setSql("select * from tb_account where account=? and pwd=?");
		return hqlExpression;
	}

	/**
	 * ��ȡCriteria���ʽ
	 * @return ICriteriaExpression
	 * 		Criteria���ʽʵ��
	 */
	@Override
	public ICriteriaExpression getCriteriaExpression() {
		CriteriaExpression criteriaExpression = new CriteriaExpression();
		criteriaExpression.setRestriction(Restrictions.eq("account", account.getAccount()))//
			.setRestriction(Restrictions.eq("pwd", account.getPwd()));
		return criteriaExpression;
	}
	
}
