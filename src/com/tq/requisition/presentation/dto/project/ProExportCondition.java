package com.tq.requisition.presentation.dto.project;

import java.util.Date;

/**
 * ��Ŀ��������model
 * @author jjh
 * @time 2016 02-26 18:19
 * 
 * ���������������ֱ��ǣ��Ƿ�Ϊ������ɽ�����Ŀ����Ŀ����
 * @author bless
 * @time 2016/3/4 16:01
 */
public class ProExportCondition {
	/**��ʼ����*/
	private Date startDate;
	
	/**��������*/
	private Date endDate;
	
	/**�Ƿ������*/
	private Boolean isInstantAchieve;
	
	/**��Ŀ����*/
	private String proCategory;

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

	public Boolean getIsInstantAchieve() {
		return isInstantAchieve;
	}

	public void setIsInstantAchieve(Boolean isInstantAchieve) {
		this.isInstantAchieve = isInstantAchieve;
	}

	public String getProCategory() {
		return proCategory;
	}

	public void setProCategory(String proCategory) {
		this.proCategory = proCategory;
	}
}
