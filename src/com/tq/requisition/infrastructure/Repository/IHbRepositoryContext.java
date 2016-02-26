package com.tq.requisition.infrastructure.Repository;

import org.hibernate.Session;

import com.tq.requisition.domain.IRepository.IRepositoryContext;

/**
 * hibernateʵ�ֵĲִ������ģ����Ǽ̳иýӿڵ�ʵ�ֶ���hibernate��ʵ��
 * @author jjh
 * @time 2015-12-17 12:42
 */
public interface IHbRepositoryContext extends IRepositoryContext{
	/**
	 * hibernate������
	 * @return Session
	 * 		������ʵ��
	 */
	Session session();
	
	/**
	 * ��������
	 */
	void beginTransaction();	
}
