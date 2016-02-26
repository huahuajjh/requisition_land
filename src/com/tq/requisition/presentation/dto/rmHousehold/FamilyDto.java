package com.tq.requisition.presentation.dto.rmHousehold;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * ��Ǩ��dto
 * 
 * @author jjh
 * @time 2015-12-28 18:03
 */
public class FamilyDto {
	/*private fields*/
	/**id*/
	private UUID id;
	/**����*/
	private String headName;
	/**������Ŀid*/
	private UUID proId;
	/**����id*/
	private UUID headId;
	/**�ֵ�id*/
	private UUID streetId;
	/**����id*/
	private UUID communityId;
	/**��ַȫ����*/
	private String address;
	/**��ͥ����*/
	private Integer fmlNumber;
	/**���ݺϷ����*/
	private float houseLegalArea;
	/**����Υ�����*/
	private float houseIllegalArea;
	/**��֤���������˵��*/
	private String satuationDesc;
	/**�ⶨ������*/
	private String dealSolution;
	/**���ϻ������*/
	private String unionSuggestion;
	/**��ע*/
	private String remark;
	/**����ͼƬ��ַ*/
	private String houseImgPath;
	/** ������Ŀ���� */
	private String proName;
	/** ���ַid*/
	private UUID groupId;
	/**���ϻ�������ļ�·��*/
	private String unionSuggestionPath;
	/**��ͥ��Ա����*/
	private List<FamilyItemDto> items;
	
	/*getters and setters*/
	public UUID getId() {
		return id;
	}
	public void setId(UUID id) {
		this.id = id;
	}
	public String getHeadName() {
		return headName;
	}
	public void setHeadName(String headName) {
		this.headName = headName;
	}
	public UUID getProId() {
		return proId;
	}
	public void setProId(UUID proId) {
		this.proId = proId;
	}
	public UUID getHeadId() {
		return headId;
	}
	public void setHeadId(UUID headId) {
		this.headId = headId;
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
	public Integer getFmlNumber() {
		return fmlNumber;
	}
	public void setFmlNumber(Integer fmlNumber) {
		this.fmlNumber = fmlNumber;
	}
	public float getHouseLegalArea() {
		return houseLegalArea;
	}
	public void setHouseLegalArea(float houseLegalArea) {
		this.houseLegalArea = houseLegalArea;
	}
	public float getHouseIllegalArea() {
		return houseIllegalArea;
	}
	public void setHouseIllegalArea(float houseIllegalArea) {
		this.houseIllegalArea = houseIllegalArea;
	}
	public String getSatuationDesc() {
		return satuationDesc;
	}
	public void setSatuationDesc(String satuationDesc) {
		this.satuationDesc = satuationDesc;
	}
	public String getDealSolution() {
		return dealSolution;
	}
	public void setDealSolution(String dealSolution) {
		this.dealSolution = dealSolution;
	}
	public String getUnionSuggestion() {
		return unionSuggestion;
	}
	public void setUnionSuggestion(String unionSuggestion) {
		this.unionSuggestion = unionSuggestion;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getHouseImgPath() {
		return houseImgPath;
	}
	public void setHouseImgPath(String houseImgPath) {
		this.houseImgPath = houseImgPath;
	}
	public List<FamilyItemDto> getItems() {
		return items;
	}
	public void setItems(List<FamilyItemDto> items) {
		this.items = items;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public UUID getGroupId() {
		return groupId;
	}
	public void setGroupId(UUID groupId) {
		this.groupId = groupId;
	}
	public String getUnionSuggestionPath() {
		return unionSuggestionPath;
	}
	public void setUnionSuggestionPath(String unionSuggestionPath) {
		this.unionSuggestionPath = unionSuggestionPath;
	}
	
	/*constructors*/
	public FamilyDto(){
		items = new ArrayList<FamilyItemDto>();
	}
	public FamilyDto(UUID id, String headName, UUID proId, UUID headId,
			UUID streetId, UUID communityId, String address, Integer fmlNumber,
			float houseLegalArea, float houseIllegalArea, String satuationDesc,
			String dealSolution, String unionSuggestion, String remark,
			String houseImgPath, List<FamilyItemDto> items,String proName,UUID groupId,String unionSuggestionPath) {
		this();
		this.id = id;
		this.headName = headName;
		this.proId = proId;
		this.headId = headId;
		this.streetId = streetId;
		this.communityId = communityId;
		this.address = address;
		this.fmlNumber = fmlNumber;
		this.houseLegalArea = houseLegalArea;
		this.houseIllegalArea = houseIllegalArea;
		this.satuationDesc = satuationDesc;
		this.dealSolution = dealSolution;
		this.unionSuggestion = unionSuggestion;
		this.remark = remark;
		this.houseImgPath = houseImgPath;
		this.items = items;
		this.proName = proName;
		this.groupId = groupId;
		this.unionSuggestionPath = unionSuggestionPath;
	}
	
	/*public methods*/
	public static FamilyDto obtain(UUID id, String headName, UUID proId, UUID headId,
			UUID streetId, UUID communityId, String address, Integer fmlNumber,
			float houseLegalArea, float houseIllegalArea, String satuationDesc,
			String dealSolution, String unionSuggestion, String remark,
			String houseImgPath, List<FamilyItemDto> items,String proName,UUID groupId,String unionSuggestionPath) {
		
		return new FamilyDto(//
				id,//
				headName, //
				proId, //
				headId, //
				streetId,//
				communityId, //
				address,//
				fmlNumber,//
				houseLegalArea,//
				houseIllegalArea,//
				satuationDesc, //
				dealSolution, //
				unionSuggestion, //
				remark, //
				houseImgPath, //
				items,//
				proName,//
				groupId,//
				unionSuggestionPath);
	}
	
}
