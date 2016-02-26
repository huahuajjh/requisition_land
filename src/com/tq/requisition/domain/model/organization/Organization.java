package com.tq.requisition.domain.model.organization;

import java.util.UUID;

import com.tq.requisition.domain.share.AggregateRoot;

/**
 * ��֯�ۺϸ�
 * @author jjh
 * @time 2015-12-18 19:18 
 */
public class Organization extends AggregateRoot{
	/**��֯����*/
	private String orgName;
	/**�Ƿ�ɾ��*/
	private boolean del;
	/**��λ���*/
	private String orgNumber;
	
	/*constructors*/
	public Organization()
	{
	}
	public Organization(UUID id,String orgName,String orgNumber) {
		this.id = id;
		this.orgNumber = orgNumber;
		this.orgName = orgName;
		this.del = false;
	}


	/*private fields*/
	public void setId(UUID _id) {
		id = _id;
	}
	public UUID getId() {
		return id;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public boolean getDel() {
		return del;
	}
	public void setDel(boolean isDel) {
		this.del = isDel;
	}
	public String getOrgNumber() {
		return orgNumber;
	}
	public void setOrgNumber(String orgNumber) {
		this.orgNumber = orgNumber;
	}

	/*public methods*/
	public static Organization obtain(String name,String orgNumber) {
		if(name == null || name.trim().equals(""))
		{
			throw new NullPointerException("��֯����Ϊnull");
		}
		return new Organization(UUID.randomUUID(), name,orgNumber);
	}

	
}
