package com.tq.requisition.presentation.dto.hpt;

import java.util.Date;
import java.util.UUID;

import com.tq.requisition.domain.model.share.TicketState;

public class HPTDisplayFmlDto {
	/**��Ŀ����*/
	private String proName;
	/**��Ŀid*/
	private UUID proId;
	/**����ȯid*/
	private UUID hptId;
	/**��Ǩ����Աid*/
	private UUID fmlItemId;
	/**����*/
	private String name;
	/**���֤*/
	private String idNumber;
	/**ȯ��*/
	private String ticketNumber;
	/**���*/
	private float bonus;
	/**����ȯ״̬*/
	private TicketState ticketState;
	/**��ȯ����*/
	private Date makeTime;
	/**�뻧����ϵ*/
	private String relationship;
	/**�뻧����ϵ*/
	private String otherRelationship;
	
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public UUID getProId() {
		return proId;
	}
	public void setProId(UUID proId) {
		this.proId = proId;
	}
	public UUID getHptId() {
		return hptId;
	}
	public void setHptId(UUID hptId) {
		this.hptId = hptId;
	}
	public UUID getFmlItemId() {
		return fmlItemId;
	}
	public void setFmlItemId(UUID fmlItemId) {
		this.fmlItemId = fmlItemId;
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
	public String getTicketNumber() {
		return ticketNumber;
	}
	public void setTicketNumber(String ticketNumber) {
		this.ticketNumber = ticketNumber;
	}
	public float getBonus() {
		return bonus;
	}
	public void setBonus(float bonus) {
		this.bonus = bonus;
	}
	public TicketState getTicketState() {
		return ticketState;
	}
	public void setTicketState(TicketState ticketState) {
		this.ticketState = ticketState;
	}
	public Date getMakeTime() {
		return makeTime;
	}
	public void setMakeTime(Date makeTime) {
		this.makeTime = makeTime;
	}
	public String getRelationship() {
		return relationship;
	}
	public void setRelationship(String relationship) {
		this.relationship = relationship;
	}
	public String getOtherRelationship() {
		return otherRelationship;
	}
	public void setOtherRelationship(String otherRelationship) {
		this.otherRelationship = otherRelationship;
	}
	
	public HPTDisplayFmlDto(){}
	public HPTDisplayFmlDto(String proName, UUID proId, UUID hptId,
			UUID fmlItemId, String name, String idNumber, String ticketNumber,
			float bonus, TicketState ticketState, Date makeTime, String relationship,String otherRelationship) {
		super();
		this.proName = proName;
		this.proId = proId;
		this.hptId = hptId;
		this.fmlItemId = fmlItemId;
		this.name = name;
		this.idNumber = idNumber;
		this.ticketNumber = ticketNumber;
		this.bonus = bonus;
		this.ticketState = ticketState;
		this.makeTime = makeTime;
		this.relationship = relationship;
		this.otherRelationship = otherRelationship;
	}	
}
