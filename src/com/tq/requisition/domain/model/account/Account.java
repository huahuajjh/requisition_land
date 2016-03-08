package com.tq.requisition.domain.model.account;

import java.util.UUID;

import com.tq.requisition.domain.model.share.AccountState;
import com.tq.requisition.domain.share.AggregateRoot;
import com.tq.requisition.exception.AccountOperationException;
import com.tq.requisition.exception.ChangePwdException;

/**
 * �˻��ۺϸ�
 * @author jjh
 * @time 2015-12-18 16:46
 */
public class Account extends AggregateRoot{
	/*private fields*/
	/**�û���*/
	private String account;
	/**����*/
	private String pwd;
	/**����*/
	private String name;
	/**״̬*/
	private Integer state;
	/**��������id*/
	private UUID deptId;
	/**������֯id*/
	private UUID orgId;
	/**��ɫid*/
	private UUID roleId;
	
	/*override toString*/
	@Override
	public String toString() {
		return "Account [account=" + account + ", pwd=" + pwd + ", name="
				+ name + ", state=" + state + ", deptId=" + deptId + ", orgId="
				+ orgId + ", id=" + id + "]";
	}

	/*constructors*/
	public Account() {}
	public Account(UUID id,String account, String pwd, String name, Integer state,
			UUID deptId, UUID orgId,UUID _roleId) {
		super();
		this.account = account;
		this.pwd = "1234567";
		this.name = name;
		this.state = AccountState.ENABLE.toValue();
		this.deptId = deptId;
		this.orgId = orgId;
		this.id = UUID.randomUUID();
		this.roleId = _roleId;		
	}

	/*getters and setters*/
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
	public Integer getState() {
		return state;
	}
	public void setState(Integer _state) {
		this.state = _state;
	}
	public UUID getId() {
		return id;
	}
	public void setId(UUID id) {
		this.id = id;
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

	/*public methods*/
	/**
	 * ���˻�
	 */
	public void lockAccount() {
		this.state = AccountState.LOCKED.toValue();
	}
	
	/**
	 * �����˻�
	 */
	public void disableAccount() {
		this.state = AccountState.DISABLE.toValue();
	}
	
	/**
	 * �����˻�
	 */
	public void enableAccount() {
		this.state = AccountState.ENABLE.toValue();
	}

	/**
	 * �޸�����
	 * @param oldPwd
	 * 		������
	 * @param newPwd
	 * 		������
	 * @throws ChangePwdException
	 * 		�׳��쳣����
	 */
	public void changePwd(String oldPwd,String newPwd) throws ChangePwdException {
		if(!oldPwd.equals(this.pwd))
		{
			throw new ChangePwdException("���������");
		}		
		if(oldPwd.equals(newPwd))
		{
			throw new ChangePwdException("�����벻������������ͬ");
		}
		if(newPwd.length() <= 6)
		{
			throw new ChangePwdException("���볤�Ȳ���С��6");
		}
		this.pwd = newPwd;
	}
	
	/**
	 * �����˻�
	 * @throws AccountOperationException
	 * 		�˻������쳣 
	 */
	public void accountCheck() throws AccountOperationException {
		if(pwd.length() <= 2)
		{
			throw new AccountOperationException("���볤�Ȳ���С��3");
		}
		if(account.length() <= 2)
		{
			throw new AccountOperationException("�˻������Ȳ���С��3");
		}
	}
	
	public static Account obtain(String _account,String _pwd,String _name,UUID _deptId,UUID _orgId) {
		return new Account(UUID.randomUUID(), _account, _pwd, _name, AccountState.ENABLE.toValue(), _deptId, _orgId, null);
	}
	
	public void modify(Account temp) throws AccountOperationException {
		this.account = temp.getAccount();
		this.deptId = temp.getDeptId();
		this.orgId = temp.getOrgId();
		this.name = temp.getName();
		this.state = temp.getState();
		this.roleId = temp.roleId;
		accountCheck();
	}
	
	/**
	 * �������룬Ĭ��1234567
	 */
	public void resetPwd() {
		this.pwd = "1234567";
	}
}
