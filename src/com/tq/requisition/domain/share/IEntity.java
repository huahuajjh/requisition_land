package com.tq.requisition.domain.share;

import java.util.UUID;

/**
 * domainʵ��ӿڣ�����ʵ�ָýӿڵ�ʵ����domainʵ��
 * @author jjh
 * @time 2015-12-14 13:20 
 */
public interface IEntity {
	/**
	 * ��ȡһ��id
	 * @return UUID
	 * 		UUID
	 */
	UUID id();
	
	/**
	 * ����һ��id
	 * @param id
	 * 		UUID
	 */
	void id(UUID _id);
}
