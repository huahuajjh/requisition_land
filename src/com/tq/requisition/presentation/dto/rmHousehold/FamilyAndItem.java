package com.tq.requisition.presentation.dto.rmHousehold;

import java.util.Date;

import com.tq.requisition.domain.model.familyMember.FamilyItem;
import com.tq.requisition.domain.model.removeFamily.Family;

public class FamilyAndItem {
	/**户主*/
	private String headName;
	/** 所属项目名称 */
	private String proName;
	/**房屋合法面积*/
	private float houseLegalArea;
	/**房屋违章面积*/
	private float houseIllegalArea;
	/**地址全名称*/
	private String address;
	/**批证及其他情况说明*/
	private String satuationDesc;
	/**拟定处理方案*/
	private String dealSolution;
	/**联合会审意见*/
	private String unionSuggestion;
	/**备注*/
	private String familyRemark;
	/**家庭人数*/
	private Integer fmlNumber;
	
	/** 姓名 */
	private String name;
	/** 身份证号 */
	private String idNumber;
	/** 性别 */
	private String gender;
	/** 户口性质 */
	private String householdStr;
	/** 出生年月 */
	private Date birthday;
	/**受教育程度*/
	private String educationLevel;
	/** 独身子女号 */
	private String onlyChildNumber;
	/**在读情况*/	
	private String currentEducationSituation;
	/** 半边户 */
	private String half;
	/** 与户主关系 */
	private String relationshipStr;
	/**务农时间*/
	private String farmingTime;
	/**服兵役，劳教等情况及时间*/
	private String serveArmySituation;
	/**电话*/
	private String tel;
	/**备注*/
	private String remark;
	/**是否参加过社保*/
	private String userdSocialsecurity;
	
	public static FamilyAndItem ToModel(Family family, FamilyItem item){
		FamilyAndItem model = new FamilyAndItem();
		model.headName = family.getHeadName();
		model.proName = family.getProName();
		model.houseLegalArea = family.getHouseLegalArea();
		model.houseIllegalArea = family.getHouseIllegalArea();
		model.address = family.getAddress();
		model.satuationDesc = family.getSatuationDesc();
		model.dealSolution = family.getDealSolution();
		model.unionSuggestion = family.getUnionSuggestion();
		model.familyRemark = family.getRemark();
		model.fmlNumber = family.getFmlNumber();
		
		model.name = item.getName();
		model.idNumber = item.getIdNumber();
		model.gender = item.getGender().equals(0)? "男": "女";
		model.householdStr = item.getHouseholdStr();
		model.birthday = item.getBirthday();
		model.educationLevel = item.getEducationLevel();
		model.onlyChildNumber = item.getOnlyChildNumber();
		model.currentEducationSituation = item.getCurrentEducationSituation();
		model.half = item.getHalf() ? "是": "否";
		model.relationshipStr = item.getRelationshipStr();
		model.farmingTime = item.getFarmingTime();
		model.serveArmySituation = item.getServeArmySituation();
		model.tel = item.getTel();
		model.remark = item.getRemark();
		model.userdSocialsecurity = item.getIsSocialsecurity() ? "是": "否";
		
		return model;
	}
	
	public String getHeadName() {return headName;}
	public String getProName() {
		return proName;
	}
	public float getHouseLegalArea() {
		return houseLegalArea;
	}
	public float getHouseIllegalArea() {
		return houseIllegalArea;
	}
	public String getAddress() {
		return address;
	}
	public String getSatuationDesc() {
		return satuationDesc;
	}
	public String getDealSolution() {
		return dealSolution;
	}
	public String getUnionSuggestion() {
		return unionSuggestion;
	}
	public String getFamilyRemark() {
		return familyRemark;
	}
	public Integer getFmlNumber() {
		return fmlNumber;
	}
	public String getName() {
		return name;
	}
	public String getIdNumber() {
		return idNumber;
	}
	public String getGender() {
		return gender;
	}
	public String getHouseholdStr() {
		return householdStr;
	}
	public Date getBirthday() {
		return birthday;
	}
	public String getEducationLevel() {
		return educationLevel;
	}
	public String getOnlyChildNumber() {
		return onlyChildNumber;
	}
	public String getCurrentEducationSituation() {
		return currentEducationSituation;
	}
	public String getHalf() {
		return half;
	}
	public String getRelationshipStr() {
		return relationshipStr;
	}
	public String getFarmingTime() {
		return farmingTime;
	}
	public String getServeArmySituation() {
		return serveArmySituation;
	}
	public String getTel() {
		return tel;
	}
	public String getRemark() {
		return remark;
	}
	public String getUserdSocialsecurity() {
		return userdSocialsecurity;
	}
}
