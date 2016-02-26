package com.tq.requisition.presentation.actions.removedDocManagement;

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
import com.tq.requisition.infrastructure.utils.Serialization;
import com.tq.requisition.infrastructure.utils.Formater.OperationResult;
import com.tq.requisition.presentation.actions.BaseAction;
import com.tq.requisition.presentation.dto.removedinfo.RemovedInfoDto;
import com.tq.requisition.presentation.dto.removedinfo.RemovedInfoImportAndExportDto;
import com.tq.requisition.presentation.dto.share.AddressDto;
import com.tq.requisition.presentation.serviceContract.removedInfo.IRemovedInfoServiceContract;
import com.tq.requisition.presentation.serviceContract.share.IAddressServiceContract;

@SuppressWarnings("serial")
public class RemovedInfoAdd extends BaseAction {

	private List<AddressDto> addressDtos;
	public List<AddressDto> getAddressDtos() {
		return addressDtos;
	}
	
	private IRemovedInfoServiceContract removedInfoServiceContract;
	private IAddressServiceContract addressServiceContract;
	
	public RemovedInfoAdd(){
		this.addressServiceContract = getService("addressService", IAddressServiceContract.class);
		this.removedInfoServiceContract = getService("removedInfoService", IRemovedInfoServiceContract.class);
	}
	
	private String dataJson;
	public void setDataJson(String dataJson) {
		this.dataJson = dataJson;
	}

	@Override
	public String execute() throws Exception {
		this.addressDtos = this.addressServiceContract.getAddress();
		return super.execute();
	}
	
	public String add() throws IOException{
		RemovedInfoDto dto = Serialization.toObject(dataJson, RemovedInfoDto.class); 
		String stateJson = removedInfoServiceContract.addInfo(dto);
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
				 int removedInfoRowIndex = Integer.parseInt(ConfigFileUtil.readByKey("removedInfoRowIndex"));
				List<RemovedInfoImportAndExportDto> dtos = excelInput.getDatas(RemovedInfoImportAndExportDto.class,removedInfoRowIndex);
				if(errors.size() > 0){
					 String str = toForMaterJson(OperationResult.ERROR, "�ϴ������밴����ť�鿴��ϸ����", errors.toArray());
					 response().getWriter().write(str);
					 return null;
				 } else {
					 String stateJsonString = "";
					 if(dtos.size() > 0){
						 stateJsonString = this.removedInfoServiceContract.importRemovedInfo(dtos);
					 } else {
						 stateJsonString = toForMaterJson(OperationResult.SUCCESS, "�ļ���û������");
					 }
					 response().getWriter().write(stateJsonString);
				 }
			} catch (InstantiationException | NoSuchMethodException
					| ConvertErrorException e) {
				String str = toForMaterJson(OperationResult.ERROR, "��ȡExcel�б����");
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
