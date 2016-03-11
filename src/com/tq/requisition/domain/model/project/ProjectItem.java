package com.tq.requisition.domain.model.project;

import java.math.BigDecimal;
import java.util.Date;
import java.util.UUID;

import com.tq.requisition.domain.share.Entity;

/**
 * ��Ŀ�¶�ʵ��
 * 
 * @author jjh
 * @time 2015-12-18 13:00
 */
public class ProjectItem extends Entity {
	/*private fields*/
	/** �¶��ʱ�� */
	private Date date;
	/** �������ڵ� */
	private float removedLandArea;
	/** �����Ѳ��� */
	private int removedBuildings;
	/** ������Ǩ���� */
	private int rmovedHouses;
	/** �����Ѳ�Ϸ���� */
	private float removedLegalArea;
	/** �����Ѳ�Υ����� */
	private float removedIllegalArea;
	/** �����Ѷ�Ǩ�˿� */
	private int movedPopulation;
	/** �����Ѹ��⳥�� */
	private BigDecimal paidMoney;
	/** �����´������ڵؾ����� */
	private int yearDeadlineFile;
	/** �������뷨Ժִ�� */
	private int yearCourtExecute;
	/** ��������ʵʩǿ���ڵػ��� */
	private int yearLegalRemoved;
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
	
	/*getters and setters*/
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
	public int getRemovedBuildings() {
		return removedBuildings;
	}
	public void setRemovedBuildings(int removedBuildings) {
		this.removedBuildings = removedBuildings;
	}
	public int getRmovedHouses() {
		return rmovedHouses;
	}
	public void setRmovedHouses(int rmovedHouses) {
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
	public int getMovedPopulation() {
		return movedPopulation;
	}
	public void setMovedPopulation(int movedPopulation) {
		this.movedPopulation = movedPopulation;
	}
	public BigDecimal getPaidMoney() {
		return paidMoney;
	}
	public void setPaidMoney(BigDecimal paidMoney) {
		this.paidMoney = paidMoney;
	}
	public int getYearDeadlineFile() {
		return yearDeadlineFile;
	}
	public int getYearCourtExecute() {
		return yearCourtExecute;
	}
	public void setYearCourtExecute(int yearCourtExecute) {
		this.yearCourtExecute = yearCourtExecute;
	}
	public int getYearLegalRemoved() {
		return yearLegalRemoved;
	}
	public void setYearLegalRemoved(int yearLegalRemoved) {
		this.yearLegalRemoved = yearLegalRemoved;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public boolean getNewStart() {
		return newStart;
	}
	public void setNewStart(boolean newStart) {
		this.newStart = newStart;
	}
	public void setId(UUID id) {
		this.id = id;
	}
	public UUID getId() {
		return this.id;
	}
	public void setProId(UUID proId) {
		this.proId = proId;
	}
	public UUID getProId() {
		return this.proId;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public void setYearDeadlineFile(int yearDeadlineFile) {
		this.yearDeadlineFile = yearDeadlineFile;
	}
	public String getCurMonthComplete() {
		return curMonthComplete;
	}
	public void setCurMonthComplete(String curMonthComplete) {
		this.curMonthComplete = curMonthComplete;
	}

	
	/*constructors*/
	public ProjectItem(){
		this.id = UUID.randomUUID();
	}
	public ProjectItem(UUID id,Date date, float removedLandArea,
			int removedBuildings, int rmovedHouses,
			float removedLegalArea, float removedIllegalArea,
			int movedPopulation, BigDecimal paidMoney, int yearDeadlineFile,
			int yearCourtExecute, int yearLegalRemoved, String remark,
			boolean newStart, UUID proId,Date startDate) {
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

	/*public methods*/
	public static ProjectItem obtain(UUID id,Date date, float removedLandArea,
			int removedBuildings, int rmovedHouses,
			float removedLegalArea, float removedIllegalArea,
			int movedPopulation, BigDecimal paidMoney, int yearDeadlineFile,
			int yearCourtExecute, int yearLegalRemoved, String remark,
			boolean newStart, UUID proId,Date startDate) {
		
		ProjectItem item = new ProjectItem();
		item.setId(UUID.randomUUID());
		item.setRemovedLandArea(removedLandArea);
		item.setRemovedBuildings(removedBuildings);
		item.setRmovedHouses(rmovedHouses);
		item.setRemovedLegalArea(removedLegalArea);
		item.setRemovedIllegalArea(removedIllegalArea);
		item.setMovedPopulation(movedPopulation);
		item.setPaidMoney(paidMoney);
		item.setYearDeadlineFile(yearDeadlineFile);
		item.setYearCourtExecute(yearCourtExecute);
		item.setYearLegalRemoved(yearLegalRemoved);
		item.setRemark(remark);
		item.setNewStart(false);
		item.setProId(proId);
		item.setStartDate(startDate);
		item.setDate(date);
		
		return item;
	}

	public void modify(ProjectItem item) {
		this.movedPopulation = item.getMovedPopulation();
		this.paidMoney = item.getPaidMoney();
		this.removedBuildings = item.getRemovedBuildings();
		this.removedIllegalArea = item.getRemovedIllegalArea();
		this.removedLandArea = item.getRemovedLandArea();
		this.removedLegalArea = item.getRemovedLegalArea();
		this.rmovedHouses = item.getRmovedHouses();
		this.yearCourtExecute = item.getYearCourtExecute();
		this.yearDeadlineFile = item.getYearDeadlineFile();
		this.yearLegalRemoved = item.getYearLegalRemoved();
		this.curMonthComplete = item.getCurMonthComplete();
		this.remark = item.getRemark();
	}
	
	/**
	 * ��֤
	 */
	public void validate() {
	}
	
}
