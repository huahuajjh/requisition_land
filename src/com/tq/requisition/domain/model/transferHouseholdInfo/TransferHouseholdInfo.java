package com.tq.requisition.domain.model.transferHouseholdInfo;

import java.util.Date;
import java.util.UUID;

import com.tq.requisition.domain.share.AggregateRoot;

/**
 * ת����Ϣ������
 * @author jjh
 * @time 2015-12-18 16:39
 */
public class TransferHouseholdInfo extends AggregateRoot{
	/*private fields*/	
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
	/**ת����Ļ�������*/
	private String houseHoldTypeStr;
	/**ת����id*/
	private UUID fmlItemId;
	/**�Ƿ�����*/
	private boolean del;
	/**��id*/
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
	public String getHouseHoldTypeStr() {
		return houseHoldTypeStr;
	}
	public void setHouseHoldTypeStr(String houseHoldTypeStr) {
		this.houseHoldTypeStr = houseHoldTypeStr;
	}
	public boolean isDel() {
		return del;
	}
	public void setDel(boolean del) {
		this.del = del;
	}
	public void setId(UUID id) {
		this.id = id;
	}
	public UUID getId() {
		return this.id;
	}
	public UUID getGroupId() {
		return groupId;
	}
	public void setGroupId(UUID groupId) {
		this.groupId = groupId;
	}
	/*constructors*/
	public TransferHouseholdInfo(){}
	public TransferHouseholdInfo(UUID id,UUID oprUserId, Date oprDate, UUID streetId,
			UUID communityId, String address, Date transferDate,
			UUID houseHoldTypeId, UUID fmlItemId) {
		super();
		this.oprUserId = oprUserId;
		this.oprDate = oprDate;
		this.streetId = streetId;
		this.communityId = communityId;
		this.address = address;
		this.transferDate = transferDate;
		this.houseHoldTypeId = houseHoldTypeId;
		this.fmlItemId = fmlItemId;
		this.id = id;
		this.del = false;
	}

	/*public methods*/
	public void modify(TransferHouseholdInfo entity) {
		this.address = entity.getAddress();
		this.communityId = entity.getCommunityId();
		this.streetId = entity.getStreetId();
		this.houseHoldTypeId = entity.getHouseHoldTypeId();
		this.houseHoldTypeStr = entity.getHouseHoldTypeStr();
		this.transferDate = entity.getTransferDate();
		this.groupId = entity.groupId;
	}
	
}
