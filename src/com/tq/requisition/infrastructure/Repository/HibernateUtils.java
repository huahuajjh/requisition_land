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
 * hibernate工具类，用于初始化SessionFactory,此类不能被继承
 * 
 * @author jjh
 * @time 2015-12-17 13:04
 */
public class HibernateUtils {
	private static Session SESSION_THREAD_LOCAL = null; 
	private static SessionFactory FACTORY;
	
	private HibernateUtils() {
	}

	static {
		try {
			//优先使用web方式读取
			StandardServiceRegistry registry;
			try {
				registry = new StandardServiceRegistryBuilder()
						.configure("hibernate.cfg.xml").build();
			} catch (Exception e) {
				throw new HibernateException("HibernateUtils异常，初始化工厂异常-"+e.getMessage());
			}
			FACTORY = new MetadataSources(registry)
					.buildMetadata().buildSessionFactory();
		} catch (HibernateException e) {
			LoggerFactory
					.logger()
					.error("com.tq.requisition.infrastructure.Repository.HibernateUtils",
							"static code block", e.getMessage());
			throw new HibernateException("HibernateUtils异常，初始化工厂异常-"+e.getMessage());
		}
	}

	/**
	 * 获取session工厂
	 * @return
	 */
	public static SessionFactory sessionFactory() {
		return FACTORY;
	}
	
	public static SessionFactory rebuiltSessionFactory() {
		throw new NotImplementedException("未实现的rebuiltSessionFactory方法");
	}
	
	/**
	 * 获取Session实例
	 * 
	 * @return Session Session实例
	 */
	public static Session session() {
		
		Session session = SESSION_THREAD_LOCAL;
		if(session == null)
		{
			SESSION_THREAD_LOCAL = FACTORY.openSession();
			session = SESSION_THREAD_LOCAL;			
		}
		if(!(session.isOpen()))
		{
			SESSION_THREAD_LOCAL = FACTORY.openSession();
		}
		return SESSION_THREAD_LOCAL;
	}
	
	/**
	 * 关闭session
	 */
	public static void closeSession() {
		Session session = SESSION_THREAD_LOCAL;
		try  
        {  
            if (session != null && session.isOpen())  
            {
                session.close();  
            }
        }  
		catch(HibernateException e){
			LoggerFactory.logger().error("com.tq.requisition.infrastructure.Repository.HibernateUtils","closeSession()", "关闭session出现异常-jjh"+e.getMessage());
			throw e;
		}
	}
	
	/**
	 * 开启事务
	 */
	public static void beginTransaction() {

	}
	
	/**
	 * 提交事务
	 */
	public static void commitTransaction() {
		
	}
	
}
