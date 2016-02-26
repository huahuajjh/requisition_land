package com.tq.requisition.infrastructure.Specifications.Expression;

import com.tq.requisition.domain.Specification.expression.IHqlExpression;
import com.tq.requisition.domain.Specification.expression.OperationType;
import com.tq.requisition.exception.ValidationNullException;

/**
 * hql�����ʽ
 * @author jjh
 * @time 2015-12-17 16:20
 *
 */
public final class HqlExpression extends IHqlExpression{
	/*private fields*/
	private String sqlQuery;
	private String hqlQuery;
	private Object[] objects;
	private OperationType type;
	
	/**
	 * ����sql���ʽ
	 * @param _hql
	 * 		hql���ʽ
	 */
	@Override
	public void setSql(String sql) {		
		sqlQuery = sql;
	}
	
	/**
	 * ��ȡhql���ʽ
	 * @return
	 * 		hql���ʽ
	 */
	@Override
	public String getSql() {
		if(sqlQuery == null)
		{
			throw new ValidationNullException("���õ�sql���ʽΪ�գ���ָ�����ز������ʽ���ͣ�Ĭ��SQL����");
		}
		return sqlQuery;
	}
	
	/**
	 * ����hql���ʽ
	 * @param hql
	 * 		hql���ʽ
	 */
	public void setHql(String hql) {
		hqlQuery = hql;
	}
	
	/**
	 * ��ȡhql���ʽ
	 * @param hql
	 * 		hql���ʽ
	 */
	@Override
	public String getHql() {
		if(hqlQuery == null)
		{
			throw new ValidationNullException("���õ�hql���ʽΪ�գ���ָ�����ز������ʽ���ͣ�Ĭ��SQL����");
		}
		return hqlQuery;
	}
	
	/**
	 * {@inheritDoc}
	 */

	@Override
	public void setParameters(Object... objects) {
		this.objects = objects;
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public Object[] getParameters() {
		return this.objects;
	}

	@Override
	public void setType(OperationType type) {
		this.type = type;
	}

	@Override
	public OperationType getType() {		
		if(type == null)
		{
			return OperationType.SQL;
		}
		return type;
	}

	
}
