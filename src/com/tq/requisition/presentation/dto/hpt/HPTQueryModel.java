package com.tq.requisition.presentation.dto.hpt;

public class HPTQueryModel {
	/**���֤*/
	private String idNumber;
	/**ȯ��*/
	private String ticketNumber;
	
	/*constructors*/
	public HPTQueryModel(){}
	public HPTQueryModel(String idNumber, String ticketNumber) {
		super();
		this.idNumber = idNumber;
		this.ticketNumber = ticketNumber;
	}
	
	/*getters and setters*/
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
}
