﻿package com.tq.requisition.presentation.actions.projectManagement;

import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.excel.util.ExcelFactory;
import com.excel.util.intefaces.IExcelOutput;
import com.excel.util.model.ColAttrVal;
import com.excel.util.model.ExcelColData;
import com.tq.requisition.infrastructure.utils.Formater.OperationResult;
import com.tq.requisition.infrastructure.utils.ConfigFileUtil;
import com.tq.requisition.infrastructure.utils.ProExcelHead;
import com.tq.requisition.infrastructure.utils.Serialization;
import com.tq.requisition.presentation.actions.BaseAction;
import com.tq.requisition.presentation.dto.project.ProImportAndExportDto;
import com.tq.requisition.presentation.dto.removedinfo.RemovedExportCondition;
import com.tq.requisition.presentation.dto.rmHousehold.FamilyAndItem;
import com.tq.requisition.presentation.dto.rmHousehold.FamilyDto;
import com.tq.requisition.presentation.dto.rmHousehold.FamilyItemDto;
import com.tq.requisition.presentation.dto.rmHousehold.FamilyQueryModel;
import com.tq.requisition.presentation.dto.share.AddressDto;
import com.tq.requisition.presentation.dto.share.HouseholdTypeDto;
import com.tq.requisition.presentation.dto.share.PageModel;
import com.tq.requisition.presentation.dto.share.RelationshipTypeDto;
import com.tq.requisition.presentation.serviceContract.rmHousehold.IFamilyItemServiceContract;
import com.tq.requisition.presentation.serviceContract.rmHousehold.IFamilyMgtServiceContract;
import com.tq.requisition.presentation.serviceContract.share.IAddressServiceContract;
import com.tq.requisition.presentation.serviceContract.share.IShareTypeServiceContract;

@SuppressWarnings("serial")
public class QueryRemoveInfo extends BaseAction {

	private IAddressServiceContract addressServiceContract;
	private IFamilyItemServiceContract familyItemServiceContract;
	private IFamilyMgtServiceContract familyMgtServiceContract;
	private IShareTypeServiceContract shareTypeServiceContract;

	private List<AddressDto> addressDtos;
	private List<HouseholdTypeDto> householdTypeDtos;
	private List<RelationshipTypeDto> relationshipTypeDtos;

	public List<AddressDto> getAddressDtos() {
		return addressDtos;
	}

	public List<HouseholdTypeDto> getHouseholdTypeDtos() {
		return householdTypeDtos;
	}

	public List<RelationshipTypeDto> getRelationshipTypeDtos() {
		return relationshipTypeDtos;
	}

	private int pageNum = 30;
	private int pageIndex = 1;

	private String queryProName;
	private String proId = "";
	private String idNumber = null;
	private String huZhuName = "";
	private String streetId = "";
	private String communityId = "";
	private String zuId = "";
	private String address;

	private String dataJson = "";
	private String id = "";

	private String daYinIds;
	
	private InputStream outputStream;
	private String downloadChineseFileName;
	public InputStream getOutputStream() {
		return outputStream;
	}
	public String getDownloadChineseFileName() {
		return downloadChineseFileName;
	}	
	
	private String daoChuHead;
	public void setDaoChuHead(String daoChuHead) {
		this.daoChuHead = daoChuHead;
	}
	
	private String daYinData;
	public void setDaYinData(String daYinData) {
		this.daYinData = daYinData;
	}
	
	private String daoChuAttrModel;
	public void setDaoChuAttrModel(String daoChuAttrModel) {
		this.daoChuAttrModel = daoChuAttrModel;
	}

	public QueryRemoveInfo() {
		this.addressServiceContract = getService("addressService",
				IAddressServiceContract.class);
		this.familyItemServiceContract = getService("fmlItemService",
				IFamilyItemServiceContract.class);
		this.shareTypeServiceContract = getService("shareTypeService",
				IShareTypeServiceContract.class);
		this.familyMgtServiceContract = getService("fmlService",
				IFamilyMgtServiceContract.class);
	}

	@Override
	public String execute() throws Exception {
		this.addressDtos = this.addressServiceContract.getAddress();
		this.householdTypeDtos = this.shareTypeServiceContract
				.getAllHouseholdTypeList();
		this.relationshipTypeDtos = this.shareTypeServiceContract
				.getAllRelationshipTypeList();
		return SUCCESS;
	}

