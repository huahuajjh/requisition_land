package com.tq.requisition.domain.Specification;

/**
 * ���Լ����
 * @author jjh
 * @param <T>
 * 		�����Լ�Ķ���
 * @date 2015-12-16 16:54
 *
 */
public class AndSpecification<T> extends CompositeSpecification<T>{

	public AndSpecification(ISpecification<T> left, ISpecification<T> right,Class<T> t) {
		super(left, right,t);
	}

}
