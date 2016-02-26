package com.tq.requisition.infrastructure.serviceLocator;

/*
 * @description
 * 		����λ���ӿڣ��ýӿڶ����˻�ȡ�������
 * @author jjh
 * @time 2015-12-14 23:22
 */
public interface IServiceLocator {
	/**
	 * @description
	 * 		���ݷ������Ͳ�������ȡһ������ʵ��
	 * @param serviceType
	 * 		�������Ͳ���
	 * @return  TService
	 * 		��������
	 */
	<TService> TService getService(Class<TService> serviceType);
	
	/*
	 * @description
	 * 		���ݷ������Ͳ�������ȡһ������ʵ��
	 * @param serviceType
	 * 		�������Ͳ���
	 * @param springId
	 * 		 ����bean�ڵ�id
	 * @return  TService
	 * 		��������
	 */
	<TService> TService getService(String springId,Class<TService> serviceType);

}
