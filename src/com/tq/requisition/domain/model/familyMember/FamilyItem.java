package com.tq.requisition.domain.model.familyMember;

import java.util.Date;
import java.util.UUID;

import com.tq.requisition.domain.model.removedInfo.RemovedInfo;
import com.tq.requisition.domain.model.share.Gender;
import com.tq.requisition.domain.model.transferHouseholdInfo.TransferHouseholdInfo;
import com.tq.requisition.domain.share.AggregateRoot;

/**
 * ��ͥ��Ա��Ϣ�ۺϸ�
 * 
 * @author jjh
 * @time 2015-12-18 13:25
 */
public class FamilyItem extends AggregateRoot {
	/* private fields */
	/** ���� */
	private String name;
	/**������Ŀ����*/
	private String proName;
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
	/** �Ƿ��Ǩ */
	private boolean removed;
	/** �Ƿ�ת�� */
	private boolean transfer;
	/** �Ƿ��籣 */
	private boolean socialsecurity;
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
	/**�������ַid*/
	private UUID groupId;
	/**��ע*/
	private String remark;
	/**�Ƿ�μӹ��籣*/
	private boolean isSocialsecurity;
	
	
	/*constructors*/
	public FamilyItem(){
		this.id = UUID.randomUUID();
	}
	public FamilyItem(UUID id, String name, String idNumber, Date birthday,
			Gender gender, String onlyChildNumber, boolean half,
			String address, String relationshipStr, String householdStr,
			String socialsecurityStr, UUID streetId, UUID communityId,
			UUID relationshipId, UUID householdId, UUID socialsecurityTypeId,//
			UUID proId,UUID fmlId,String proName,boolean isRemoved, boolean isTransfer,boolean isSS) {
		this();
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
		this.proId = proId;
		this.fmlId = fmlId;
		this.proName = proName;
		this.removed = isRemoved;
		this.socialsecurity = isSS;
		this.transfer = isTransfer;
				
	}

	/*public methods*/
	public static FamilyItem obtain( String name, String idNumber, Date birthday,
			Gender gender, String onlyChildNumber, boolean half,
			String address, String relationshipStr, String householdStr,
			String socialsecurityStr, UUID streetId, UUID communityId,
			UUID relationshipId, UUID householdId, UUID socialsecurityTypeId,//
			UUID proId,UUID fmlId,String proName) {
		return new FamilyItem(//
				UUID.randomUUID(),//
				name, //
				idNumber, //
				birthday, //
				gender, //
				onlyChildNumber, //
				half, //
				address, //
				relationshipStr, //
				householdStr,//
				socialsecurityStr, //
				streetId, //
				communityId,//
				relationshipId,//
				householdId,//
				socialsecurityTypeId,//
				proId,//
				fmlId,//
				proName,//
				false,//
				false,//
				false);
	}
	
	/**
	 * �޸�
	 * @param item
	 */
	public void modify(FamilyItem item) {
		this.birthday = item.getBirthday();
		this.gender = item.gender;
		this.half = item.getHalf();
		this.idNumber = item.getIdNumber();
		this.onlyChildNumber = item.getOnlyChildNumber();
		this.householdId = item.getHouseholdId();
		this.householdStr = item.getHouseholdStr();
		this.name = item.getName();
		this.socialsecurityTypeId = item.getSocialsecurityTypeId();
		this.socialsecurityStr = item.getSocialsecurityStr();
		this.socialsecurity = item.getSocialsecurity();
		this.removed = item.getRemoved();
		this.transfer = item.getTransfer();
		this.currentEducationSituation = item.getCurrentEducationSituation();
		this.educationLevel = item.getEducationLevel();
		this.farmingTime = item.getFarmingTime();
		this.serveArmySituation = item.getServeArmySituation();
		this.tel = item.getTel();
		this.remark = item.getRemark();
		this.isSocialsecurity = item.getIsSocialsecurity();
	}
	
	/*getters and setters*/
	public void setId(UUID id) {
		this.id = id;
	}
	public UUID getId() {
		return this.id;
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
	public boolean getHalf() {
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
	public void setFmlId(UUID fmlId) {
		this.fmlId = fmlId;
	}
	public UUID getFmlId() {
		return fmlId;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public boolean getRemoved() {
		return removed;
	}
	public void setRemoved(boolean isRemoved) {
		this.removed = isRemoved;
	}
	public boolean getTransfer() {
		return transfer;
	}
	public void setTransfer(boolean isTransfer) {
		this.transfer = isTransfer;
	}
	public boolean getSocialsecurity() {
		return socialsecurity;
	}
	public void setSocialsecurity(boolean isSS) {
		this.socialsecurity = isSS;
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
	public UUID getGroupId() {
		return groupId;
	}
	public void setGroupId(UUID groupId) {
		this.groupId = groupId;
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
	public boolean getIsSocialsecurity() {
		return isSocialsecurity;
	}
	public void setIsSocialsecurity(boolean isS) {
		this.isSocialsecurity = isS;
	}
	
	/*public methods*/
	/**
	 * ���ת��״̬
	 */
	public void markTransferState() {
		this.transfer = true;
	}

	/**
	 * ���ת�����籣״̬Ϊ���籣
	 */
	public void markSocialsecurityState() {
		this.socialsecurity = true;
	}
	
	/**
	 * ת����Ϣ����
	 * @param info
	 * 		ת����Ϣ
	 */
	public void transferHousehold(TransferHouseholdInfo info) {
		this.householdId = info.getHouseHoldTypeId();
		this.householdStr = info.getHouseHoldTypeStr();
		this.streetId = info.getStreetId();
		this.communityId = info.getCommunityId();
		this.transfer = true;
		this.address = info.getAddress();
	}

	public RemovedInfo toRemovedInfo() {
		RemovedInfo info = new RemovedInfo();
		info.setId(UUID.randomUUID());
		info.setBirthDay(birthday);
		info.setCommunityId(communityId);
		info.setDel(false);
		info.setIdNumber(idNumber);
		info.setName(name);
		info.setAddress(address);
		info.setRemoveDate(new Date());
		info.setStreetId(streetId);
		return info;
	}
}
