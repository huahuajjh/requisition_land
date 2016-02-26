package com.tq.requisition.presentation.dto.sysMgt;

import java.util.UUID;

import com.tq.requisition.domain.model.share.AccountState;

public class AccountSafeDto {
	/*private fields*/
	/**�˻�id*/
	private UUID id;
	/**�˻���*/
	private String account;
	/**����*/
	private String name;
	/**�˻���������id*/
	private UUID deptId;
	/**�˺�������������*/
	private String depName;
	/**�˻�������֯id*/
	private UUID orgId;
	/**�˺�������֯������*/
	private String orgName;
	/**�˻���ɫid*/
	private UUID roleId;
	/**�˻���ɫ����*/
	private String roleName;
	/**�˻�״̬*/
	private AccountState state;
	/**�˻�״̬�ַ���*/
	private String stateStr;
	
	/*construtors*/
	public AccountSafeDto(){}
	public AccountSafeDto(UUID id, String account, String name, UUID deptId,
			String depName, UUID orgId, String orgName, UUID roleId,
			String roleName,AccountState state) {
		super();
		this.id = id;
		this.account = account;
		this.name = name;
		this.deptId = deptId;
		this.depName = depName;
		this.orgId = orgId;
		this.orgName = orgName;
		this.roleId = roleId;
		this.roleName = roleName;
		this.state = state;
	}
	
	/*getters and setters*/
	public UUID getId() {
		return id;
	}
	public void setId(UUID id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public UUID getDeptId() {
		return deptId;
	}
	public void setDeptId(UUID deptId) {
		this.deptId = deptId;
	}
	public String getDepName() {
		return depName;
	}
	public void setDepName(String depName) {
		this.depName = depName;
	}
	public UUID getOrgId() {
		return orgId;
	}
	public void setOrgId(UUID orgId) {
		this.orgId = orgId;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public UUID getRoleId() {
		return roleId;
	}
	public void setRoleId(UUID roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public AccountState getState() {
		return state;
	}
	public void setState(AccountState state) {
		this.state = state;
	}
	public String getStateStr() {
		return stateStr;
	}
	public void setStateStr(String stateStr) {
		this.stateStr = stateStr;
	}
	
}
