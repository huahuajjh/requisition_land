package com.tq.requisition.presentation.actions.socialSecurityMansgement;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.excel.util.ExcelFactory;
import com.excel.util.error.ConvertErrorException;
import com.excel.util.intefaces.IErrorCallback;
import com.excel.util.intefaces.IExcelInput;
import com.excel.util.model.ExcelRowError;
import com.tq.requisition.domain.model.socialsecurity.SocialsecurityInfo;
import com.tq.requisition.infrastructure.utils.ConfigFileUtil;
import com.tq.requisition.infrastructure.utils.Formater.OperationResult;
import com.tq.requisition.infrastructure.utils.Serialization;
import com.tq.requisition.presentation.actions.BaseAction;
import com.tq.requisition.presentation.dto.share.SocialsecurityTypeDto;
import com.tq.requisition.presentation.dto.socialsecurityMgt.NewSocialsecurityDto;
import com.tq.requisition.presentation.dto.socialsecurityMgt.SsImportAndExportDto;
import com.tq.requisition.presentation.serviceContract.rmHousehold.IFamilyItemServiceContract;
import com.tq.requisition.presentation.serviceContract.share.IShareTypeServiceContract;
import com.tq.requisition.presentation.serviceContract.socialsecurityMgt.ISocialsecurityMgtServiceContract;

@SuppressWarnings("serial")
public class SolmImportFile extends BaseAction {

	private ISocialsecurityMgtServiceContract ssService;
	private IFamilyItemServiceContract familyItemServiceContract;
	private IShareTypeServiceContract shareTypeServiceContract;
	
	private List<SocialsecurityTypeDto> socialsecurityTypeDtos;
	public List<SocialsecurityTypeDto> getSocialsecurityTypeDtos() {
		return socialsecurityTypeDtos;
	}

	private String idNumber;
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	
	private String dataJson;

	public void setDataJson(String dataJson) {
		this.dataJson = dataJson;
	}

	public SolmImportFile(){
		this.ssService = getService("ssService", ISocialsecurityMgtServiceContract.class);
		this.familyItemServiceContract = getService("fmlItemService", IFamilyItemServiceContract.class);
		this.shareTypeServiceContract = getService("shareTypeService", IShareTypeServiceContract.class);
	}
	
	@Override
	public String execute() throws Exception {
		this.socialsecurityTypeDtos = this.shareTypeServiceContract.getAllSocialsecurityTypeList();
		return super.execute();
	}
	
	public String get() throws IOException{
		System.out.println(idNumber);
		String jsonState = this.familyItemServiceContract.queryByIdNumber(idNumber);
		response().getWriter().write(jsonState);
		return null;
	}
	
	public String add() throws IOException{
		String stateJson = "";
		try {
			NewSocialsecurityDto dto = Serialization.toObject(dataJson, NewSocialsecurityDto.class);
			//д�������Ա
			dto.setOprUserId(userId());
			dto.setOprDate(new Date());
			stateJson = this.ssService.addSSInfo(dto);
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
				 int rowIndex = Integer.parseInt(ConfigFileUtil.readByKey("socialSecurityRowIndex"));
				 List<SsImportAndExportDto> items =  excelInput.getDatas(SsImportAndExportDto.class, rowIndex);
				if(errors.size() > 0){
					 String str = toForMaterJson(OperationResult.ERROR, "�ϴ������밴����ť�鿴��ϸ����", errors.toArray());
					 response().getWriter().write(str);
					 return null;
				 } else {
					 String stateJsonString = "";
					 if(items.size() > 0 ){
						 List<SocialsecurityInfo> dots = new ArrayList<>();
						 for (SsImportAndExportDto item : items) {
							item.setUserId(userId());
							dots.add(item.toSocialsecurityInfo());
						}
						 stateJsonString = this.ssService.importSS(dots);
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
