package com.tq.requisition.presentation.dto.statistics;

public class StatisticsExportDto {
	/**��Ŀ����*/
	private String proName;
	
	//�ϼ�
	/**����*/
	private int totalFmlCount;
	/**����*/
	private int totalFmlItems;
	/**���*/
	private float totalAmount;
	
	//����ƾ֤
	/**����*/
	private int rcdFmlCount;
	/**����*/
	private int rcdFmlItems;
	/**���*/
	private float rcdAmount;
	
	//δ��ƾ֤	
	/**����*/
	private int nrcdFmlCount;
	/**����*/
	private int nrcdFmlItems;
	/**���*/
	private float nrcdAmount;
	
	/**�����ֳ��ʵ�λ����*/
	private String moneyUnit;
	/**�������ʵ�λ����*/
	private String otherMoneyUnit;
	
	//�����ֳ���
	private float landBureauAmount;
	//�ǹ����ֳ���
	private float nLandBureauAmount;
	
	//�����ֳ�����Ϣ
	private String landBureauAmountMsg;
	private String nLandBureauAmountMsg;
	
	//������Ů��
	private int onlyChildCount;
	//��߻�����
	private int halfCount;
	//���˲�����׼
	private float personalSubsidyStd;
	//�ǹ����ֳ��ʼ����׼
	private int nonLrbStd;
	//�˿�����
	private int totalPopu;
	
	public String getProName() {
		return proName;
	}
	public int getTotalFmlCount() {
		return totalFmlCount;
	}
	public int getTotalFmlItems() {
		return totalFmlItems;
	}
	public float getTotalAmount() {
		return totalAmount;
	}
	public int getRcdFmlCount() {
		return rcdFmlCount;
	}
	public int getRcdFmlItems() {
		return rcdFmlItems;
	}
	public float getRcdAmount() {
		return rcdAmount;
	}
	public int getNrcdFmlCount() {
		return nrcdFmlCount;
	}
	public int getNrcdFmlItems() {
		return nrcdFmlItems;
	}
	public float getNrcdAmount() {
		return nrcdAmount;
	}
	public float getLandBureauAmount() {
		return landBureauAmount;
	}
	public float getnLandBureauAmount() {
		return nLandBureauAmount;
	}
	public int getOnlyChildCount() {
		return onlyChildCount;
	}
	public int getHalfCount() {
		return halfCount;
	}
	public float getPersonalSubsidyStd() {
		return personalSubsidyStd;
	}
	public int getNonLrbStd() {
		return nonLrbStd;
	}
	public int getTotalPopu() {
		return totalPopu;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public void setTotalFmlCount(int totalFmlCount) {
		this.totalFmlCount = totalFmlCount;
	}
	public void setTotalFmlItems(int totalFmlItems) {
		this.totalFmlItems = totalFmlItems;
	}
	public void setTotalAmount(float totalAmount) {
		this.totalAmount = totalAmount;
	}
	public void setRcdFmlCount(int rcdFmlCount) {
		this.rcdFmlCount = rcdFmlCount;
	}
	public void setRcdFmlItems(int rcdFmlItems) {
		this.rcdFmlItems = rcdFmlItems;
	}
	public void setRcdAmount(float rcdAmount) {
		this.rcdAmount = rcdAmount;
	}
	public void setNrcdFmlCount(int nrcdFmlCount) {
		this.nrcdFmlCount = nrcdFmlCount;
	}
	public void setNrcdFmlItems(int nrcdFmlItems) {
		this.nrcdFmlItems = nrcdFmlItems;
	}
	public void setNrcdAmount(float nrcdAmount) {
		this.nrcdAmount = nrcdAmount;
	}
	public void setLandBureauAmount(float landBureauAmount) {
		this.landBureauAmount = landBureauAmount;
	}
	public void setnLandBureauAmount(float nLandBureauAmount) {
		this.nLandBureauAmount = nLandBureauAmount;
	}
	public void setOnlyChildCount(int onlyChildCount) {
		this.onlyChildCount = onlyChildCount;
	}
	public void setHalfCount(int halfCount) {
		this.halfCount = halfCount;
	}
	public void setPersonalSubsidyStd(float personalSubsidyStd) {
		this.personalSubsidyStd = personalSubsidyStd;
	}
	public void setNonLrbStd(int nonLrbStd) {
		this.nonLrbStd = nonLrbStd;
	}
	public void setTotalPopu(int totalPopu) {
		this.totalPopu = totalPopu;
	}
	public String getLandBureauAmountMsg() {
		return landBureauAmountMsg;
	}
	public String getnLandBureauAmountMsg() {
		return nLandBureauAmountMsg;
	}
	public void setLandBureauAmountMsg(String landBureauAmountMsg) {
		this.landBureauAmountMsg = landBureauAmountMsg;
	}
	public void setnLandBureauAmountMsg(String nLandBureauAmountMsg) {
		this.nLandBureauAmountMsg = nLandBureauAmountMsg;
	}
	public String getMoneyUnit() {
		return moneyUnit;
	}
	public String getOtherMoneyUnit() {
		return otherMoneyUnit;
	}
	public void setMoneyUnit(String moneyUnit) {
		this.moneyUnit = moneyUnit;
	}
	public void setOtherMoneyUnit(String otherMoneyUnit) {
		this.otherMoneyUnit = otherMoneyUnit;
	}
}
