package com.tq.requisition.presentation.dto.project;

import java.math.BigDecimal;

/**
 * �����Ŀdto
 * @author jjh
 * @time 2015-12-18 11:01
 */
public class NewProDto {
	/**��Ŀ����*/
	private String proName;
	/**��Ŀ������*/
	private String approvalNumber;
	/**�������*/
	private float requisitionArea;
	/**Ӧ����*/
	private int shouldRemoveBuildings;
	/**Ӧ����*/
	private int shouldRemoveHouses;
	/**Ӧ��Ϸ������*/
	private float shouldRemoveLegalArea;
	/**Ӧ��Υ�������*/
	private float shouldRemoveIllegalArea;
	/**Ӧ��Ǩ�˿�*/
	private int shouldMovePopulation;
	/**��ĿӦ��������*/
	private BigDecimal shouldPayMoney;
	/**�Ŀ���id*/
	private int proType;
	/**�Ŀ��ַ�ַ���*/
	private String address;
	/**��Ŀ�ֵ���ַid���*/
	private String street;
	/**��Ŀ������ַid���*/
	private String community;
	/**��Ŀ����*/
	private String proCategory;
	/**�Ƿ�������ǰ��Ŀ*/
	private String sixForwardPro;

	/*constrcutors*/
	public NewProDto(){}
	public NewProDto(String proName, String approvalNumber,
			float requisitionArea, int shouldRemoveBuildings,
			int shouldRemoveHouses, float shouldRemoveLegalArea,
			float shouldRemoveIllegalArea, int shouldMovePopulation,
			BigDecimal shouldPayMoney, int proTypeId, String address,String street,String community) {
		super();
		this.proName = proName;
		this.approvalNumber = approvalNumber;
		this.requisitionArea = requisitionArea;
		this.shouldRemoveBuildings = shouldRemoveBuildings;
		this.shouldRemoveHouses = shouldRemoveHouses;
		this.shouldRemoveLegalArea = shouldRemoveLegalArea;
		this.shouldRemoveIllegalArea = shouldRemoveIllegalArea;
		this.shouldMovePopulation = shouldMovePopulation;
		this.shouldPayMoney = shouldPayMoney;
		this.proType = proTypeId;
		this.address = address;
		this.street = street;
		this.community = community;
	}
	
	/*getters and setters*/
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getApprovalNumber() {
		return approvalNumber;
	}
	public void setApprovalNumber(String approvalNumber) {
		this.approvalNumber = approvalNumber;
	}
	public float getRequisitionArea() {
		return requisitionArea;
	}
	public void setRequisitionArea(float requisitionArea) {
		this.requisitionArea = requisitionArea;
	}
	public int getShouldRemoveBuildings() {
		return shouldRemoveBuildings;
	}
	public void setShouldRemoveBuildings(int shouldRemoveBuildings) {
		this.shouldRemoveBuildings = shouldRemoveBuildings;
	}
	public int getShouldRemoveHouses() {
		return shouldRemoveHouses;
	}
	public void setShouldRemoveHouses(int shouldRemoveHouses) {
		this.shouldRemoveHouses = shouldRemoveHouses;
	}
	public float getShouldRemoveLegalArea() {
		return shouldRemoveLegalArea;
	}
	public void setShouldRemoveLegalArea(float shouldRemoveLegalArea) {
		this.shouldRemoveLegalArea = shouldRemoveLegalArea;
	}
	public float getShouldRemoveIllegalArea() {
		return shouldRemoveIllegalArea;
	}
	public void setShouldRemoveIllegalArea(float shouldRemoveIllegalArea) {
		this.shouldRemoveIllegalArea = shouldRemoveIllegalArea;
	}
	public int getShouldMovePopulation() {
		return shouldMovePopulation;
	}
	public void setShouldMovePopulation(int shouldMovePopulation) {
		this.shouldMovePopulation = shouldMovePopulation;
	}
	public BigDecimal getShouldPayMoney() {
		return shouldPayMoney;
	}
	public void setShouldPayMoney(BigDecimal shouldPayMoney) {
		this.shouldPayMoney = shouldPayMoney;
	}
	public int getProType() {
		return proType;
	}
	public void setProType(int proType) {
		this.proType = proType;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getCommunity() {
		return community;
	}
	public void setCommunity(String community) {
		this.community = community;
	}
	public String getProCategory() {
		return proCategory;
	}
	public void setProCategory(String proCategory) {
		this.proCategory = proCategory;
	}
	public String getSixForwardPro() {
		return sixForwardPro;
	}
	public void setSixForwardPro(String sixForwardPro) {
		this.sixForwardPro = sixForwardPro;
	}
	
	/*public methods*/
	public static NewProDto obtain(String proName, String approvalNumber,
			float requisitionArea, int shouldRemoveBuildings,
			int shouldRemoveHouses, float shouldRemoveLegalArea,
			float shouldRemoveIllegalArea, int shouldMovePopulation,
			BigDecimal shouldPayMoney, int proTypeId, String address,String street,String community) {
		
		return new NewProDto(proName, approvalNumber, requisitionArea, //
				shouldRemoveBuildings, shouldRemoveHouses, shouldRemoveLegalArea, //
				shouldRemoveIllegalArea, shouldMovePopulation, shouldPayMoney, proTypeId, address,street,community);
	}

	
}
