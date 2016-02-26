package com.tq.requisition.presentation.dto.rmHousehold;

import java.util.Date;
import java.util.UUID;

import com.tq.requisition.domain.model.share.Gender;

public class FamilyItemDto {
	/* private fields */
	/** id */
	private UUID id;
	/** ���� */
	private String name;
	/** ���֤�� */
	private String idNumber;
	/** �������� */
	private Date birthday;
	/** �Ԅe */
	private Gender gender;
	/** ������Ů̖ */
	private String onlyChildNumber;
	/** ��߅�� */
	private boolean half;
	/** ��ͥסַ */
	private String address;
	/** �뻧����ϵ */
	private String relationshipStr;
	/** �������� */
	private String householdStr;
	/** �籣���� */
	private String socialsecurityStr;
	/** �ֵ�id */
	private UUID streetId;
	/** ����id */
	private UUID communityId;
	/** �뻧����ϵid */
	private UUID relationshipId;
	/** ��������id */
	private UUID householdId;
	/** �籣����id */
	private UUID socialsecurityTypeId;
	/** ��Ŀid */
	private UUID proId;
	/** ������id */
	private UUID fmlId;
	/** ������Ŀ���� */
	private String proName;
	/** �Ƿ��Ǩ */
	private boolean isRemoved;
	/** �Ƿ�ת�� */
	private boolean isTransfer;
	/** �Ƿ��籣 */
	private boolean isSS;
	/** ���ַid*/
	private UUID groupId;
	/**�ܽ����̶�*/
	private String educationLevel;
	/**�ڶ����*/	
	private String currentEducationSituation;
	/**��ũʱ��*/
	private String farmingTime;
	/**�����ۣ��ͽ̵������ʱ��*/
	private String serveArmySituation;
	/**�绰*/
	private String tel;
	/**��ע*/
	private String remark;
	/**�Ƿ�μӹ��籣*/
	private boolean userdSocialsecurity;
	
