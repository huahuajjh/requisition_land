package com.tq.requisition.presentation.actions.housePurchaseMansgement;

import java.io.IOException;
import java.util.Date;

import com.tq.requisition.infrastructure.utils.Formater.OperationResult;
import com.tq.requisition.infrastructure.utils.Serialization;
import com.tq.requisition.presentation.actions.BaseAction;
import com.tq.requisition.presentation.dto.hpt.HPTRecevieInfoDto;
import com.tq.requisition.presentation.serviceContract.hptMgt.IHPTMgtServiceContract;

public class HptSetPerson extends BaseAction {

	private IHPTMgtServiceContract hptMgtServiceContract;
	
	public HptSetPerson(){
		this.hptMgtServiceContract = getService("hptService", IHPTMgtServiceContract.class);
	}
	
	private String idNumber;
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	
	private String dataJson;
	public void setDataJson(String dataJson) {
		this.dataJson = dataJson;
	}

	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}
	
	public void get() throws IOException{
		String jsonState = this.hptMgtServiceContract.queryByIdNumber(idNumber);
		response().getWriter().write(jsonState);
	}
	
	public void add() throws IOException{
		String stateJson = "";
		try {
			HPTRecevieInfoDto dto = Serialization.toObject(dataJson, HPTRecevieInfoDto.class);
			dto.setOprDate(new Date());
			dto.setOprUserId(userId());
			stateJson = this.hptMgtServiceContract.provide(dto);
		} catch (Exception e) {
			stateJson = toForMaterJson(OperationResult.ERROR,"���ݸ�ʽ����ȷ");
		}
		response().getWriter().write(stateJson);
	}
}
