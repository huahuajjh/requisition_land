package com.tq.requisition.domain.share;

import java.util.UUID;

/**
 * ʵ�������
 * @author jjh
 * @time 2015-12-19 18:48 
 */
public abstract class Entity implements IEntity{
	protected UUID id;
	
	/**
	 * ��ȡһ��id
	 * @return UUID
	 * 		UUID
	 */
	//@Override
	public UUID id() {
		return id;
	}

	/**
	 * ����һ��id
	 * @param id
	 * 		UUID
	 */
	//@Override
	public void id(UUID _id) {
		this.id = _id;
	}
	
}
