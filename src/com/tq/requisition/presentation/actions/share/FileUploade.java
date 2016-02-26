package com.tq.requisition.presentation.actions.share;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.UUID;

import org.apache.commons.io.FileUtils;

import sun.misc.BASE64Decoder;

import com.tq.requisition.infrastructure.utils.Formater.OperationResult;
import com.tq.requisition.presentation.actions.BaseAction;

@SuppressWarnings("serial")
public class FileUploade extends BaseAction {	
	
	private String fileType;
    private File file ; //�����ϴ��ļ��� ���� , ָ����ʱĿ¼�е���ʱ�ļ�  
    private String fileFileName ;  // �ϴ��ļ������� ,FileName �̶���д��  
//    private String fileContentType ; //�ϴ��ļ������ͣ� ContentType �̶���д��
    
    private String baseSFFile;//base64ͼƬ�ļ�
	
	public String updateFile() throws IOException{
		String jsonState = "";
		String path = request().getRealPath("/uploadFile");
		path = path + ConstValue.getType(fileType);
		createDir(path);
		String name =UUID.randomUUID().toString();
		int dotIndex = fileFileName.lastIndexOf(".");
		if(dotIndex > -1){
			name =name + fileFileName.substring(dotIndex);
		}
		path = path + "/" +name;
		File tempFile = null;
		try {
			tempFile = new File(path);
			if(!tempFile.exists()){
				tempFile.createNewFile();
			}
			FileUtils.copyFile(file, tempFile);
			file.delete();
			String rFilePath =fileFileName + "/uploadFile" + ConstValue.getType(fileType) + "/"+name;
			jsonState = toForMaterJson(OperationResult.SUCCESS,"�ϴ��ļ��ɹ�",rFilePath);
		} catch (Exception e) {
			jsonState = toForMaterJson(OperationResult.ERROR,"�ϴ��ļ�ʧ��");
		}
		response().getWriter().write(jsonState);
		return null;
	}
	
	public String saveFile() throws IOException{
		String stateJson = "";
		if(baseSFFile == null || baseSFFile.equals("")){
			stateJson = toForMaterJson(OperationResult.ERROR, "�ύ��Ϣ�ɴ���");
		} else {
			BASE64Decoder decoder = new BASE64Decoder();
			byte[] bytes = decoder.decodeBuffer(baseSFFile);
			for (int i = 0; i < bytes.length; ++i) {
				if (bytes[i] < 0) {// �����쳣����
					bytes[i] += 256;
				}
			}
			String path = request().getRealPath("/uploadFile") + ConstValue.getType("EVIDENCE_FILE");
			createDir(path);
			String fileName = UUID.randomUUID().toString() + ".jpg";
			File file = new File(path + "/" +fileName);
			if(file.exists()){
				file.createNewFile();
			}
			OutputStream out = null;
			try {
				out = new FileOutputStream(file);
				out.write(bytes);
				out.flush();
			}finally{
				if(out!=null){
					out.close();
				}
			}
			String rFilePath = "uploadFile" + ConstValue.getType("EVIDENCE_FILE") +"/"+ fileName;
			stateJson = toForMaterJson(OperationResult.SUCCESS, "�ϴ��ļ��ɹ�",rFilePath);
		}
		response().getWriter().write(stateJson);
		return null;
	}
	
	private void createDir(String path){
		File dir = new File(path);
		if(!dir.exists()){
			dir.mkdirs();
		}
	}

	public void setFile(File file) {
		this.file = file;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

//	public void setFileContentType(String fileContentType) {
//		this.fileContentType = fileContentType;
//	}

	public void setBaseSFFile(String baseSFFile) {
		this.baseSFFile = baseSFFile;
	}

	
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	
}
