package com.tq.requisition.infrastructure.unitOfWork;

/**
 * ����ʵ�ָýӿڵ�����һ��uow��ʵ�֣���ģʽ��ʵ�����ڱ�֤����һ���ԡ�
 * @author jjh
 * @time 2015-12-14 14:46
 */
public interface IUnitOfWork {
	void beginTransaction();
	
	/**
	 * ����һ��booleanֵ����ֵ�����˵�ǰ��uow�����Ƿ��ύ 
	 * @return boolean
	 * 		�Ƿ��ύ
	 */
	boolean commited();
		
	/**
	 * ����һ��booleanֵ����ֵ�����˵�ǰ��uow�����Ƿ��ύ 
	 * @param isCommited
	 * 		�Ƿ��ύ
	 */
	void commited(boolean isCommited);
	
	/**�ύ��ǰuow����*/
	void commit();
	
	/**�ع���ǰuow����*/
	void rollback();
	
}
