package com.tq.requisition.presentation.dto.socialsecurityMgt;

import java.util.UUID;

public class SocialsecurityQueryModel {
	/**��Ŀid*/
	private String proName;
	/**�ֵ���ַid*/
	private UUID streetId;
	/**������ַid*/
	private UUID communityId;
	/**��id*/
	private UUID groupId;
	/**���֤*/
	private String idNumber;
	/**������Ա��Ϣ*/
	private String createUId;
	
	/*getters and setters*/
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
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getCreateUId() {
		return createUId;
	}
	public void setCreateUId(String createUId) {
		this.createUId = createUId;
	}
	
	/*constructors*/
	public SocialsecurityQueryModel(){}
	public SocialsecurityQueryModel(String proName, UUID streetId, UUID communityId) {
		super();
		this.proName = proName;
		this.streetId = streetId;
		this.communityId = communityId;
	}

}
