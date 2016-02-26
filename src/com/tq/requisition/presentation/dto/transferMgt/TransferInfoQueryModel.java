package com.tq.requisition.presentation.dto.transferMgt;

import java.util.UUID;

import com.tq.requisition.infrastructure.utils.ThreeState;

/**
 * ת����Ϣ��ѯmodel
 * @author jjh
 * @time 2015-12-30 17:13
 *
 */
public class TransferInfoQueryModel {
	/**��Ŀid*/
	private UUID proId;
	/**�ֵ���ַd*/
	private UUID streetId;
	/**������ַid*/
	private UUID communityId;
	/**�Ƿ�ת��*/
	private ThreeState isTransfered;
	/**����֤*/
	private String idNumber;
	/**��id*/
	private UUID groupId;
	
	
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
	public ThreeState getIsTransfered() {
		return isTransfered;
	}
	public void setIsTransfered(ThreeState isTransfered) {
		this.isTransfered = isTransfered;
	}
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	public UUID getGroupId() {
		return groupId;
	}
	public void setGroupId(UUID groupId) {
		this.groupId = groupId;
	}
	
}