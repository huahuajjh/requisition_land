package com.tq.requisition.presentation.dto.rmHousehold;

import java.util.Date;

import com.tq.requisition.domain.model.familyMember.FamilyItem;
import com.tq.requisition.domain.model.removeFamily.Family;

public class FamilyAndItem {
	/**����*/
	private String headName;
	/** ������Ŀ���� */
	private String proName;
	/**���ݺϷ����*/
	private float houseLegalArea;
	/**����Υ�����*/
	private float houseIllegalArea;
	/**��ַȫ����*/
	private String address;
	/**��֤���������˵��*/
	private String satuationDesc;
	/**�ⶨ������*/
	private String dealSolution;
	/**���ϻ������*/
	private String unionSuggestion;
	/**��ע*/
	private String familyRemark;
	/**��ͥ����*/
	private Integer fmlNumber;
	
	/** ���� */
	private String name;
	/** ���֤�� */
	private String idNumber;
	/** �Ա� */
	private String gender;
	/** �������� */
	private String householdStr;
	/** �������� */
	private Date birthday;
	/**�ܽ����̶�*/
	private String educationLevel;
	/** ������Ů�� */
	private String onlyChildNumber;
	/**�ڶ����*/	
	private String currentEducationSituation;
	/** ��߻� */
	private String half;
	/** �뻧����ϵ */
	private String relationshipStr;
	/**��ũʱ��*/
	private String farmingTime;
	/**�����ۣ��ͽ̵������ʱ��*/
	private String serveArmySituation;
	/**�绰*/
	private String tel;
	/**��ע*/
	private String remark;
	/**�Ƿ�μӹ��籣*/
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
		model.gender = item.getGender().equals(0)? "��": "Ů";
		model.householdStr = item.getHouseholdStr();
		model.birthday = item.getBirthday();
		model.educationLevel = item.getEducationLevel();
		model.onlyChildNumber = item.getOnlyChildNumber();
		model.currentEducationSituation = item.getCurrentEducationSituation();
		model.half = item.getHalf() ? "��": "��";
		model.relationshipStr = item.getRelationshipStr();
		model.farmingTime = item.getFarmingTime();
		model.serveArmySituation = item.getServeArmySituation();
		model.tel = item.getTel();
		model.remark = item.getRemark();
		model.userdSocialsecurity = item.getIsSocialsecurity() ? "��": "��";
		
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
