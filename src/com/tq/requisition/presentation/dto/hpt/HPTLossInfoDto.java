package com.tq.requisition.presentation.dto.hpt;

import java.util.Date;
import java.util.UUID;

public class HPTLossInfoDto {
	/**id*/
	private UUID id;
	/**��ʧ����*/
	private Date reportOfLossDate;
	/**������*/
	private UUID oprUserId;
	/**��������*/
	private Date oprDate;
	/**��ʧ��*/
	private UUID fmlItemId;
	/**��ʧ�Ĺ���ȯ*/
	private UUID ticketId;
	/**�Ƿ�ɾ��*/
	private boolean del;
	
	
	public UUID getId() {
		return id;
	}
	public void setId(UUID id) {
		this.id = id;
	}
	public Date getReportOfLossDate() {
		return reportOfLossDate;
	}
	public void setReportOfLossDate(Date reportOfLossDate) {
		this.reportOfLossDate = reportOfLossDate;
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
	public UUID getFmlItemId() {
		return fmlItemId;
	}
	public void setFmlItemId(UUID fmlItemId) {
		this.fmlItemId = fmlItemId;
	}
	public UUID getTicketId() {
		return ticketId;
	}
	public void setTicketId(UUID ticketId) {
		this.ticketId = ticketId;
	}
	public boolean isDel() {
		return del;
	}
	public void setDel(boolean del) {
		this.del = del;
	}	
}
