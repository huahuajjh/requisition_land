package com.tq.requisition.domain.Specification;

/**
 * ���Լ����
 * @author jjh
 * @param <T>
 * 		�����Լ�Ķ���
 * @date 2015-12-16 17:07
 *
 */
public class OrSpecification<T> extends CompositeSpecification<T>{
	public OrSpecification(ISpecification<T> left, ISpecification<T> right,Class<T> t) {
		super(left, right,t);
	}

}
