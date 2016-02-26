package com.tq.requisition.presentation.dto.project;

import java.math.BigDecimal;
import java.util.Date;
import java.util.UUID;

/**
 * ��Ŀ�¶�dto
 * @author jjh
 * @time 2015-12-27 17:42
 */
public class ProItemDto {
	/*private fields*/
	/** id */
	private UUID id;
	/** �¶��ʱ�� */
	private Date date;
	/** �������ڵ� */
	private float removedLandArea;
	/** �����Ѳ��� */
	private Integer removedBuildings;
	/** ������Ǩ���� */
	private Integer rmovedHouses=0;
	/** �����Ѳ�Ϸ���� */
	private float removedLegalArea;
	/** �����Ѳ�Υ����� */
	private float removedIllegalArea;
	/** �����Ѷ�Ǩ�˿� */
	private Integer movedPopulation;
	/** �����Ѹ��⳥�� */
	private BigDecimal paidMoney;
	/** �����´������ڵؾ����� */
	private Integer yearDeadlineFile;
	/** �������뷨Ժִ�� */
	private Integer yearCourtExecute;
	/** ��������ʵʩǿ���ڵػ��� */
	private Integer yearLegalRemoved;
	/** ��ע */
	private String remark;
	/** ���������� */
	private boolean newStart;
	/** �Ŀid */
	private UUID proId;
	/** ��Ŀ����ʱ�� */
	private Date startDate;
	/** �Ƿ��������Ŀ */
	private String curMonthComplete;

	/*public methods*/
	public static ProItemDto obtain(UUID id, Date date, float removedLandArea,
			Integer removedBuildings, Integer rmovedHouses,
			float removedLegalArea, float removedIllegalArea,
			Integer movedPopulation, BigDecimal paidMoney, Integer yearDeadlineFile,
			Integer yearCourtExecute, Integer yearLegalRemoved, String remark,
			boolean newStart, UUID proId,Date startDate) {
		
		return new ProItemDto(id, date, removedLandArea, removedBuildings, rmovedHouses, removedLegalArea, removedIllegalArea, movedPopulation, paidMoney, yearDeadlineFile, yearCourtExecute, yearLegalRemoved, remark, newStart, proId,startDate);
	}

	/*getters and setters*/
	public UUID getId() {
		return id;
	}

	public void setId(UUID id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public float getRemovedLandArea() {
		return removedLandArea;
	}

	public void setRemovedLandArea(float removedLandArea) {
		this.removedLandArea = removedLandArea;
	}

	public Integer getRemovedBuildings() {
		return removedBuildings;
	}

	public void setRemovedBuildings(Integer removedBuildings) {
		this.removedBuildings = removedBuildings;
	}

	public Integer getRmovedHouses() {
		return rmovedHouses;
	}

	public void setRmovedHouses(Integer rmovedHouses) {
		this.rmovedHouses = rmovedHouses;
	}

	public float getRemovedLegalArea() {
		return removedLegalArea;
	}

	public void setRemovedLegalArea(float removedLegalArea) {
		this.removedLegalArea = removedLegalArea;
	}

	public float getRemovedIllegalArea() {
		return removedIllegalArea;
	}

	public void setRemovedIllegalArea(float removedIllegalArea) {
		this.removedIllegalArea = removedIllegalArea;
	}

	public Integer getMovedPopulation() {
		return movedPopulation;
	}

	public void setMovedPopulation(Integer movedPopulation) {
		this.movedPopulation = movedPopulation;
	}

	public BigDecimal getPaidMoney() {
		return paidMoney;
	}

	public void setPaidMoney(BigDecimal paidMoney) {
		this.paidMoney = paidMoney;
	}

	public Integer getYearDeadlineFile() {
		return yearDeadlineFile;
	}

	public void setYearDeadlineFile(Integer yearDeadlineFile) {
		this.yearDeadlineFile = yearDeadlineFile;
	}

	public Integer getYearCourtExecute() {
		return yearCourtExecute;
	}

	public void setYearCourtExecute(Integer yearCourtExecute) {
		this.yearCourtExecute = yearCourtExecute;
	}

	public Integer getYearLegalRemoved() {
		return yearLegalRemoved;
	}

	public void setYearLegalRemoved(Integer yearLegalRemoved) {
		this.yearLegalRemoved = yearLegalRemoved;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public boolean isNewStart() {
		return newStart;
	}

	public void setNewStart(boolean newStart) {
		this.newStart = newStart;
	}

	public UUID getProId() {
		return proId;
	}

	public void setProId(UUID proId) {
		this.proId = proId;
	}
	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public String getCurMonthComplete() {
		return curMonthComplete;
	}

	public void setCurMonthComplete(String curMonthComplete) {
		this.curMonthComplete = curMonthComplete;
	}

	/*constructors*/
	public ProItemDto(){}
	public ProItemDto(UUID id, Date date, float removedLandArea,
			Integer removedBuildings, Integer rmovedHouses,
			float removedLegalArea, float removedIllegalArea,
			Integer movedPopulation, BigDecimal paidMoney, Integer yearDeadlineFile,
			Integer yearCourtExecute, Integer yearLegalRemoved, String remark,
			boolean newStart, UUID proId,Date startDate) {
		super();
		this.id = id;
		this.date = date;
		this.removedLandArea = removedLandArea;
		this.removedBuildings = removedBuildings;
		this.rmovedHouses = rmovedHouses;
		this.removedLegalArea = removedLegalArea;
		this.removedIllegalArea = removedIllegalArea;
		this.movedPopulation = movedPopulation;
		this.paidMoney = paidMoney;
		this.yearDeadlineFile = yearDeadlineFile;
		this.yearCourtExecute = yearCourtExecute;
		this.yearLegalRemoved = yearLegalRemoved;
		this.remark = remark;
		this.newStart = newStart;
		this.proId = proId;
		this.startDate = startDate;
	}
	
}
