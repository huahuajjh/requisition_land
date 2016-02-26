package com.tq.requisition.domain.model.role;

import java.util.UUID;

import com.tq.requisition.domain.share.AggregateRoot;

/**
 * ��ɫ�ۺϸ�
 * @author jjh
 * @time 2015-12-18 16:49
 */
public class Role extends AggregateRoot{
	/*private fields*/
	private String roleName;
	private boolean del;
	
	/*getters and setters*/
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public boolean getDel() {
		return del;
	}
	public void setDel(boolean isDel) {
		this.del = isDel;
	}	
	public void setId(UUID _id) {
		id = _id;		
	}
	public UUID getId() {
		return id;
	}

	/*constructors*/	
	public Role(){}
	public Role(UUID id,String roleName, boolean del) {
		this.roleName = roleName;
		this.del = del;
		this.id = id;
	}
	
	/*override*/
	@Override
	public String toString() {
		return "Role [roleName=" + roleName + ", del=" + del + "]";
	}
	
	/*public methods*/
	/**
	 * �޸Ľ�ɫ
	 * @param role
	 * 		���޸ĵĽ�ɫʵ��
	 */
	public void modify(Role role)
	{
		this.roleName = role.getRoleName();
		//this.del = role.getDel();
	}

	/**
	 * ����ɫ���Ƿ�Ϊ��
	 */
	public void checkRoleNameNull() {
		if(this.roleName == null)
		{
			throw new NullPointerException("��ɫ���Ʋ���Ϊ��");
		}
	}
	
	public static Role obtain(String roleName) {
		if(roleName == null)
		{
			throw new NullPointerException("������ɫʵ�������쳣����ɫ��Ϊnull");
		}
		return new Role(UUID.randomUUID(),roleName,false);
	}
	
}
