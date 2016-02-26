package com.tq.requisition.domain.Specification;

import com.tq.requisition.domain.Specification.expression.ICriteriaExpression;
import com.tq.requisition.domain.Specification.expression.IHqlExpression;


/**
 * ��Լ�ӿڣ�����ʵ�ָýӿڵ�������һ�ֹ�Լʵ��
 * @author jjh
 * @time 2015-12-14 13:27 
 * @param <T>
 * 		Ӧ�ù�Լ�����Ͳ���
 */
public interface ISpecification<T> {
	/**
	 * ����һ��booleanֵ�������ù�Լ�Ƿ�ƥ�������t����
	 * @param t
	 * 		�ù�Լ���õĶ���
	 * @return boolean
	 * 		�Ƿ���Ϲ�Լ
	 */
	boolean isSatisfiedBy(T t);
	
	/**
	 * ��ȡT���Ͳ�����Class
	 * @return Class<T>
	 */
	Class<T> getType();
	
	/**
	 * ���ӵ�ǰ��Լ�͸����Ĺ�Լ���󣬷������Ӻ�Ĺ�Լ���󣬸úϲ���Ĺ�Լ����
	 * �����˸����Ĺ�Լ����͵�ǰ��Լ������붼����ָ���Ķ���
	 * @param another
	 * 		��������һ����Լ����
	 * @return ISpecification<T>
	 * 		�ϲ���Ĺ�Լ����
	 */
	ISpecification<T> and(ISpecification<T> another);
	
	/**
	 * ���ӵ�ǰ��Լ�͸����Ĺ�Լ���󣬷������Ӻ�Ĺ�Լ���󣬸úϲ���Ĺ�Լ����
	 * �����˸����Ĺ�Լ����Ӧ������ָ�����󣬶���ǰ��Լ����ָ������
	 * @param another
	 * 		��������һ����Լ����
	 * @return ISpecification<T>
	 * 		�ϲ���Ĺ�Լ����
	 */
	ISpecification<T> andNot(ISpecification<T> another);
	
	/**
	 * ���ӵ�ǰ��Լ�͸����Ĺ�Լ���󣬷������Ӻ�Ĺ�Լ���󣬸úϲ���Ĺ�Լ����
	 * �����˸����Ĺ�Լ����͵�ǰ��Լ��������һ������ָ���Ķ���
	 * @param another
	 * 		��������һ����Լ����
	 * @return ISpecification<T>
	 * 		�ϲ���Ĺ�Լ����
	 */
	ISpecification<T> or(ISpecification<T> another);
	
	/**
	 * ��ת��Լ���߼���ͬʱ���ط�ת�߼��Ĺ�Լ����
	 * @return ISpecification<T>
	 * 		��ת��Ĺ�Լ����
	 */
	ISpecification<T> not();
	
	/**
	 * ��ȡ�������ʽ
	 * @return HqlExpression
	 * 		hql���ʽ
	 */
	IHqlExpression getHqlExpression();
	
	/**
	 * ��ȡ�������ʽ
	 * @return HqlExpression
	 * 		Criteria���ʽ
	 */
	ICriteriaExpression getCriteriaExpression();
	
}
