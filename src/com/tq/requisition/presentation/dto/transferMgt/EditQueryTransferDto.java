package com.tq.requisition.presentation.dto.transferMgt;

import java.util.Date;
import java.util.UUID;

public class EditQueryTransferDto {
	/**ת����Ϣid*/
	private UUID id;
	/**����*/
	private String name;
	/**���֤*/
	private String idNumber;
	/**ת����Ļ�������id*/
	private UUID householdTypeId;
	/**ת����Ľֵ���ַid*/
	private UUID streetId;
	/**ת�����������ַid*/
	private UUID communityId;
	/**ת������*/
	private Date transferDate;
	
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
	public UUID getHouseholdTypeId() {
		return householdTypeId;
	}
	public void setHouseholdTypeId(UUID householdTypeId) {
		this.householdTypeId = householdTypeId;
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
	public Date getTransferDate() {
		return transferDate;
	}
	public void setTransferDate(Date transferDate) {
		this.transferDate = transferDate;
	}
	public UUID getId() {
		return id;
	}
	public void setId(UUID id) {
		this.id = id;
	}
	
	/*constructors*/
	public EditQueryTransferDto(){}
	public EditQueryTransferDto(UUID id, String name, String idNumber,
			UUID householdTypeId, UUID streetId, UUID communityId,
			Date transferDate) {
		super();
		this.id = id;
		this.name = name;
		this.idNumber = idNumber;
		this.householdTypeId = householdTypeId;
		this.streetId = streetId;
		this.communityId = communityId;
		this.transferDate = transferDate;
	}
		
}
