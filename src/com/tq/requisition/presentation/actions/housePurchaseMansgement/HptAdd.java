package com.tq.requisition.presentation.actions.housePurchaseMansgement;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import com.excel.util.ExcelFactory;
import com.excel.util.error.ConvertErrorException;
import com.excel.util.intefaces.IErrorCallback;
import com.excel.util.intefaces.IExcelInput;
import com.excel.util.model.ExcelRowError;
import com.tq.requisition.infrastructure.utils.ConfigFileUtil;
import com.tq.requisition.infrastructure.utils.Formater.OperationResult;
import com.tq.requisition.infrastructure.utils.Serialization;
import com.tq.requisition.presentation.actions.BaseAction;
import com.tq.requisition.presentation.dto.hpt.HPTImportAndExport;
import com.tq.requisition.presentation.dto.hpt.HousePuraseTicketDto;
import com.tq.requisition.presentation.serviceContract.hptMgt.IHPTMgtServiceContract;
import com.tq.requisition.presentation.serviceContract.rmHousehold.IFamilyItemServiceContract;

public class HptAdd extends BaseAction {

	private IFamilyItemServiceContract familyItemServiceContract;
	private IHPTMgtServiceContract hptMgtServiceContract;
	
	public HptAdd(){
		this.familyItemServiceContract = getService("fmlItemService", IFamilyItemServiceContract.class);
		this.hptMgtServiceContract = getService("hptService", IHPTMgtServiceContract.class);
	}
	
	private String idNumber;
	private String name;
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	private String dataJson;
	public void setDataJson(String dataJson) {
		this.dataJson = dataJson;
	}
	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}
	
	public String get() throws IOException{
		String jsonState = this.familyItemServiceContract.queryByIdNumberAndName(idNumber, name);
		response().getWriter().write(jsonState);
		return null;
	}
	
	public String add() throws IOException{
		String stateJson = "";
		try {
			HousePuraseTicketDto dto = Serialization.toObject(dataJson, HousePuraseTicketDto.class);
			stateJson = this.hptMgtServiceContract.add(dto);
		} catch (Exception e) {
			stateJson = toForMaterJson(OperationResult.ERROR,"���ݸ�ʽ����ȷ");
		}
		response().getWriter().write(stateJson);
		return null;
	}
	public String upFile() throws IOException{
		InputStream fileInputStream = null;
		IExcelInput excelInput = null;
		try {
			final List<ExcelRowError> errors = new ArrayList<ExcelRowError>();
			fileInputStream = new FileInputStream(file);
			int errorNum = Integer.parseInt(ConfigFileUtil.readByKey("errorNum"));
			excelInput = ExcelFactory.getExcelInput(fileInputStream,errorNum, new IErrorCallback() {
				@Override
				public void callback(List<ExcelRowError> subErrors) {
					errors.addAll(subErrors);
				}
			});
			 try {
				 int rowIndex = Integer.parseInt(ConfigFileUtil.readByKey("housePurchaseRowIndex"));
				 List<HPTImportAndExport> items =  excelInput.getDatas(HPTImportAndExport.class, rowIndex);
				if(errors.size() > 0){
					 String str = toForMaterJson(OperationResult.ERROR, "�ϴ������밴����ť�鿴��ϸ����", errors.toArray());
					 response().getWriter().write(str);
					 return null;
				 } else {
					 String stateJsonString = "";
					 if(items.size() > 0 ){
						 stateJsonString = this.hptMgtServiceContract.importHPT(items);
					 } else {
						 stateJsonString = toForMaterJson(OperationResult.SUCCESS, "�ļ���û������");
					 }
					 response().getWriter().write(stateJsonString);
				 }
			} catch (InstantiationException | NoSuchMethodException
					| ConvertErrorException e) {
				String str = toForMaterJson(OperationResult.ERROR, "��ȡExcel�б�����");
				 response().getWriter().write(str);
			}
		} catch (IOException e) {
			String str = toForMaterJson(OperationResult.ERROR, "���ϴ���ȷ��Excel�ļ�");
			 response().getWriter().write(str);
		} finally{
			file.delete();
			if(excelInput != null){
				excelInput.close();
			}
			if(fileInputStream != null){
				fileInputStream.close();
			}
		}
		return null;
	}
    private File file ;  
    private String fileFileName ;
	public void setFile(File file) {
		this.file = file;
	}
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
}