	/*getters and setters*/
	public UUID getId() {
		return id;
	}
	public void setId(UUID id) {
		this.id = id;
	}
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
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public Gender getGender() {
		return gender;
	}
	public void setGender(Gender gender) {
		this.gender = gender;
	}
	public String getOnlyChildNumber() {
		return onlyChildNumber;
	}
	public void setOnlyChildNumber(String onlyChildNumber) {
		this.onlyChildNumber = onlyChildNumber;
	}
	public boolean isHalf() {
		return half;
	}
	public void setHalf(boolean half) {
		this.half = half;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRelationshipStr() {
		return relationshipStr;
	}
	public void setRelationshipStr(String relationshipStr) {
		this.relationshipStr = relationshipStr;
	}
	public String getHouseholdStr() {
		return householdStr;
	}
	public void setHouseholdStr(String householdStr) {
		this.householdStr = householdStr;
	}
	public String getSocialsecurityStr() {
		return socialsecurityStr;
	}
	public void setSocialsecurityStr(String socialsecurityStr) {
		this.socialsecurityStr = socialsecurityStr;
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
	public UUID getRelationshipId() {
		return relationshipId;
	}
	public void setRelationshipId(UUID relationshipId) {
		this.relationshipId = relationshipId;
	}
	public UUID getHouseholdId() {
		return householdId;
	}
	public void setHouseholdId(UUID householdId) {
		this.householdId = householdId;
	}
	public UUID getSocialsecurityTypeId() {
		return socialsecurityTypeId;
	}
	public void setSocialsecurityTypeId(UUID socialsecurityTypeId) {
		this.socialsecurityTypeId = socialsecurityTypeId;
	}
	public void setProId(UUID proId) {
		this.proId = proId;
	}
	public UUID getProId() {
		return this.proId;
	}
	public UUID getFmlId() {
		return fmlId;
	}
	public void setFmlId(UUID fmlId) {
		this.fmlId = fmlId;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public boolean getRemoved() {
		return isRemoved;
	}
	public void setRemoved(boolean isRemoved) {
		this.isRemoved = isRemoved;
	}
	public boolean getTransfer() {
		return isTransfer;
	}
	public void setTransfer(boolean isTransfer) {
		this.isTransfer = isTransfer;
	}
	public boolean getSS() {
		return isSS;
	}
	public void setSS(boolean isSS) {
		this.isSS = isSS;
	}
	public UUID getGroupId() {
		return groupId;
	}
	public void setGroupId(UUID groupId) {
		this.groupId = groupId;
	}
	public String getEducationLevel() {
		return educationLevel;
	}
	public void setEducationLevel(String educationLevel) {
		this.educationLevel = educationLevel;
	}
	public String getCurrentEducationSituation() {
		return currentEducationSituation;
	}
	public void setCurrentEducationSituation(String currentEducationSituation) {
		this.currentEducationSituation = currentEducationSituation;
	}
	public String getFarmingTime() {
		return farmingTime;
	}
	public void setFarmingTime(String farmingTime) {
		this.farmingTime = farmingTime;
	}
	public String getServeArmySituation() {
		return serveArmySituation;
	}
	public void setServeArmySituation(String serveArmySituation) {
		this.serveArmySituation = serveArmySituation;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public boolean isRemoved() {
		return isRemoved;
	}
	public boolean isTransfer() {
		return isTransfer;
	}
	public boolean isSS() {
		return isSS;
	}
	public boolean getUserdSocialsecurity() {
		return userdSocialsecurity;
	}
	public void setUserdSocialsecurity(boolean userdSocialsecurity) {
		this.userdSocialsecurity = userdSocialsecurity;
	}
	
	/*constructors*/
	public FamilyItemDto() {}
	public FamilyItemDto(UUID id,String name, String idNumber,
			Date birthday, Gender gender, String onlyChildNumber, boolean half,
			String address, String relationshipStr, String householdStr,
			String socialsecurityStr, UUID streetId, UUID communityId,
			UUID relationshipId, UUID householdId, UUID socialsecurityTypeId,//
			UUID proId,UUID fmlId,String proName,boolean isRemoved, boolean isTransfer,boolean isSS) {
		super();
		this.id = id;
		this.proId = proId;
		this.name = name;
		this.idNumber = idNumber;
		this.birthday = birthday;
		this.gender = gender;
		this.onlyChildNumber = onlyChildNumber;
		this.half = half;
		this.address = address;
		this.relationshipStr = relationshipStr;
		this.householdStr = householdStr;
		this.socialsecurityStr = socialsecurityStr;
		this.streetId = streetId;
		this.communityId = communityId;
		this.relationshipId = relationshipId;
		this.householdId = householdId;
		this.socialsecurityTypeId = socialsecurityTypeId;
		this.fmlId = fmlId;
		this.proName = proName;
		this.isRemoved = isRemoved;
		this.isSS = isSS;
		this.isTransfer = isTransfer;
	}

	/*public methods*/
	public static FamilyItemDto obtain(UUID id, String name, String idNumber,
			Date birthday, Gender gender, String onlyChildNumber, boolean half,
			String address, String relationshipStr, String householdStr,
			String socialsecurityStr, UUID streetId, UUID communityId,
			UUID relationshipId, UUID householdId, UUID socialsecurityTypeId,//
			UUID proId,UUID fmlId,String proName,boolean isRemoved, boolean isTransfer,boolean isSS) {

		return new FamilyItemDto(//
				id,//
				name,//
				idNumber, //
				birthday, //
				gender, //
				onlyChildNumber, //
				half,//
				address, //
				relationshipStr, //
				householdStr, //
				socialsecurityStr, //
				streetId, //
				communityId,//
				relationshipId, //
				householdId,//
				socialsecurityTypeId,//
				proId,//
				fmlId,//
				proName,//
				isRemoved,//
				isSS,//
				isTransfer);
	}
	
}
