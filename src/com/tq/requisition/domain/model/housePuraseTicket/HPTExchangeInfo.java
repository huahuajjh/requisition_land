package com.tq.requisition.domain.model.housePuraseTicket;

import java.util.Date;
import java.util.UUID;

import com.tq.requisition.domain.share.Entity;

/**
 * ��ȯ��Ϣʵ��
 * @author jjh
 * @time 2015-12-18 16:53
 */
public class HPTExchangeInfo extends Entity{
	/**������id*/
	private UUID ownerId;
	/**������id*/
	private UUID oprUserId;
	/**��������*/
	private Date oprDate;
	/**��������*/
	private Date exchengeDate;
	/**��ȯid*/
	private UUID newTicketId;
	/**����֤��*/
	private String evidencePath;
	/**��ȯid*/
	private UUID oldTicketId;
	/**�Ƿ�ɾ��*/
	private boolean del;
	/**������*/
	private String gettingUser;
	
	/*constructors*/
	public HPTExchangeInfo(){
		this.id = UUID.randomUUID();
		this.del = false;
	}
	public HPTExchangeInfo(UUID id,UUID ownerId, UUID oprUserId, Date oprDate,
			Date exchengeDate, UUID newTicketId, String evidencePath,
			UUID oldTicketId, String gettingUser) {
		this();		
		this.ownerId = ownerId;
		this.oprUserId = oprUserId;
		this.oprDate = new Date();
		this.exchengeDate = exchengeDate;
		this.newTicketId = newTicketId;
		this.evidencePath = evidencePath;
		this.oldTicketId = oldTicketId;		
		this.gettingUser = gettingUser;
	}
	
	/*getters and setters*/
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
	public Date getExchengeDate() {
		return exchengeDate;
	}
	public void setExchengeDate(Date exchengeDate) {
		this.exchengeDate = exchengeDate;
	}
	public UUID getNewTicketId() {
		return newTicketId;
	}
	public void setNewTicketId(UUID newTicketId) {
		this.newTicketId = newTicketId;
	}
	public String getEvidencePath() {
		return evidencePath;
	}
	public void setEvidencePath(String evidencePath) {
		this.evidencePath = evidencePath;
	}
	public UUID getOldTicketId() {
		return oldTicketId;
	}
	public void setOldTicketId(UUID oldTicketId) {
		this.oldTicketId = oldTicketId;
	}
	public boolean getDel() {
		return del;
	}
	public void setDel(boolean del) {
		this.del = del;
	}
	public String getGettingUser() {
		return gettingUser;
	}
	public void setGettingUser(String gettingUser) {
		this.gettingUser = gettingUser;
	}
	public void setId(UUID id) {
		this.id = id;
	}
	public UUID getId() {
		return this.id;
	}
}

