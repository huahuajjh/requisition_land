package com.tq.requisition.presentation.dto.registedAgr;

import java.util.UUID;

public class RegistedAgricultureInfoDto {
	/**id*/
	private UUID id;
	/**����*/
	private String name;
	/**���֤��*/
	private String idNumber;
	/**��ַ*/
	private String address;
	/**�Ƿ��Ǩ*/
	private boolean isRemove;
	/**�Ƿ���*/
	private boolean isSetting;
	/**�Ƿ�ת��*/
	private boolean isTransfer;
	/**�Ƿ��籣*/
	private boolean isSocialSecurity;
	/**��������*/
	private UUID policyStateId;
	/**��Ա״̬*/
	private UUID userStateId;
	/**ʹ�������ַ���*/
	private String policyStr;
	/**��Ա״̬�ַ���*/
	private String userStateStr;
	/**�Ƿ�ɾ��*/
	private boolean del;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public boolean isRemove() {
		return isRemove;
	}
	public void setRemove(boolean isRemove) {
		this.isRemove = isRemove;
	}
	public boolean isSetting() {
		return isSetting;
	}
	public void setSetting(boolean isSetting) {
		this.isSetting = isSetting;
	}
	public boolean isTransfer() {
		return isTransfer;
	}
	public void setTransfer(boolean isTransfer) {
		this.isTransfer = isTransfer;
	}
	public boolean isSocialSecurity() {
		return isSocialSecurity;
	}
	public void setSocialSecurity(boolean isSocialSecurity) {
		this.isSocialSecurity = isSocialSecurity;
	}
	public UUID getPolicyStateId() {
		return policyStateId;
	}
	public void setPolicyStateId(UUID policyStateId) {
		this.policyStateId = policyStateId;
	}
	public UUID getUserStateId() {
		return userStateId;
	}
	public void setUserStateId(UUID userStateId) {
		this.userStateId = userStateId;
	}
	public String getPolicyStr() {
		return policyStr;
	}
	public void setPolicyStr(String policyStr) {
		this.policyStr = policyStr;
	}
	public String getUserStateStr() {
		return userStateStr;
	}
	public void setUserStateStr(String userStateStr) {
		this.userStateStr = userStateStr;
	}
	public boolean isDel() {
		return del;
	}
	public void setDel(boolean del) {
		this.del = del;
	}
	public UUID getId() {
		return id;
	}
	public void setId(UUID id) {
		this.id = id;
	}
	
}
