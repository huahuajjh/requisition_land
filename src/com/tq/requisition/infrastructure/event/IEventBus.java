package com.tq.requisition.infrastructure.event;

/**
 * @description
 * 		�����ýӿڵ�ʵ��������һ���¼��ۺ�������
 * @author jjh
 * @time 2015-12-16 12:57
 */
public interface IEventBus {
	
	/**
	 * @description
	 * 		�¼����ķ���
	 * @param handler
	 * 		�¼�������
	 */
	void subscribe(IEventHandler<IEvent> handler);
	
	/**
	 * @description
	 * 		ȡ�����ķ���
	 * @param handler
	 * 		�¼�������
	 */
	void unsubscribe(IEventHandler<IEvent> handler);
	
	/**
	 * @description
	 * 		�����¼�	
	 * @param evt
	 * 		���������¼�
	 */
	void publish(IEvent evt);
}
