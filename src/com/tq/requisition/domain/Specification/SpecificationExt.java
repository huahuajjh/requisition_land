package com.tq.requisition.domain.Specification;

import com.tq.requisition.domain.Specification.expression.IHqlExpression;
import com.tq.requisition.domain.Specification.expression.OperationType;

/**
 * ��Լ������չ�࣬ʵ��������Լ�������Լ�������ӣ�����ʵ�����ó����ࡣ
 * @author jjh
 * @param <T>
 * 		�����Լ�Ķ���
 * @date 2015-12-21 22:39
 *
 */
public abstract class SpecificationExt<T>  extends Specification<T>{	
	/**
	 * ��ʵ�ָ÷������÷���Ӧ�÷���һ��hql���ʽ
	 */
	public abstract String getAbsHql();
	
	/**
	 * ��ʵ�ָ÷������÷���Ӧ�÷���һ��sql���ʽ
	 */
	public abstract String getAbsSql();
	
	/**
	 * ��ʵ�ָ÷������÷���Ӧ�÷���hql����sql���ʽ����Ҫ�Ĳ���
	 * @return
	 */
	public abstract Object[] getAbsParameters();
	
	/**
	 * ��ʵ�ָ÷������÷������ز������ʽ�Ĳ�������
	 * @return
	 */
	public abstract OperationType getAbsType();
	
	/**
	 * {@inheritDoc}
	 * @param t
	 */
	public SpecificationExt(Class<T> t) {
		super(t);
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public IHqlExpression getHqlExpression() {
		IHqlExpression expression = new IHqlExpression() {
			@Override
			public void setHql(String hql) {}
			
			@Override
			public void setSql(String sql) {}
			
			@Override
			public String getSql() {
				return getAbsSql();
			}
			
			@Override
			public String getHql() {
				return getAbsHql();
			}

			@Override
			public void setParameters(Object... objects) {}

			@Override
			public Object[] getParameters() {
				return getAbsParameters();
			}

			
			@Override
			public void setType(OperationType type) {}

			
			@Override
			public OperationType getType() {				
				if(getAbsType()==null)
				{					
					return OperationType.SQL;
				}
				return getAbsType();
			}			
		};
		return expression;
	}
}
