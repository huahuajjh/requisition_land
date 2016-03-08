package com.tq.requisition.presentation.dto.socialsecurityMgt;

import java.util.Date;
import java.util.UUID;

/**
 * �����籣��Ϣdto
 * @author jjh
 * @time 2015-12-31 18��57
 */
public class NewSocialsecurityDto {
	/*private fields*/
	private UUID id;
	/**�籣��id*/
	private UUID fmlItemId;
	/**�����籣����*/
	private Date socialsecurityDate;
	/**�����籣����id*/
	private UUID socialsecurityTypeId;
	/**��������*/
	private Date oprDate;
	/**������id*/
	private UUID oprUserId;
	private boolean del;
	/**���ӷ���ʱ��(��)*/
	private Integer serveArmyTime;
	/**���ϱ��ղ�������*/
	private Integer endowmentInsuranceYear;
	/**ҽ�Ʊ�����ͬ�ɷ�����*/
	private Integer medicalInsuranceMonth;
	/**�μӺ���ҽ�Ʊ���*/
	private String joinWhichMedicalInsurance;
	/**��������*/
	private String community;
	/**���̻��Ͷ�����ʱ��(��)*/
	private Integer prisonTime;
	/**�Ƿ�μӹ��籣*/
	private Boolean isSocialsecurity;
	/**�����*/
	private String ageRange;
	
	/**�����˵ı�ʶ*/
	private String createUid;
	/**����ʱ��*/
	private Date createDate;
	
	/*constructors*/
	public NewSocialsecurityDto(){}
	public NewSocialsecurityDto(UUID fmlItemId, Date socialsecurityDate,
			UUID socialsecurityTypeId, Date oprDate, UUID oprUserId) {
		super();
		this.fmlItemId = fmlItemId;
		this.socialsecurityDate = socialsecurityDate;
		this.socialsecurityTypeId = socialsecurityTypeId;
		this.oprDate = oprDate;
		this.oprUserId = oprUserId;
	}
	
	/*getters and setters*/
	public UUID getFmlItemId() {
		return fmlItemId;
	}
	public void setFmlItemId(UUID fmlItemId) {
		this.fmlItemId = fmlItemId;
	}
	public Date getSocialsecurityDate() {
		return socialsecurityDate;
	}
	public void setSocialsecurityDate(Date socialsecurityDate) {
		this.socialsecurityDate = socialsecurityDate;
	}
	public UUID getSocialsecurityTypeId() {
		return socialsecurityTypeId;
	}
	public void setSocialsecurityTypeId(UUID socialsecurityTypeId) {
		this.socialsecurityTypeId = socialsecurityTypeId;
	}
	public UUID getId() {
		return id;
	}
	public void setId(UUID id) {
		this.id = id;
	}
	public Date getOprDate() {
		return oprDate;
	}
	public void setOprDate(Date oprDate) {
		this.oprDate = oprDate;
	}
	public UUID getOprUserId() {
		return oprUserId;
	}
	public void setOprUserId(UUID oprUserId) {
		this.oprUserId = oprUserId;
	}
	public boolean isDel() {
		return del;
	}
	public void setDel(boolean del) {
		this.del = del;
	}
	public Integer getServeArmyTime() {
		return serveArmyTime;
	}
	public void setServeArmyTime(Integer serveArmyTime) {
		this.serveArmyTime = serveArmyTime;
	}
	public Integer getEndowmentInsuranceYear() {
		return endowmentInsuranceYear;
	}
	public void setEndowmentInsuranceYear(Integer endowmentInsuranceYear) {
		this.endowmentInsuranceYear = endowmentInsuranceYear;
	}
	public Integer getMedicalInsuranceMonth() {
		return medicalInsuranceMonth;
	}
	public void setMedicalInsuranceMonth(Integer medicalInsuranceMonth) {
		this.medicalInsuranceMonth = medicalInsuranceMonth;
	}
	public String getJoinWhichMedicalInsurance() {
		return joinWhichMedicalInsurance;
	}
	public void setJoinWhichMedicalInsurance(String joinWhichMedicalInsurance) {
		this.joinWhichMedicalInsurance = joinWhichMedicalInsurance;
	}
	public String getCommunity() {
		return community;
	}
	public void setCommunity(String community) {
		this.community = community;
	}
	public Integer getPrisonTime() {
		return prisonTime;
	}
	public void setPrisonTime(Integer prisonTime) {
		this.prisonTime = prisonTime;
	}
	public Boolean getIsSocialsecurity() {
		return isSocialsecurity;
	}
	public void setIsSocialsecurity(Boolean isSocialsecurity) {
		this.isSocialsecurity = isSocialsecurity;
	}
	public String getAgeRange() {
		return ageRange;
	}
	public void setAgeRange(String ageRange) {
		this.ageRange = ageRange;
	}
	public String getCreateUid() {
		return createUid;
	}
	public void setCreateUid(String createUid) {
		this.createUid = createUid;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
}
