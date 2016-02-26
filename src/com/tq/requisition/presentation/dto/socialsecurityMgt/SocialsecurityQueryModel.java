package com.tq.requisition.presentation.dto.socialsecurityMgt;

import java.util.UUID;

public class SocialsecurityQueryModel {
	/**��Ŀid*/
	private UUID proId;
	/**�ֵ���ַid*/
	private UUID streetId;
	/**������ַid*/
	private UUID communityId;
	/**��id*/
	private UUID groupId;
	/**���֤*/
	private String idNumber;
	
	/*getters and setters*/
	public UUID getProId() {
		return proId;
	}
	public void setProId(UUID proId) {
		this.proId = proId;
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
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	
	/*constructors*/
	public SocialsecurityQueryModel(){}
	public SocialsecurityQueryModel(UUID proId, UUID streetId, UUID communityId) {
		super();
		this.proId = proId;
		this.streetId = streetId;
		this.communityId = communityId;
	}

}
