package com.tq.requisition.presentation.dto.project;

import java.util.Date;

public class NewProMonthProcessDto {
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
	private float paidMoney;
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
	public float getPaidMoney() {
		return paidMoney;
	}
	public void setPaidMoney(float paidMoney) {
		this.paidMoney = paidMoney;
	}
	public int getYearDeadlineFile() {
		return yearDeadlineFile;
	}
	public void setYearDeadlineFile(int yearDeadlineFile) {
		this.yearDeadlineFile = yearDeadlineFile;
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
	public boolean isNewStart() {
		return newStart;
	}
	public void setNewStart(boolean newStart) {
		this.newStart = newStart;
	}
	
	
}
