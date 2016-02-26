package com.tq.requisition.domain.model.housePuraseTicket;

import java.util.Date;
import java.util.UUID;

import com.tq.requisition.domain.share.Entity;

/**
 * ��ȯ������ʵ��
 * @author jjh
 * @time 2015-12-18 16:53
 */
public class HPTMendInfo extends Entity{
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
	
	/*constructors*/
	public HPTMendInfo(){
		this.id = UUID.randomUUID();
		this.del = false;
	}
	public HPTMendInfo(UUID id,Date mendDate, UUID oprUserId, Date oprDate,
			UUID onwerId, UUID ticketId) {
		this();
		this.mendDate = mendDate;
		this.oprUserId = oprUserId;
		this.oprDate = oprDate;
		this.onwerId = onwerId;
		this.ticketId = ticketId;		
	}
	
	/*getters and setters*/
	public void setId(UUID id) {
		this.id = id;
	}
	public UUID getId() {
		return this.id;
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
	public boolean getDel() {
		return del;
	}
	public void setDel(boolean del) {
		this.del = del;
	}
}
