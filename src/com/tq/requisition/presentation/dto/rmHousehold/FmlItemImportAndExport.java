package com.tq.requisition.presentation.dto.rmHousehold;

import java.util.Date;

import com.excel.util.annotation.InputColAnnotation;

/**
 * ��Ǩ����ͥ��Ա��������model
 * @author jjh
 * @time 2016-01-16 13:16
 *
 */
public class FmlItemImportAndExport {
	/** ���� */
	@InputColAnnotation(colCoord=1,requiredErrorMsg="[����]�Ǳ�����")
	private String name;
	/** ���֤�� */
	@InputColAnnotation(colCoord=6,required=true,requiredErrorMsg="[���֤��]�Ǳ�����",only = true,onlyErrorMsg = "[���֤��]�Ǳ���Ψһ")
	private String idNumber;
	/** �������� */
	@InputColAnnotation(colCoord=5,required=true,converErrorMsg="���ʹ���[����ʱ��]����������-��ʽΪ2016-01-01",requiredErrorMsg="[����ʱ��]�Ǳ�����")
	private Date birthday;
	/** �Ԅe */
	@InputColAnnotation(colCoord=4,required=true,requiredErrorMsg="[�Ԅe]�Ǳ�����")
	private String gender;
	/** ������Ů̖ */
	@InputColAnnotation(colCoord=11)
	private String onlyChildNumber;
	/** ��߅�� */
	@InputColAnnotation(colCoord=12)
	private String half;
	/** �뻧����ϵ */
	@InputColAnnotation(colCoord=2)
	private String relationshipStr;
	/** �������� */
	@InputColAnnotation(colCoord=3)
	private String householdStr;
	/** �Ƿ�μӹ��籣 */
	@InputColAnnotation(colCoord=10)
	private String socialsecurity;
	/**�ܽ����̶�*/
	@InputColAnnotation(colCoord=7)
	private String educationLevel;
	/**�ڶ����*/	
	@InputColAnnotation(colCoord=8)
	private String currentEducationSituation;
	/**��ũʱ��*/
	@InputColAnnotation(colCoord=9)
	private String farmingTime;
	/**�����ۣ��ͽ̵������ʱ��*/
	@InputColAnnotation(colCoord=13)
	private String serveArmySituation;
	/**�绰*/
	@InputColAnnotation(colCoord=14)
	private String tel;
	/**��ע*/
	@InputColAnnotation(colCoord=15)
	private String remark;
	
	public String getName() {
		return name;
	}
	public String getIdNumber() {
		return idNumber;
	}
	public Date getBirthday() {
		return birthday;
	}
	public String getGender() {
		return gender;
	}
	public String getOnlyChildNumber() {
		return onlyChildNumber;
	}
	public String isHalf() {
		return half;
	}
	public String getRelationshipStr() {
		return relationshipStr;
	}
	public String getHouseholdStr() {
		return householdStr;
	}
	public String isSocialsecurity() {
		return socialsecurity;
	}
	public String getEducationLevel() {
		return educationLevel;
	}
	public String getCurrentEducationSituation() {
		return currentEducationSituation;
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
	
}
