package com.tq.requisition.presentation.dto.visits;

import java.util.UUID;

public class VisitsQueryModel {
	/**�����ߵ绰*/
	private String tel;
	/**�Ϸ���Ŀid*/
	private UUID proId;

	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public UUID getProId() {
		return proId;
	}
	public void setProId(UUID proId) {
		this.proId = proId;
	}	
}
