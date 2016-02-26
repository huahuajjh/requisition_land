package com.tq.requisition.presentation.dto.transferMgt;

import java.util.Date;
import java.util.UUID;

/**
 * ת����Ϣ��ѯdto��UIMODEL������̨��model
 * @author jjh
 * @time 2015-12-30 18:47
 *
 */
public class TransferInfoDto4Table {
	/*private fields*/
	private UUID id;
	/**ת��������*/
	private String name;
	/**ת�������֤*/
	private String idNumber;
	/**ת��ȫ��ַ*/
	private String address;
	/**ת������*/
	private Date transferDate;
	/**ת����Ļ�������*/
	private String houseHoldTypeStr;
	/**������Ŀid*/
	private UUID proId;
	/**������Ŀ����*/
	private String proName;
	/**����Ǩ��Աid*/
	private UUID fmlItemId;
	/**ת����Ϣid*/
	private UUID transferId;
	/**��������id*/
	private UUID houseHoldTypeId;
	/**�ֵ���ַid*/
	private UUID streetId;
	/**������ַid*/
	private UUID communityId;
	/**���ַid*/
	private UUID groupId;
	
	
	/*getters and setters*/	
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
	public Date getTransferDate() {
		return transferDate;
	}
	public void setTransferDate(Date transferDate) {
		this.transferDate = transferDate;
	}
	public String getHouseHoldTypeStr() {
		return houseHoldTypeStr;
	}
	public void setHouseHoldTypeStr(String houseHoldTypeStr) {
		this.houseHoldTypeStr = houseHoldTypeStr;
	}
	public UUID getProId() {
		return proId;
	}
	public void setProId(UUID proId) {
		this.proId = proId;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public UUID getFmlItemId() {
		return fmlItemId;
	}
	public void setFmlItemId(UUID fmlItemId) {
		this.fmlItemId = fmlItemId;
	}
	public UUID getTransferId() {
		return transferId;
	}
	public void setTransferId(UUID transferId) {
		this.transferId = transferId;
	}
	public UUID getId() {
		return id;
	}
	public void setId(UUID id) {
		this.id = id;
	}
	public UUID getHouseHoldTypeId() {
		return houseHoldTypeId;
	}
	public void setHouseHoldTypeId(UUID houseHoldTypeId) {
		this.houseHoldTypeId = houseHoldTypeId;
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
	
	/*constructors*/
	public TransferInfoDto4Table(){}
	public TransferInfoDto4Table(UUID proId, String proName,String name, 
			String idNumber, String houseHoldTypeStr, Date transferDate,String address,
			UUID fmlItemId,UUID transferId,UUID houseHoldTypeId,UUID streetId,UUID communityId,UUID groupId) {
		super();
		this.name = name;
		this.idNumber = idNumber;
		this.address = address;
		this.transferDate = transferDate;
		this.houseHoldTypeStr = houseHoldTypeStr;
		this.proId = proId;
		this.proName = proName;
		this.fmlItemId = fmlItemId;
		this.transferId = transferId;
		this.houseHoldTypeId = houseHoldTypeId;
		this.streetId = streetId;
		this.communityId = communityId;
		this.groupId = groupId;
	}
	
}
