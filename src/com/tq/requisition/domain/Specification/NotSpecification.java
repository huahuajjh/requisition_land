package com.tq.requisition.domain.Specification;

/**
 * ���Լ����
 * @author jjh
 * @param <T>
 * 		�����Լ�Ķ���
 * @date 2015-12-16 17:07
 *
 */
public class NotSpecification<T> extends Specification<T>{

	public NotSpecification(ISpecification<T> specification,Class<T> t) {
		super(t);
	}

}
