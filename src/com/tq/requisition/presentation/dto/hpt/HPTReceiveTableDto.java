package com.tq.requisition.presentation.dto.hpt;

import java.util.Date;
import java.util.UUID;

/**
 * ����ȯ����̨��dto
 * @author jjh
 * @time 2015-01-02 22:27
 *
 */
public class HPTReceiveTableDto {
	/**��Ŀid*/
	private UUID proId;
	/**��Ŀ����*/
	private String proName;
	/**��Ǩ����Աid*/
	private UUID fmlItemId;
	/**����ȯ��*/
	private UUID ticketId;
	/**����*/
	private String name;
	/**���֤*/
	private String idNumber;
	/**������*/
	private String gettingPerson;
	/**ȯ��*/
	private String ticketNumber;
	/**ƾ֤*/
	private String evidenve;
	/**����ʱ��*/
	private Date recevieTime;
	/**���*/
	private float bonus;
	
	/*constructors*/
	public HPTReceiveTableDto(){}
	public HPTReceiveTableDto(UUID proId, String proName, UUID fmlItemId,
			UUID ticketId, String name, String idNumber, String gettingPerson,
			String ticketNumber, String evidenve, Date recevieTime, float bonus) {
		super();
		this.proId = proId;
		this.proName = proName;
		this.fmlItemId = fmlItemId;
		this.ticketId = ticketId;
		this.name = name;
		this.idNumber = idNumber;
		this.gettingPerson = gettingPerson;
		this.ticketNumber = ticketNumber;
		this.evidenve = evidenve;
		this.recevieTime = recevieTime;
		this.bonus = bonus;
	}
	
	/*getters and setters*/
	public UUID getProId() {
		return proId;
	}
	public void setProId(UUID proId) {
		this.proId = proId;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
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
	public String getGettingPerson() {
		return gettingPerson;
	}
	public void setGettingPerson(String gettingPerson) {
		this.gettingPerson = gettingPerson;
	}
	public String getTicketNumber() {
		return ticketNumber;
	}
	public void setTicketNumber(String ticketNumber) {
		this.ticketNumber = ticketNumber;
	}
	public String getEvidenve() {
		return evidenve;
	}
	public void setEvidenve(String evidenve) {
		this.evidenve = evidenve;
	}
	public Date getRecevieTime() {
		return recevieTime;
	}
	public void setRecevieTime(Date recevieTime) {
		this.recevieTime = recevieTime;
	}
	public float getBonus() {
		return bonus;
	}
	public void setBonus(float bonus) {
		this.bonus = bonus;
	}
}
