package com.tq.requisition.presentation.dto.project;

import java.util.Date;

/**
 * 项目导出条件model
 * @author jjh
 * @time 2016 02-26 18:19
 */
public class ProExportCondition {
	/**起始日期*/
	private Date startDate;
	
	/**结束日期*/
	private Date endDate;

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
}
