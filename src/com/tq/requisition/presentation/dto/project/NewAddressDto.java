package com.tq.requisition.presentation.dto.project;

import java.util.UUID;

public class NewAddressDto {
	/**��^id*/
	private UUID communityId;
	/**�ֵ�id*/
	private UUID streetId;
	
	/**�����|*/
	private String totalAddress;
	
	public UUID getCommunityId() {
		return communityId;
	}
	public void setCommunityId(UUID communityId) {
		this.communityId = communityId;
	}
	public UUID getStreetId() {
		return streetId;
	}
	public void setStreetId(UUID streetId) {
		this.streetId = streetId;
	}

	public String getTotalAddress() {
		return totalAddress;
	}
	public void setTotalAddress(String totalAddress) {
		this.totalAddress = totalAddress;
	}
	
}
