package com.tq.requisition.domain.model.roleAccount;

import java.util.UUID;

import com.tq.requisition.domain.share.AggregateRoot;

/**
 * ��ɫ�û���ϵ�ۺϸ�
 * @author jjh
 * @time 2015-12-21 17:21
 */
public class RoleAccount  extends AggregateRoot{
	/*private fields*/
	/**�˻�id*/
	private UUID accountId;
	/**��ɫid*/
	private UUID roleId;
	/**�Ƿ�ɾ��*/
	private boolean del;
	
	/*constructors*/
	public RoleAccount(){}
	public RoleAccount(UUID id,UUID accountId, UUID roleId) {
		super();
		this.accountId = accountId;
		this.roleId = roleId;
		this.id = id;
		this.del = false;
	}
	
	/*getters and setters*/
	public UUID getAccountId() {
		return accountId;
	}
	public void setAccountId(UUID accountId) {
		this.accountId = accountId;
	}
	public UUID getRoleId() {
		return roleId;
	}
	public void setRoleId(UUID roleId) {
		this.roleId = roleId;
	}
	public void setId(UUID _id) {
		id = _id;
	}
	public UUID getId() {
		return id;
	}
	public void setDel(boolean isDel) {
		this.del = isDel;
	}
	public boolean getDel() {
		return this.del;
	}
	
	/*override toString*/
	@Override
	public String toString() {
		return "RoleAccount [accountId=" + accountId + ", roleId=" + roleId
				+ ", id=" + id + "]";
	}	
	
	/*public static methods*/
	public static RoleAccount obtain(UUID uid,UUID rid) {
		if(uid == null || rid == null)
		{
			throw new NullPointerException("�˻�id���߽�ɫidΪnull");
		}
		return new RoleAccount(UUID.randomUUID(),uid,rid);
	}

}
