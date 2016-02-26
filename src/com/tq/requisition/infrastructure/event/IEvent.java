package com.tq.requisition.infrastructure.event;

import java.util.Date;
import java.util.UUID;

/**
 * ����ʵ�ָýӿ�������һ���¼�
 * @author jjh
 * @time 2015-12-16 12:46
 */
public interface IEvent {
	/**
	 * @description
	 * 		��ȡ������һ���¼�id
	 * @return UUID
	 * 		����һ��UUID��������
	 */
	UUID getUUID();
	void setUUID(UUID uuid);
	
	/**
	 * @description
	 * 		��ȡ������һ��ʱ���
	 * @return UUID
	 * 		����һ���������͵�ʱ���
	 */
	Date getTimeStamp();
	void setDate(Date timeStamp);
	
}
