package com.tq.requisition.presentation.dto.hpt;

import java.util.Date;
import java.util.UUID;

import com.tq.requisition.domain.model.share.TicketState;

/**
 * ����ȯdto
 * 
 * @author jjh
 * @time 2015-01-02 17:32
 */
public class HousePuraseTicketDto{
	/** id */
	private UUID id;
	/** ������� */
	private float bonus;
	/** ��ȯ���� */
	private Date makeDate;
	/** ȯ�� */
	private String ticketNumber;
	/** ����ȯ״̬ */
	private TicketState state;
	/** ����ȯ������id */
	private UUID fmlItemId;
	/** ����ȯ���������֤ */
	private String idNumber;
	/** �Ƿ�ɾ�� */
	private boolean del;
	/** ���� */
	private String name;

	/* constructors */
	public HousePuraseTicketDto() {
		this.id = UUID.randomUUID();
		this.state = TicketState.NORMAL;
		this.del = false;
	}

	public HousePuraseTicketDto(UUID id, float bonus, Date makeDate,
			String ticketNumber, TicketState state, UUID fmlItemId,
			String idNumber,String name) {
		this();
		this.makeDate = makeDate;		
		this.bonus = bonus;
		this.ticketNumber = ticketNumber;
		this.fmlItemId = fmlItemId;
		this.idNumber = idNumber;
		this.name = name;
	}

	/* getters and setters */
	public void setId(UUID id) {
		this.id = id;
	}

	public UUID getId() {
		return this.id;
	}

	public float getBonus() {
		return bonus;
	}

	public void setBonus(float bonus) {
		this.bonus = bonus;
	}

	public Date getMakeDate() {
		return makeDate;
	}

	public void setMakeDate(Date makeDate) {
		this.makeDate = makeDate;
	}

	public String getTicketNumber() {
		return ticketNumber;
	}

	public void setTicketNumber(String ticketNumber) {
		this.ticketNumber = ticketNumber;
	}

	public TicketState getState() {
		return state;
	}

	public void setState(TicketState state) {
		this.state = state;
	}

	public UUID getFmlItemId() {
		return fmlItemId;
	}

	public void setFmlItemId(UUID fmlItemId) {
		this.fmlItemId = fmlItemId;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}

	public String getIdNumber() {
		return this.idNumber;
	}

	public boolean getDel() {
		return del;
	}

	public void setDel(boolean del) {
		this.del = del;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