	public String list() throws IOException{
		FamilyQueryModel familyQueryModel = new FamilyQueryModel();
		familyQueryModel.setIdNumber(idNumber);
		familyQueryModel.setName(huZhuName);
		if(proId != null && !proId.equals("")){
			familyQueryModel.setProId(UUID.fromString(proId));
		}
		if(!streetId.equals("")){
			familyQueryModel.setStreetId(UUID.fromString(streetId));
		}
		if(!communityId.equals("")){
			familyQueryModel.setCommunityId(UUID.fromString(communityId));
		}
		if(!zuId.equals("")){
			familyQueryModel.setGroupId(UUID.fromString(zuId));
		}
		if(queryProName != null && !queryProName.equals("")){
			familyQueryModel.setProName(queryProName);
		}
		familyQueryModel.setAddress(address);
		PageModel pageModel = new PageModel();
		pageModel.setPageIndex(pageIndex);
		pageModel.setPageSize(pageNum);
		String stateJson = this.familyMgtServiceContract.queryFmlByFuzzy(familyQueryModel, pageModel);
		response().getWriter().write(stateJson);
		return null;
	}

	public String edit() throws IOException {
		String stateJson = "";
		FamilyDto familyItem = Serialization.toObject(dataJson, FamilyDto.class);
		stateJson = this.familyMgtServiceContract.editFml(familyItem);
		response().getWriter().write(stateJson);
		return null;
	}
	
	public String daYin() throws IOException{
		String stateJson = this.familyMgtServiceContract.getFml4Print(daYinIds);
		response().getWriter().write(stateJson);
		return null;
	}
	
	public String daoChu() throws ParseException, IOException {
		List<ExcelColData> colDatas = new ArrayList<>();
		ExcelColData[] colDataArr =  Serialization.toObject(daoChuHead, ExcelColData[].class);
		for (ExcelColData excelColData : colDataArr) {
			colDatas.add(excelColData);
		}
		List<ColAttrVal> colAttrVals = new ArrayList<>();
		ColAttrVal[] cAttrValsArr =  Serialization.toObject(daoChuAttrModel, ColAttrVal[].class);
		for (ColAttrVal cVal : cAttrValsArr) {
			colAttrVals.add(cVal);
		}
		RemovedExportCondition data = Serialization.toObject(this.daYinData, RemovedExportCondition.class);
		List<FamilyAndItem> dtos = this.familyMgtServiceContract
				.exportByDate(data);
		InputStream inputStream = null;
		IExcelOutput excelOutput = null;
		try {
			excelOutput = ExcelFactory.getExcelOutput();
			excelOutput.writeDatas(colDatas);
			excelOutput.writeDatas(FamilyAndItem.class, dtos, colAttrVals, 1);
			downloadChineseFileName = "removed";
			this.outputStream = excelOutput.getInputStream();
			return SUCCESS;
		} catch (IllegalArgumentException e) {
		} catch (IllegalAccessException e) {
		} finally {
			if (inputStream != null) {
				inputStream.close();
			}
			if (excelOutput != null) {
				excelOutput.close();
			}
		}
		return null;
	}

	public String addRemoveInfo() throws IOException {
		String stateJson = "";
		try {
			FamilyItemDto familyItem = Serialization.toObject(dataJson, FamilyItemDto.class);
//			stateJson = this.familyItemServiceContract.(familyItem);
		} catch (Exception e) {
			stateJson = toForMaterJson(OperationResult.ERROR,"数据格式不正确");
		}
		response().getWriter().write(stateJson);
		return null;
	}
	
	public String getRemoveInfos() throws IOException{
		String stateStr = familyItemServiceContract.queryByFmlId(UUID.fromString(id));
		response().getWriter().write(stateStr);
		return null;
	}

	public void setPageNum(int pageNum) {
		if(pageNum < 0) return;
		this.pageNum = pageNum;
	}

	public void setPageIndex(int pageIndex) {
		if(pageIndex < 0) return;
		this.pageIndex = pageIndex;
	}

	public void setProId(String proId) {
		if(proId == null) return;
		this.proId = proId;
	}

	public void setIdNumber(String idNumber) {
		if(idNumber.trim().equals("")) return;
		this.idNumber = idNumber;
	}

	public void setStreetId(String streetId) {
		if(streetId == null) return;
		this.streetId = streetId;
	}

	public void setCommunityId(String communityId) {
		if(communityId == null) return;
		this.communityId = communityId;
	}

	public void setDataJson(String dataJson) {
		if(dataJson == null) return;
		this.dataJson = dataJson;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setHuZhuName(String huZhuName) {
		if(huZhuName == null) return;
		this.huZhuName = huZhuName;
	}
	public void setZuId(String zuId) {
		if(zuId == null) return;
		this.zuId = zuId;
	}
	public void setDaYinIds(String daYinIds) {
		this.daYinIds = daYinIds;
	}
	public void setQueryProName(String queryProName) {
		this.queryProName = queryProName;
	}
	public void setAddress(String address) {
		this.address = address;
	}
}
