package com.tq.requisition.infrastructure.log;

/**
 * @description
 * 		��־�ӿڣ��̳иýӿ�ʵ����־ϵͳ��ʵ��
 * @author jjh
 * @time 2015-12-14 18:19
 */
public interface ILog {
	/**
	 *	info������־���
	 */	
	public void info(Object message);
	
	/**
	 *	info������־���
	 * @param className
	 * 		�����־��class name
	 * @param methodName
	 * 		�����־��method name
	 * @param message
	 * 		��־��Ϣ
	 */
	public void info(String className,String methodName,Object message);
	
	/**
	 *	debug������־���
	 */
	public void debug(Object message);
	
	/**
	 *	info������־���
	 * @param className
	 * 		�����־��class name
	 * @param methodName
	 * 		�����־��method name
	 * @param message
	 * 		��־��Ϣ
	 */
	public void debug(String className,String methodName,Object message);
		
	/**
	 *	error������־���
	 */
	public void error(Object message);
	
	/**
	 *	info������־���
	 * @param className
	 * 		�����־��class name
	 * @param methodName
	 * 		�����־��method name
	 * @param message
	 * 		��־��Ϣ
	 */
	public void error(String className,String methodName,Object message);
	
}
