package com.tq.requisition.domain.Specification;

/**
 * ��Ϲ�Լ�ӿ�ʵ�ֵĳ����Լ��
 * @author jjh
 * @param <T>
 * 		�����Լ�Ķ���
 * @date 2015-12-16 16:58
 *
 */
public abstract class CompositeSpecification<T> extends Specification<T> implements ICompositeSpecification<T>{
	private ISpecification<T> left;
	private ISpecification<T> right;
	
	public CompositeSpecification(ISpecification<T> left,ISpecification<T> right,Class<T> t) {
		super(t);
		this.left = left;
		this.right = right;
	}
	
	/**
	 * ��ȡ��Ϲ�Լ����������ڵ�
	 * @return ISpecification<T>
	 * 		��Լ����
	 */
	public ISpecification<T> left() {
		return this.left;
	}
	
	/**
	 * ��ȡ��Ϲ�Լ���������ҽڵ�
	 * @return ISpecification<T>
	 * 		��Լ����
	 */
	public ISpecification<T> right() {
		return this.right;
	}
	
}
