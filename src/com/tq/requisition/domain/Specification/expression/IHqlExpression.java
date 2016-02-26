package com.tq.requisition.domain.Specification.expression;

/**
 * hql���ʽ������,ʵ�ָ����������һ��hql��ʽ�ı��ʽ
 * @author jjh
 * @time 2015-12-16 20::09
 */
public abstract class IHqlExpression implements IExpression{
	/**
	 * ����sql���ʽ
	 * @param _hql
	 * 		hql���ʽ
	 */
	public abstract void setSql(String sql);
	
	/**
	 * ����hql����sql���ʽ�Ĳ���
	 * @param objects
	 * 		��������	
	 */
	public abstract void setParameters(Object... objects);
	
	/**
	 * ��ȡhql����sql���ʽ�Ĳ���
	 * @return
	 */
	public abstract Object[] getParameters();
	
	/**
	 * ����hql���ʽ
	 * @param hql
	 * 		hql���ʽ
	 */
	public abstract void setHql(String hql);
	
	/**
	 * ��ȡsql���ʽ
	 * @return String
	 * 		sql���ʽ
	 */
	public abstract String getSql();
	
	/**
	 * ��ȡhql���ʽ
	 * @param hql
	 * 		hql���ʽ
	 */
	public abstract String getHql();
	
	/**
	 * ���õ�ǰ�������ʽ������
	 * @param type
	 * 		�������ʽ����
	 */
	public abstract void setType(OperationType type);
	
	/**
	 * ����һ��ö�٣�������ǰ�������ʽ������
	 * @return OperationType
	 * 		�������ʽ����
	 */
	public abstract OperationType getType();

}
