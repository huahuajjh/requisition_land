package com.tq.requisition.domain.Specification;

/**
 * ��Ϲ�Լ�ӿڣ�ʵ�ָýӿڵ�����Ϊ��Ϲ�Լ�ӿ����ͣ��������ṩ���ҽڵ�Ĺ�Լ����
 * �����Լ������Լ���ȱ�������ϳɹ�Լ��
 * @param <T>
 * 		ָ����ԼҪ����Ķ���
 * @author jjh
 * @time 2015-12-16 16:41
 */
public interface ICompositeSpecification<T> extends ISpecification<T>{
	/**
	 * ��ȡ��Ϲ�Լ����������ڵ�
	 * @return ISpecification<T>
	 * 		��Լ����
	 */
	ISpecification<T> left();
	
	/**
	 * ��ȡ��Ϲ�Լ���������ҽڵ�
	 * @return ISpecification<T>
	 * 		��Լ����
	 */
	ISpecification<T> right();

}
