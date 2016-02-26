package com.tq.requisition.presentation.dto.hpt;

import java.util.Date;
import java.util.UUID;

import com.tq.requisition.domain.model.share.UseType;

public class HPTUseAndCashInfoDto {
	/**id*/
	private UUID id;
	/**����ȯ������id*/
	private UUID ownerId;
	/**����ȯid*/
	private UUID ticketId;
	/**ʹ������*/
	private Date usingDate;
	/**ʹ������*/
	private UseType usingType;
	/**ʹ��ȥ��*/
	private String usingToWhere;
	/**���˵��*/
	private String situationExplain;
	/**���ƾ֤*/
	private String evidencePath;
	/**������*/
	private UUID oprUserId;
	/**��������*/
	private Date oprDate;
	/**�Ƿ�ɾ��*/
	private boolean del;
	/**ͼƬ�ɼ�*/
	private String image;
	
	
	public UUID getId() {
		return id;
	}
	public void setId(UUID id) {
		this.id = id;
	}
	public UUID getOwnerId() {
		return ownerId;
	}
	public void setOwnerId(UUID ownerId) {
		this.ownerId = ownerId;
	}
	public UUID getTicketId() {
		return ticketId;
	}
	public void setTicketId(UUID ticketId) {
		this.ticketId = ticketId;
	}
	public Date getUsingDate() {
		return usingDate;
	}
	public void setUsingDate(Date usingDate) {
		this.usingDate = usingDate;
	}
	public UseType getUsingType() {
		return usingType;
	}
	public void setUsingType(UseType usingType) {
		this.usingType = usingType;
	}
	public String getUsingToWhere() {
		return usingToWhere;
	}
	public void setUsingToWhere(String usingToWhere) {
		this.usingToWhere = usingToWhere;
	}
	public String getSituationExplain() {
		return situationExplain;
	}
	public void setSituationExplain(String situationExplain) {
		this.situationExplain = situationExplain;
	}
	public String getEvidencePath() {
		return evidencePath;
	}
	public void setEvidencePath(String evidencePath) {
		this.evidencePath = evidencePath;
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
	public boolean isDel() {
		return del;
	}
	public void setDel(boolean del) {
		this.del = del;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
}
