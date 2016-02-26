package com.tq.requisition.domain.model.housePuraseTicket;

import java.util.Date;
import java.util.UUID;

import com.tq.requisition.domain.share.Entity;

/**
 * ����ȯ�ۺϸ�
 * @author jjh
 * @time 2015-12-18 17:09
 */
public class HPTReportOfLossInfo extends Entity{
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
	
	/*getters and setters*/	
	public Date getReportOfLossDate() {
		return reportOfLossDate;
	}
	public boolean getDel() {
		return del;
	}
	public void setDel(boolean del) {
		this.del = del;
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
	public void setId(UUID id) {
		this.id = id;
	}
	public UUID getId() {
		return this.id;
	}
	
	/*constructors*/
	public HPTReportOfLossInfo(){}
	public HPTReportOfLossInfo(UUID id,Date reportOfLossDate, UUID oprUserId,
			Date oprDate, UUID fmlItemId, UUID ticketId) {
		super();
		this.id = UUID.randomUUID();
		this.reportOfLossDate = reportOfLossDate;
		this.oprUserId = oprUserId;
		this.oprDate = oprDate;
		this.fmlItemId = fmlItemId;
		this.ticketId = ticketId;
		this.del = false;
	}
	
}
