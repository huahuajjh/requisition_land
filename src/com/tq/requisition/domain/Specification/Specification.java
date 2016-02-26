package com.tq.requisition.domain.Specification;

import org.apache.commons.lang3.NotImplementedException;

import com.tq.requisition.domain.Specification.expression.ICriteriaExpression;
import com.tq.requisition.domain.Specification.expression.IHqlExpression;


/**
 * ��Լ�ӿ�ʵ�ֵĳ����Լ��
 * @author jjh
 * @param <T>
 * 		�����Լ�Ķ���
 * @date 2015-12-16 16:50
 *
 */
public abstract class Specification<T> implements ISpecification<T>{
	protected Class<T> t;
	
	/**
	 * ��ʼ��
	 * @param t
	 * 		��Լ���Ͳ���
	 */
	public Specification(Class<T> _t)
	{
		if(t != null)
		{
			this.t = _t;
		}
	}

	@Override
	public boolean isSatisfiedBy(T t) {
		throw new NotImplementedException("");
	}

	@Override
	public ISpecification<T> and(ISpecification<T> another) {
		return new AndSpecification<>(this,another,t);
	}

	@Override
	public ISpecification<T> andNot(ISpecification<T> another) {
		return new AndNotSpecification<>(this,another,t);
	}

	@Override
	public ISpecification<T> or(ISpecification<T> another) {
		return new OrSpecification<>(this,another,t);
	}

	@Override
	public ISpecification<T> not() {
		return new NotSpecification<>(this,t);
	}
	
	/**
	 * ��ȡ�������ʽ
	 * @return HqlExpression
	 * 		hql���ʽ
	 */
	public IHqlExpression getHqlExpression(){
		throw new NotImplementedException("");
	}
	
	/**
	 * ��ȡ�������ʽ
	 * @return HqlExpression
	 * 		Criteria���ʽ
	 */
	public ICriteriaExpression getCriteriaExpression(){
		throw new NotImplementedException("");
	}

	
	/**
	 * {@inheritDoc}
	 */
	@Override
	public Class<T> getType() {
		return t;
	}
	
}
