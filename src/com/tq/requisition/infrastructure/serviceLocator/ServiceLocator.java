package com.tq.requisition.infrastructure.serviceLocator;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.tq.requisition.infrastructure.log.LoggerFactory;

/*
 * @description
 * 		����λ��
 * @author jjh
 * @time 2015-12-14 23:42
 */
public final class ServiceLocator implements IServiceLocator {
	/* fields */
	private static ServiceLocator instance;
	private static ApplicationContext springContext;

	static {
//		String path = ServiceLocator.class.getResource("").getPath();
//		path = path.substring(1,path.indexOf("classes/"));
//		path+="config/spring.xml";
//		try {
//			springContext = new FileSystemXmlApplicationContext(path);
//			instance = new ServiceLocator();
//		} catch (Exception e) {
//			LoggerFactory.logger().error(ServiceLocator.class.getName(), "static block", e.getMessage());
//		}
		try {
			springContext = new ClassPathXmlApplicationContext(
					"../config/spring.xml");
		} catch (BeansException e) {
			// ���web��ȡ����ʧ�ܣ�������ļ�ϵͳ��ȡ
			springContext = new FileSystemXmlApplicationContext(
					"WebRoot/WEB-INF/config/spring.xml");
		}

	}

	/*
	 * @description ��ȡ����λ��ʵ��
	 * 
	 * @return IServiceLocator ����һ������λ���ӿ�����
	 */
	public static IServiceLocator instance() {
		if(null==instance){
			return new ServiceLocator();
		}
		return instance;
	}

	/* ctors */
	private ServiceLocator() {
	}

	/*
	 * @description ���ݷ������Ͳ�������ȡһ������ʵ��
	 * 
	 * @param serviceType �������Ͳ���
	 * 
	 * @return TService ��������
	 */
	@Override
	public <TService> TService getService(Class<TService> serviceType) {
		return springContext.getBean(serviceType);
	}

	/*
	 * @description ���ݷ������Ͳ�������ȡһ������ʵ��
	 * 
	 * @param serviceType �������Ͳ���
	 * 
	 * @param springId ����bean�ڵ�id
	 * 
	 * @return TService ��������
	 */
	@Override
	public <TService> TService getService(String springId,
			Class<TService> serviceType) {
		try {
			return springContext.getBean(springId, serviceType);
		} catch (Exception e) {
			LoggerFactory.logger().error(ServiceLocator.class.getName(), "getService(String,Class<TService>)", e.getMessage());
			return null;
		}
	}

}
