package com.tq.requisition.presentation.dto.hpt;

import java.util.UUID;

public class HptUseAndCashQueryModel {
	
	/**ģ����ѯ��Ŀ*/
	private String proName;
	/**ģ����ѯ��Ա����*/
	private String name;
	/**��Ա�����֤*/
	private String idNumber;
	/**ģ����ѯ�ֵ�*/
	private UUID streetId;
	/**ģ����ѯ����*/
	private UUID communityId;
	/**ģ����ѯ������*/
	private UUID groupId;
	/**��ͥ��ԱID*/
	private UUID fmlItemId;
	
	private String address;
	
	public String getProName() {
		return proName;
	}
	
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public UUID getStreetId() {
		return streetId;
	}
	public void setStreetId(UUID streetId) {
		this.streetId = streetId;
	}
	public UUID getCommunityId() {
		return communityId;
	}
	public void setCommunityId(UUID communityId) {
		this.communityId = communityId;
	}
	public UUID getGroupId() {
		return groupId;
	}
	public void setGroupId(UUID groupId) {
		this.groupId = groupId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	public UUID getFmlItemId() {
		return fmlItemId;
	}
	public void setFmlItemId(UUID fmlItemId) {
		this.fmlItemId = fmlItemId;
	}
}
