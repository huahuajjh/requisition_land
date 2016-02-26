package com.tq.requisition.domain.model.registedAgricultureInfo;

import java.util.UUID;

import com.tq.requisition.domain.share.AggregateRoot;
import com.tq.requisition.exception.DomainException;

/**
 * �ڼ�ũҵ�˿ھۺϸ�
 * @author jjh
 * @time 2015-12-18 18:44
 */
public class RegistedAgricultureInfo extends AggregateRoot{
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
	
	public RegistedAgricultureInfo(){
		this.id = UUID.randomUUID();
		this.del = false;
	}
	
	/**
	 * �ֶμ��
	 * @throws DomainException
	 * 		�쳣
	 */
	public void check() throws DomainException {
		check(name, "��������Ϊ��");
		check(idNumber, "���֤����Ϊ��");
		check(address,"��ַ����Ϊ��");
		check(policyStr,"�������߲���Ϊ��");
		check(userStateStr,"��Ա״̬����Ϊ��");
	}

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

	public boolean getIsRemove() {
		return isRemove;
	}

	public void setIsRemove(boolean isRemove) {
		this.isRemove = isRemove;
	}

	public boolean getIsSetting() {
		return isSetting;
	}

	public void setIsSetting(boolean isSetting) {
		this.isSetting = isSetting;
	}

	public boolean getIsTransfer() {
		return isTransfer;
	}

	public void setIsTransfer(boolean isTransfer) {
		this.isTransfer = isTransfer;
	}

	public boolean getIsSocialSecurity() {
		return isSocialSecurity;
	}

	public void setIsSocialSecurity(boolean isSocialSecurity) {
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
	
	public void setId(UUID id) {
		this.id = id;
	}
	public UUID getId() {
		return this.id;
	}

	public boolean getDel() {
		return del;
	}

	public void setDel(boolean del) {
		this.del = del;
	}
	
	/*public methods*/
	public void modify(RegistedAgricultureInfo entity) {
		this.address = entity.getAddress();
		this.idNumber = entity.getIdNumber();
		this.isRemove = entity.getIsRemove();
		this.isSetting = entity.getIsSetting();
		this.isSocialSecurity = entity.getIsSocialSecurity();
		this.isTransfer = entity.getIsTransfer();
		this.name = entity.getName();
		this.policyStateId = entity.getPolicyStateId();
		this.policyStr = entity.getPolicyStr();
		this.userStateId = entity.getUserStateId();
		this.userStateStr = entity.getUserStateStr();
	}
	
}
