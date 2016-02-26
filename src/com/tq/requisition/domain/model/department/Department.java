package com.tq.requisition.domain.model.department;

import java.util.UUID;

import com.tq.requisition.domain.share.AggregateRoot;

/**
 * ���žۺϸ�
 * @author jjh
 * @time 2015-12-18 19:20 
 */
public class Department extends AggregateRoot{
	/**��������*/
	private String deptName;
	/**�Ƿ�ɾ��*/
	private boolean del;
	/**������֯id*/
	private UUID orgId;
	
	/*getters and setters*/
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public boolean getDel() {
		return del;
	}
	public void setDel(boolean del) {
		this.del = del;
	}
	public UUID getOrgId() {
		return orgId;
	}
	public void setOrgId(UUID orgId) {
		this.orgId = orgId;
	}
	public void setId(UUID _id) {
		id = _id;
	}
	public UUID getId() {
		return id;
	}
	
	/*constructors*/
	public Department(){}
	public Department(UUID id,String deptName, boolean del, UUID orgId) {
		super();
		this.deptName = deptName;
		this.del = del;
		this.id = id;
		this.orgId = orgId;
	}
	
	/*override toString*/
	@Override
	public String toString() {
		return "Department [deptName=" + deptName + ", del=" + del + ", orgId="
				+ orgId + ", id=" + id + "]";
	}
	
	/*public methods*/
	/**
	 * �޸Ĳ���
	 * @param dept
	 * 		���޸ĵĲ���ʵ��
	 */
	public void modify(Department dept)
	{
		this.deptName = dept.getDeptName();
		//this.del = dept.getDel();
		//this.orgId = dept.getOrgId();
	}
	
	public static Department obtain(String name,UUID _orgId) {
		if(name == null || _orgId == null)
		{
			throw new NullPointerException("�������ƻ�����֯idΪnull");
		}
		return new Department(UUID.randomUUID(),name, false, _orgId);
	}
}
