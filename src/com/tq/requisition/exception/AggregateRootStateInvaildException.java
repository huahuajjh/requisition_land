package com.tq.requisition.exception;

/**
 * ���������ö��ڶ���ĵ�ǰ״̬��Чʱ�������쳣
 * @author jjh
 * @time 2015-12-17 01:20
 */
@SuppressWarnings("serial")
public class AggregateRootStateInvaildException extends RuntimeException{
	public AggregateRootStateInvaildException(String message)
	{
		super(message);
	}
}
