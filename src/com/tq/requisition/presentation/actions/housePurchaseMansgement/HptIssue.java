package com.tq.requisition.presentation.actions.housePurchaseMansgement;

import java.io.IOException;
import java.util.UUID;

import com.tq.requisition.presentation.actions.BaseAction;
import com.tq.requisition.presentation.dto.hpt.HPTFuzzyQueryModel;
import com.tq.requisition.presentation.dto.share.PageModel;
import com.tq.requisition.presentation.serviceContract.hptMgt.IHPTMgtServiceContract;

public class HptIssue extends BaseAction {

private IHPTMgtServiceContract hptMgtServiceContract;
	
	public HptIssue(){
		this.hptMgtServiceContract = getService("hptService", IHPTMgtServiceContract.class);
	}
	
	private int pageNum = 30;
	private int pageIndex = 1;
	private String proId = "";
	private String num;
	private String idNumber;
	private String name;
	public void setNum(String num) {
		this.num = num;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public void setProId(String proId) {
		if(proId == null) return;
		this.proId = proId;
	}
	
	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}
	
	public String list() throws IOException{
		HPTFuzzyQueryModel hptFuzzyQueryModel = new HPTFuzzyQueryModel();
		if(!proId.equals("")){
			hptFuzzyQueryModel.setProId(UUID.fromString(proId));
		}
		PageModel pageModel = new PageModel();
		pageModel.setPageIndex(pageIndex);
		pageModel.setPageSize(pageNum);
		hptFuzzyQueryModel.setName(name);
		hptFuzzyQueryModel.setIdNumber(idNumber);
		hptFuzzyQueryModel.setTicketNumber(num);
		String jsonState = this.hptMgtServiceContract.queryProvideTable(hptFuzzyQueryModel, pageModel);
		response().getWriter().write(jsonState);
		return null;
	}
}
