package com.tq.requisition.presentation.dto.removedinfo;

import java.util.Date;

import com.excel.util.annotation.InputColAnnotation;
import com.excel.util.annotation.OutputColAnnotation;
import com.tq.requisition.domain.model.removedInfo.RemovedInfo;

public class RemovedInfoImportAndExportDto {
	/**迁户人姓名*/
	@InputColAnnotation(colCoord = 0, required = true,requiredErrorMsg="[迁户人姓名]不可为空")
	@OutputColAnnotation(colCoord = 0)
	private String name;

	/**迁户人身份证*/
	@InputColAnnotation(colCoord = 1, required = true,requiredErrorMsg="[迁户人身份证]不可为空")
	@OutputColAnnotation(colCoord = 1)
	private String idNumber;
	
	/**出生日期*/
	@InputColAnnotation(colCoord = 2, required = true,requiredErrorMsg="[出生日期]不可为空",converErrorMsg = "类型错误，[出生日期]是时间类型")
	@OutputColAnnotation(colCoord = 2)
	private Date birthDay;
	
	/**拆迁日期*/
	@InputColAnnotation(colCoord = 3, required = true,requiredErrorMsg="[拆迁日期]不可为空",converErrorMsg = "类型错误，[拆迁日期]是时间类型")
	@OutputColAnnotation(colCoord = 3)
	private Date removeDate;
	
	@InputColAnnotation(colCoord = 4, required = false)
	@OutputColAnnotation(colCoord = 4)
	/**迁户人地址*/
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
