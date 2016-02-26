package com.tq.requisition.presentation.dto.socialsecurityMgt;

import java.util.Date;
import java.util.UUID;

/**
 * ����ǰ��ѯmodel
 * @author jjh
 * @time 2015-01-04 20:42
 *
 */
public class Socialsecurity4AddDto {
	private UUID proId;
	private UUID fmlItemId;
	private String proName;
	private String name;
	private String idNumber;
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
	/**��������*/
	private Date birthday;

	public UUID getProId() {
		return proId;
	}
	public void setProId(UUID proId) {
		this.proId = proId;
	}
	public UUID getFmlItemId() {
		return fmlItemId;
	}
	public void setFmlItemId(UUID fmlItemId) {
		this.fmlItemId = fmlItemId;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
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
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	
	public Socialsecurity4AddDto(UUID proId, UUID fmlItemId, String proName,
			String name, String idNumber,Date birthday) {
		super();
		this.proId = proId;
		this.fmlItemId = fmlItemId;
		this.proName = proName;
		this.name = name;
		this.idNumber = idNumber;
		this.birthday = birthday;
	}	
}
