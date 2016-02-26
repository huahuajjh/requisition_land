package com.tq.requisition.domain.model.socialsecurityType;

import java.util.UUID;

import com.tq.requisition.domain.share.AggregateRoot;

/**
 * �籣����������
 * @author jjh
 * @time 2015-12-18 16:39
 */
public class SocialsecurityType extends AggregateRoot{
	/**�籣��������*/
	private String name;
	
	/*getters and setters*/
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setId(UUID id) {
		this.id = id;
	}
	public UUID getId() {
		return this.id;
	}
	
	/*constructors*/
	public SocialsecurityType(){
		this.id = UUID.randomUUID();
	}
	public SocialsecurityType(UUID id,String name) {
		this();
		this.name = name;
	}
	
	/*public methods*/
	public static SocialsecurityType obtain(UUID id,String name) {
		return new SocialsecurityType(UUID.randomUUID(), name);
	}
	
}
