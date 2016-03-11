package com.tq.requisition.presentation.dto.hpt;

import java.util.Date;
import java.util.UUID;

public class HPTRecevieInfoDto {
	/**id*/
	private UUID id;
	/**����ȯid*/
	private UUID ticketId;
	/**����ȯ������*/
	private UUID ownerId;
	/**������*/
	private UUID oprUserId;
	/**��������*/
	private Date oprDate;
	/**��ȡƾ֤*/
	private String evidenceOfGetting;
	/**����������*/
	private String name;
	/**���������֤*/
	private String idNumber;
	/**����ʱ��*/
	private Date gettingDate;
	/**�Ƿ�ɾ��*/
	private boolean del;
	/**��ע*/
	private String remark;
	
	public UUID getId() {
		return id;
	}
	public void setId(UUID id) {
		this.id = id;
	}
	public UUID getTicketId() {
		return ticketId;
	}
	public void setTicketId(UUID ticketId) {
		this.ticketId = ticketId;
	}
	public UUID getOwnerId() {
		return ownerId;
	}
	public void setOwnerId(UUID ownerId) {
		this.ownerId = ownerId;
	}
	public UUID getOprUserId() {
		return oprUserId;
	}
	public void setOprUserId(UUID oprUserId) {
		this.oprUserId = oprUserId;
	}
	public Date getOprDate() {
		return oprDate;
	}
	public void setOprDate(Date oprDate) {
		this.oprDate = oprDate;
	}
	public String getEvidenceOfGetting() {
		return evidenceOfGetting;
	}
	public void setEvidenceOfGetting(String evidenceOfGetting) {
		this.evidenceOfGetting = evidenceOfGetting;
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
	public Date getGettingDate() {
		return gettingDate;
	}
	public void setGettingDate(Date gettingDate) {
		this.gettingDate = gettingDate;
	}
	public boolean isDel() {
		return del;
	}
	public void setDel(boolean del) {
		this.del = del;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	@Override
	public String toString() {
		return "HPTRecevieInfoDto [id=" + id + ", ticketId=" + ticketId
				+ ", ownerId=" + ownerId + ", oprUserId=" + oprUserId
				+ ", oprDate=" + oprDate + ", evidenceOfGetting="
				+ evidenceOfGetting + ", name=" + name + ", idNumber="
				+ idNumber + ", gettingDate=" + gettingDate + ", del=" + del
				+ "]";
	}
	
}
