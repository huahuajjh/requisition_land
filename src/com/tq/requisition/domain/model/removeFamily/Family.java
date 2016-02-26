package com.tq.requisition.domain.model.removeFamily;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.tq.requisition.domain.model.familyMember.FamilyItem;
import com.tq.requisition.domain.share.AggregateRoot;
import com.tq.requisition.exception.InvalidOperationException;

/**
 * ��Ǩ���ۺϸ�
 * @author jjh
 * @time 2015-12-18 13:25
 */
public class Family extends AggregateRoot{
	/*private fields*/
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
	/**������Ŀ����*/
	private String proName;
	/**���ַid*/
	private UUID groupId;
	/**���ϻ�������ļ�·��*/
	private String unionSuggestionPath;
	
	//�ǳ־û��ֶ�
	/**�������֤*/
	private String idNumber;
	/**��ͥ��Ա����*/
	private List<FamilyItem> items = new ArrayList<FamilyItem>();

	/*constructors*/
	public Family(){
		this.id = UUID.randomUUID();
	}
	public Family(UUID id,String headName, UUID proId, UUID headId, UUID streetId,
			UUID communityId, String address, Integer fmlNumber,
			float houseLegalArea, float houseIllegalArea, String satuationDesc,
			String dealSolution, String unionSuggestion, String remark,
			String houseImgPath,List<FamilyItem> items,String proName,UUID groupId,String unionSuggestionPath) {
		this();
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
	public static Family obtain(String headName, UUID proId, UUID headId, UUID streetId,
			UUID communityId, String address, Integer fmlNumber,
			float houseLegalArea, float houseIllegalArea, String satuationDesc,
			String dealSolution, String unionSuggestion, String remark,
			String houseImgPath,List<FamilyItem> items,String proName,UUID groupId,String unionSuggestionPath) {
		
		return new Family(//
				UUID.randomUUID(),
				headName,//
				proId, //
				headId, //
				streetId, //
				communityId,//
				address, //
				fmlNumber, //
				houseLegalArea, //
				houseIllegalArea, //
				satuationDesc, //
				dealSolution, //
				unionSuggestion,//
				remark, //
				houseImgPath,//
				items,//
				proName,//
				groupId,//
				unionSuggestionPath);
	}

	public void validate() {
		if(headName==null || headName.trim().equals(""))
		{
			throw new NullPointerException("����Ϣ����ֶ�Ϊ��");
		}		
	}

	/*getters and setters*/
	public void setId(UUID id) {
		this.id = id;
	}
	public UUID getId() {
		return this.id;
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
	public List<FamilyItem> getItems() {
		return items;
	}
	public void setItems(List<FamilyItem> items) {
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
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	
	/*public methods*/
	/**
	 * ����������֤
	 */
	public void validateByAdd() {
		if(this.items==null)
		{
			throw new InvalidOperationException("���������޲�Ǩ����Ա��Ϣ");
		}
	}

	public void modify(Family fml) {
		this.address = fml.getAddress();
		this.communityId = fml.getCommunityId();
		this.streetId = fml.getStreetId();
		this.dealSolution = fml.getDealSolution();
		this.unionSuggestion = fml.getUnionSuggestion();
		this.remark = fml.getRemark();
		this.headName = fml.getHeadName();
		this.houseIllegalArea = fml.getHouseIllegalArea();
		this.houseLegalArea = fml.getHouseLegalArea();
		this.groupId = fml.getGroupId();
		this.satuationDesc = fml.getSatuationDesc();
		this.unionSuggestionPath = fml.getUnionSuggestionPath();
		this.houseImgPath = fml.getHouseImgPath();
	}
	
}
