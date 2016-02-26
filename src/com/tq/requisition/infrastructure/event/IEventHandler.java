package com.tq.requisition.infrastructure.event;

/**
 * @description
 * 		����ʵ�ָýӿڵ�������һ���¼�������
 * @author jjh
 * @time 2015-12-16 12:54
 */
public interface IEventHandler<TEvent extends IEvent> {
	/**
	 * @description
	 * 		�¼�������������
	 * @param evt
	 * 		�¼��ӿ�ʵ��
	 */
	void handle(TEvent evt);
}
