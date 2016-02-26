package com.tq.requisition.domain.model.householdType;

import java.util.UUID;

import com.tq.requisition.domain.share.AggregateRoot;

/**
 * �������ʾۺϸ���ά���������������ֵ�������
 * @author jjh
 * @time 2015-12-18 16:37
 */
public class HouseholdType extends AggregateRoot{
	/**��������*/
	private String name;

	public UUID getId() {
		return id;
	}

	public void setId(UUID id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	/*constructors*/
	public HouseholdType(){
		this.id = UUID.randomUUID();
	}
	public HouseholdType(UUID id,String name) {
		this();
		this.name = name;
	}
	
	/*public methods*/
	public static HouseholdType obtain(UUID id,String name) {
		return new HouseholdType(UUID.randomUUID(), name);
	}	
	
}
