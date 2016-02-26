package com.tq.requisition.presentation.dto.rmHousehold;

import java.util.UUID;

/**
 * 家庭户查询model
 * @author jjh
 * @time 2015-12-29 19:57
 */
public class FamilyQueryModel {
	/*private fields*/
	/**身份证号*/
	private String idNumber;
	/**项目id*/
	private UUID proId;
	/**街道地址id*/
	private UUID streetId;
	/**社区地址id*/
	private UUID communityId;
	/**组地址id*/
	private UUID groupId;
	/**户主姓名*/
	private String name;
		
	/*getters and setters*/
 	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
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
	@Override
	public String toString() {
		return "FamilyQueryModel [idNumber=" + idNumber + ", proId=" + proId
				+ ", streetId=" + streetId + ", communityId=" + communityId
				+ "]";
	}
	public UUID getGroupId() {
		return groupId;
	}
	public void setGroupId(UUID groupId) {
		this.groupId = groupId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
