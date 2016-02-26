package com.tq.requisition.presentation.dto.hpt;

import java.util.Date;
import java.util.UUID;

import com.excel.util.annotation.InputColAnnotation;
import com.tq.requisition.domain.model.housePuraseTicket.HousePuraseTicket;

/**
 * ���뵼������ȯ��Ϣmodel
 * 
 * @author jjh
 * @time 2016-21-05
 * 
 */
public class HPTImportAndExport {
	/** ���� */
	@InputColAnnotation(colCoord = 0)
	private String num;

	/** ��Ŀ���� */
	@InputColAnnotation(colCoord = 1)
	private String proName;

	/** ���� */
	@InputColAnnotation(colCoord = 2)
	private String name;

	/** �뻧����ϵ */
	@InputColAnnotation(colCoord = 3)
	private String relationship;

	/** ���֤ */
	@InputColAnnotation(colCoord = 4,only=true,required = true,onlyErrorMsg = "[���֤]ֻ��Ψһ",requiredErrorMsg = "[���֤]����Ϊ��")
	private String idNumber;

	/** �˿� */
	@InputColAnnotation(colCoord = 5,converErrorMsg = "���ʹ���[�˿�]������")
	private int fmlNumber;

	/** ȯ�� */
	@InputColAnnotation(colCoord = 6,only=true,required = true,onlyErrorMsg = "[ȯ��]ֻ��Ψһ",requiredErrorMsg = "[ȯ��]����Ϊ��")
	private String ticketNumber;

	/** ��� */
	@InputColAnnotation(colCoord = 7,required = true,converErrorMsg="���ʹ���[�������]��С������",requiredErrorMsg = "[���]����Ϊ��")
	private float money;

	/**������id*/
	private UUID fmlItemId;

	public HousePuraseTicket toHPT() {
		HousePuraseTicket hpt = new HousePuraseTicket();
		hpt.setBonus(money);
		hpt.setFmlItemId(fmlItemId);
		hpt.setIdNumber(idNumber);
		hpt.setMakeDate(new Date());
		hpt.setName(name);
		hpt.setTicketNumber(ticketNumber);

		return hpt;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRelationship() {
		return relationship;
	}

	public void setRelationship(String relationship) {
		this.relationship = relationship;
	}

	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}

	public int getFmlNumber() {
		return fmlNumber;
	}

	public void setFmlNumber(int fmlNumber) {
		this.fmlNumber = fmlNumber;
	}

	public String getTicketNumber() {
		return ticketNumber;
	}

	public void setTicketNumber(String ticketNumber) {
		this.ticketNumber = ticketNumber;
	}

	public float getMoney() {
		return money;
	}

	public void setMoney(Float money) {
		this.money = money;
	}

	public UUID getFmlItemId() {
		return fmlItemId;
	}

	public void setFmlItemId(UUID fmlItemId) {
		this.fmlItemId = fmlItemId;
	}
	
	
}
