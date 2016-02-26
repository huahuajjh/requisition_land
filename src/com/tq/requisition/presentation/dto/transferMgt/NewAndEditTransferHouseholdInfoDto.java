package com.tq.requisition.presentation.dto.transferMgt;

import java.util.Date;
import java.util.UUID;

/**
 * ����ת����Ϣdto
 * @author jjh
 * @time 2015-12-18 16:39
 */
public class NewAndEditTransferHouseholdInfoDto{
	/*private fields*/	
	private UUID id;
	/**������id*/
	private UUID oprUserId;
	/**��������*/
	private Date oprDate;
	/**ת���ֵ���ַid*/
	private UUID streetId;
	/**ת��������ַid*/
	private UUID communityId;
	/**ת��ȫ��ַ*/
	private String address;
	/**ת������*/
	private Date transferDate;
	/**ת����Ļ�������id*/
	private UUID houseHoldTypeId;
	/**ת����Ļ��������ַ���*/
	private String houseHoldTypeStr;
	/**ת����id*/
	private UUID fmlItemId;
	/**�Mid*/
	private UUID groupId;
	
	/*getters and setters*/
	public UUID getOprUserId() {
		return oprUserId;
	}
	public void setOprUserId(UUID oprUserId) {
		this.oprUserId = oprUserId;
	}
	public Date getOprDate() {
		return oprDate;
	}
	public void setOprDate(Date oprDate) {
		this.oprDate = oprDate;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getTransferDate() {
		return transferDate;
	}
	public void setTransferDate(Date transferDate) {
		this.transferDate = transferDate;
	}
	public UUID getHouseHoldTypeId() {
		return houseHoldTypeId;
	}
	public void setHouseHoldTypeId(UUID houseHoldTypeId) {
		this.houseHoldTypeId = houseHoldTypeId;
	}
	public UUID getFmlItemId() {
		return fmlItemId;
	}
	public void setFmlItemId(UUID fmlItemId) {
		this.fmlItemId = fmlItemId;
	}
	public UUID getId() {
		return id;
	}
	public void setId(UUID id) {
		this.id = id;
	}
	public String getHouseHoldTypeStr() {
		return houseHoldTypeStr;
	}
	public void setHouseHoldTypeStr(String houseHoldTypeStr) {
		this.houseHoldTypeStr = houseHoldTypeStr;
	}
	public UUID getGroupId() {
		return groupId;
	}
	public void setGroupId(UUID groupId) {
		this.groupId = groupId;
	}
	
	/*constructors*/
	public NewAndEditTransferHouseholdInfoDto(){}
	public NewAndEditTransferHouseholdInfoDto(UUID id,UUID oprUserId, Date oprDate, UUID streetId,
			UUID communityId, String address, Date transferDate,
			UUID houseHoldTypeId, UUID fmlItemId,String householdTypeStr) {
		super();
		this.houseHoldTypeStr = householdTypeStr;
		this.oprUserId = oprUserId;
		this.oprDate = oprDate;
		this.streetId = streetId;
		this.communityId = communityId;
		this.address = address;
		this.transferDate = transferDate;
		this.houseHoldTypeId = houseHoldTypeId;
		this.fmlItemId = fmlItemId;
		this.id = id;
	}

	/*public methods*/
	
}
