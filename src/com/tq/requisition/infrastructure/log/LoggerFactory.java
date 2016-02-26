package com.tq.requisition.infrastructure.log;

/**
 * @description
 * 		log4j���������಻�ܱ��̳�
 * @author jjh
 * @time 2015-12-14 16:41
 */
public final class LoggerFactory {
	/**fields*/
	private final static ILog logger;
	
	private LoggerFactory(){}
	
	static{		
		logger = new LogImpl();
	}
	
	/**
	 * @description
	 * 		��ȡLogger����
	 * @return
	 * 		Logger����
	 */
	public final static ILog logger() {
		return logger;
	}
}
