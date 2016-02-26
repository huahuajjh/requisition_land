package com.tq.requisition.presentation.dto.sysMgt;

import java.util.UUID;

/**
 * �û��˻�dto
 * @author jjh
 * @time 2015-12-21 16:34
 *
 */
public class AccountDto {
	/*private fields*/
	/**�˻�id*/
	private UUID id;
	/**�˻���*/
	private String account;
	/**�˻�����*/
	private String pwd;
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
	private Integer state;
	
	public String getDepName() {
		return depName;
	}

	public void setDepName(String depName) {
		this.depName = depName;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
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
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
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
	public UUID getOrgId() {
		return orgId;
	}
	public void setOrgId(UUID orgId) {
		this.orgId = orgId;
	}
	public UUID getRoleId() {
		return roleId;
	}
	public void setRoleId(UUID roleId) {
		this.roleId = roleId;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	
	/*constructors*/
	public AccountDto(UUID id, String account, String pwd, String name,
			UUID deptId, UUID orgId, UUID roleId, Integer state) {
		super();
		this.id = id;
		this.account = account;
		this.pwd = pwd;
		this.name = name;
		this.deptId = deptId;
		this.orgId = orgId;
		this.roleId = roleId;
		this.state = state;
	}
	
	public AccountDto(UUID id, String account, String pwd, String name,
			UUID deptId, String depName, UUID orgId, String orgName,
			UUID roleId, String roleName, Integer state) {
		super();
		this.id = id;
		this.account = account;
		this.pwd = pwd;
		this.name = name;
		this.deptId = deptId;
		this.depName = depName;
		this.orgId = orgId;
		this.orgName = orgName;
		this.roleId = roleId;
		this.roleName = roleName;
		this.state = state;
	}
	
	@Override
	public String toString() {
		return "AccountDto [id=" + id + ", account=" + account + ", pwd=" + pwd
				+ ", name=" + name + ", deptId=" + deptId + ", depName="
				+ depName + ", orgId=" + orgId + ", orgName=" + orgName
				+ ", roleId=" + roleId + ", roleName=" + roleName + ", state="
				+ state + "]";
	}

	public AccountDto(){}
}
