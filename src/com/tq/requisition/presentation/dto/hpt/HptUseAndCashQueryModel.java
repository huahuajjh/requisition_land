package com.tq.requisition.presentation.dto.hpt;

import java.util.UUID;

public class HptUseAndCashQueryModel {
	
	/**ģ����ѯ��Ŀ*/
	private String proName;
	/**ģ����ѯ��Ա����*/
	private String name;
	/**ģ����ѯ�ֵ�*/
	private UUID streetId;
	/**ģ����ѯ����*/
	private UUID communityId;
	/**ģ����ѯ������*/
	private UUID groupId;
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
}
