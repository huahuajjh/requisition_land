package com.tq.requisition.presentation.dto.project;

import java.util.Date;

/**
 * ��Ŀ��������model
 * @author jjh
 * @time 2016 02-26 18:19
 */
public class ProExportCondition {
	/**��ʼ����*/
	private Date startDate;
	
	/**��������*/
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
