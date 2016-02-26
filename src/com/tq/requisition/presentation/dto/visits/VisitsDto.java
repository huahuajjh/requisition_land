package com.tq.requisition.presentation.dto.visits;

import java.util.Date;
import java.util.UUID;

public class VisitsDto {
	/**�Ϸ�ʵ��id*/
	private UUID id;
	/**�Ϸ�������*/
	private String visitorName;
	/**�Ϸ����ֻ���*/
	private String visitorTel;
	/**�Ϸ��ߵ�ַ*/
	private String visitorAddr;
	/**������Ϣ*/
	private String otherMsg;
	/**������Ŀ*/
	private String visitProId;
	/**����ԭ��*/
	private String visitReason;
	/**��������*/
	private Date visitTime;
	/**�������*/
	private String visitMaterialPath;
	/**�Ƿ�ɾ��*/
	private boolean del;
	/**��Ŀ����*/
	private String proName;
	
	public UUID getId() {
		return id;
	}
	public void setId(UUID id) {
		this.id = id;
	}
	public String getVisitorName() {
		return visitorName;
	}
	public void setVisitorName(String visitorName) {
		this.visitorName = visitorName;
	}
	public String getVisitorTel() {
		return visitorTel;
	}
	public void setVisitorTel(String visitorTel) {
		this.visitorTel = visitorTel;
	}
	public String getVisitorAddr() {
		return visitorAddr;
	}
	public void setVisitorAddr(String visitorAddr) {
		this.visitorAddr = visitorAddr;
	}
	public String getOtherMsg() {
		return otherMsg;
	}
	public void setOtherMsg(String otherMsg) {
		this.otherMsg = otherMsg;
	}
	public String getVisitProId() {
		return visitProId;
	}
	public void setVisitProId(String visitProId) {
		this.visitProId = visitProId;
	}
	public String getVisitReason() {
		return visitReason;
	}
	public void setVisitReason(String visitReason) {
		this.visitReason = visitReason;
	}
	public Date getVisitTime() {
		return visitTime;
	}
	public void setVisitTime(Date visitTime) {
		this.visitTime = visitTime;
	}
	public String getVisitMaterialPath() {
		return visitMaterialPath;
	}
	public void setVisitMaterialPath(String visitMaterialPath) {
		this.visitMaterialPath = visitMaterialPath;
	}
	public boolean isDel() {
		return del;
	}
	public void setDel(boolean del) {
		this.del = del;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
}
