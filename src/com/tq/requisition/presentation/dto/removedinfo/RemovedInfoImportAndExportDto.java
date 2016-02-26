package com.tq.requisition.presentation.dto.removedinfo;

import java.util.Date;

import com.excel.util.annotation.InputColAnnotation;
import com.excel.util.annotation.OutputColAnnotation;
import com.tq.requisition.domain.model.removedInfo.RemovedInfo;

public class RemovedInfoImportAndExportDto {
	/**Ǩ��������*/
	@InputColAnnotation(colCoord = 0, required = true,requiredErrorMsg="[Ǩ��������]����Ϊ��")
	@OutputColAnnotation(colCoord = 0)
	private String name;

	/**Ǩ��������֤*/
	@InputColAnnotation(colCoord = 1, required = true,requiredErrorMsg="[Ǩ��������֤]����Ϊ��")
	@OutputColAnnotation(colCoord = 1)
	private String idNumber;
	
	/**��������*/
	@InputColAnnotation(colCoord = 2, required = true,requiredErrorMsg="[��������]����Ϊ��",converErrorMsg = "���ʹ���[��������]��ʱ������")
	@OutputColAnnotation(colCoord = 2)
	private Date birthDay;
	
	/**��Ǩ����*/
	@InputColAnnotation(colCoord = 3, required = true,requiredErrorMsg="[��Ǩ����]����Ϊ��",converErrorMsg = "���ʹ���[��Ǩ����]��ʱ������")
	@OutputColAnnotation(colCoord = 3)
	private Date removeDate;
	
	@InputColAnnotation(colCoord = 4, required = false)
	@OutputColAnnotation(colCoord = 4)
	/**Ǩ���˵�ַ*/
	private String address;
	
	public RemovedInfo toRemovedInfo() {
		RemovedInfo info = new RemovedInfo();
		info.setAddress(address);
		info.setBirthDay(birthDay);
		info.setIdNumber(idNumber);
		info.setRemoveDate(removeDate);
		info.setName(name);
		return info;
	}
}