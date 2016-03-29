package com.tq.requisition.infrastructure.Repository;

import org.apache.commons.lang3.NotImplementedException;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import com.tq.requisition.infrastructure.log.LoggerFactory;

/**
 * hibernate�����࣬���ڳ�ʼ��SessionFactory,���಻�ܱ��̳�
 * 
 * @author jjh
 * @time 2015-12-17 13:04
 */
public class HibernateUtils {
	private static ThreadLocal<Session> SESSION_THREAD_LOCAL = null; 
	private static SessionFactory FACTORY;

	private HibernateUtils() {
	}

	static {
		try {
			//����ʹ��web��ʽ��ȡ
			StandardServiceRegistry registry;
			try {
				registry = new StandardServiceRegistryBuilder()
						.configure("hibernate.cfg.xml").build();
			} catch (Exception e) {
				throw new HibernateException("HibernateUtils�쳣����ʼ�������쳣-"+e.getMessage());
			}
			FACTORY = new MetadataSources(registry)
					.buildMetadata().buildSessionFactory();
		} catch (HibernateException e) {
			LoggerFactory
					.logger()
					.error("com.tq.requisition.infrastructure.Repository.HibernateUtils",
							"static code block", e.getMessage());
			throw new HibernateException("HibernateUtils�쳣����ʼ�������쳣-"+e.getMessage());
		}
	}

	/**
	 * ��ȡsession����
	 * @return
	 */
	public static SessionFactory sessionFactory() {
		return FACTORY;
	}
	
	public static SessionFactory rebuiltSessionFactory() {
		throw new NotImplementedException("δʵ�ֵ�rebuiltSessionFactory����");
	}
	
	/**
	 * ��ȡSessionʵ��
	 * 
	 * @return Session Sessionʵ��
	 */
	public static Session session() {	
		if(SESSION_THREAD_LOCAL == null){
			SESSION_THREAD_LOCAL = new ThreadLocal<>();
		}
		Session session = SESSION_THREAD_LOCAL.get();		
		if(session == null)
		{
			SESSION_THREAD_LOCAL.set(FACTORY.openSession());
			session = SESSION_THREAD_LOCAL.get();
		}
		if(!(session.isOpen()))
		{
			SESSION_THREAD_LOCAL.set(FACTORY.openSession());
		}
		
		int retry = 30;
		for (int i = 0; i < retry; i++) {
			try {
				SESSION_THREAD_LOCAL.get().createSQLQuery("select 1").list();
				break;
			} catch (Exception e) {
				SESSION_THREAD_LOCAL.set(FACTORY.openSession());
			}
		}
		
		return SESSION_THREAD_LOCAL.get();
	}
	
	/**
	 * �ر�session
	 */
	public static void closeSession() {
		if(SESSION_THREAD_LOCAL == null){
			return;
		}
		Session session = SESSION_THREAD_LOCAL.get();
		try  
        {  
            if (session != null && session.isOpen())  
            {
                session.close();  
            }
        }  
		catch(HibernateException e){
			LoggerFactory.logger().error("com.tq.requisition.infrastructure.Repository.HibernateUtils","closeSession()", "�ر�session�����쳣-jjh"+e.getMessage());
			throw e;
		}
	}
	
	/**
	 * ��������
	 */
	public static void beginTransaction() {

	}
	
	/**
	 * �ύ����
	 */
	public static void commitTransaction() {
		
	}
	
}
