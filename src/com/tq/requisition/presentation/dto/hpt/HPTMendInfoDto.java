package com.tq.requisition.presentation.dto.hpt;

import java.util.Date;
import java.util.UUID;

public class HPTMendInfoDto {
	/**id*/
	private UUID id;
	/**��ȯ����*/
	private Date mendDate;
	/**������*/
	private UUID oprUserId;
	/**��������*/
	private Date oprDate;
	/**��ȯ��*/
	private UUID onwerId;
	/**�Ҳ��Ĺ���ȯ*/
	private UUID ticketId;
	/**�Ƿ�ɾ��*/
	private boolean del;
	
	public UUID getId() {
		return id;
	}
	public void setId(UUID id) {
		this.id = id;
	}
	public Date getMendDate() {
		return mendDate;
	}
	public void setMendDate(Date mendDate) {
		this.mendDate = mendDate;
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
	public UUID getOnwerId() {
		return onwerId;
	}
	public void setOnwerId(UUID onwerId) {
		this.onwerId = onwerId;
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
