package com.tq.requisition.presentation.dto.rmHousehold;

import java.util.UUID;

/**
 * ���ڲ�ѯ��������Ϣ
 * @author jjh
 * 	@time 2016-01-21 18:06
 *
 */
public class FamilyBasicInfoDto {
	/**��������*/
	private String name;
	
	/**�������֤*/
	private String idNumber;
	
	/**������Ŀ*/
	private String proName;
	
	/**��ַ*/
	private String address;
	
	/**��(�ֵ�)*/
	private UUID streetId;
	
	/**�壨������*/
	private UUID communityId;
	
	/**��*/
	private UUID groupId;
	
	/**��ĿID*/
	private UUID proId;
	
	/**��ID*/
	private UUID fmlId;
	
	/*constructors*/
	public FamilyBasicInfoDto(String name, String idNumber, String proName,
			String address,UUID streetId,UUID communityId,UUID groupId,UUID proId,UUID fmlId) {
		super();
		this.name = name;
		this.idNumber = idNumber;
		this.proName = proName;
		this.address = address;
		this.streetId = streetId;
		this.communityId = communityId;
		this.groupId = groupId;
		this.proId = proId;
		this.fmlId = fmlId;
	}
	
	/*getters and setter*/
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
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public UUID getProId() {
		return proId;
	}
	public void setProId(UUID proId) {
		this.proId = proId;
	}
	public UUID getFmlId() {
		return fmlId;
	}
	public void setFmlId(UUID fmlId) {
		this.fmlId = fmlId;
	}
}
