package com.tq.requisition.domain.model.visits;

import java.util.Date;
import java.util.UUID;

import com.tq.requisition.domain.share.AggregateRoot;

/**
 * �ŷþۺϸ�
 * @author jjh
 * @time 2015-12-18 19��09
 */
public class Visits extends AggregateRoot{
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
	
	/**constructors*/
	public Visits() {
		this.id = UUID.randomUUID();
		this.del = false;
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
	public boolean getDel() {
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
	public void setId(UUID id) {
		this.id = id;
	}
	public UUID getId() {
		return this.id;
	}

	/**
	 * �޸�
	 * @param entity
	 */
	public void modify(Visits entity) {
		this.otherMsg = entity.getOtherMsg();
		this.proName = entity.getProName();
		this.visitMaterialPath = entity.getVisitMaterialPath();
		this.visitorAddr = entity.getVisitorAddr();
		this.visitorName = entity.getVisitorName();
		this.visitorTel = entity.getVisitorTel();
		this.visitProId = entity.getVisitProId();
		this.visitReason = entity.getVisitReason();
		this.visitTime = entity.getVisitTime();
	}
}
