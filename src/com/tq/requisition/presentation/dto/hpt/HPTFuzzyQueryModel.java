package com.tq.requisition.presentation.dto.hpt;

import java.util.UUID;

public class HPTFuzzyQueryModel {
	/**项目id*/
	private UUID proId;
	/**券号*/
	private String ticketNumber;
	/**身份证*/
	private String idNumber;
	/**姓名*/
	private String name;

	public UUID getProId() {
		return proId;
	}

	public void setProId(UUID proId) {
		this.proId = proId;
	}

	public String getTicketNumber() {
		return ticketNumber;
	}

	public void setTicketNumber(String ticketNumber) {
		this.ticketNumber = ticketNumber;
	}

	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
