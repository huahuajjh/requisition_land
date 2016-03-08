package com.tq.requisition.presentation.dto.hpt;

import java.util.UUID;

public class HptUseAndCashQueryModel {
	
	/**模糊查询项目*/
	private String proName;
	/**模糊查询人员名称*/
	private String name;
	/**模糊查询街道*/
	private UUID streetId;
	/**模糊查询社区*/
	private UUID communityId;
	/**模糊查询社区组*/
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
