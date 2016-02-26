package com.tq.requisition.presentation.dto.project;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

public class ProjectDto {
	/** �Ŀid */
	private UUID id;
	/* private fields */
	/** ��Ŀ���� */
	private String proName;
	/** ��Ŀ������ */
	private String approvalNumber;
	/** ������� */
	private float requisitionArea;
	/** Ӧ���� */
	private int shouldRemoveBuildings;
	/** Ӧ���� */
	private int shouldRemoveHouses;
	/** Ӧ��Ϸ������ */
	private float shouldRemoveLegalArea;
	/** Ӧ��Υ������� */
	private float shouldRemoveIllegalArea;
	/** Ӧ��Ǩ�˿� */
	private int shouldMovePopulation;
	/** ��ĿӦ�������� */
	private BigDecimal shouldPayMoney;
	/** ��Ŀ�ۼ��Ѹ������� */
	private BigDecimal totalPayMoney;
	/** ��Ŀ�������� */
	private Date startDate;
	/** �Ƿ������� */
	private boolean newStart;
	/** �������� */
	private String announceName;
	/** ��Ŀ��ַ */
	private String address;
	/** ��Ŀ���� */
	private Integer proType;
	/** �������� */
	private int s;
	/** ��Ŀ�ֵ�id */
	private String streetId;
	/** ��Ŀ����id */
	private String communityId;
	/** �ۼ����ڵ� */
	private float requisitionLandAreaTotal;
	/** �������ڵ� */
	private float requisitionLandAreaYear;
	/** �ۼ��Ѳ�Ϸ����� */
	private int removedBuildingsLegalTotal;
	/** �����Ѳ�Ϸ����� */
	private int removedBuildingsLegalYear;
	/** �ۼ��Ѳ�Ϸ����� */
	private int removedHousesLegalTotal;
	/** �����Ѳ�Ϸ����� */
	private int removedHousesLegalYear;
	/** �ۼ��Ѳ�Ϸ���� */
	private float removedAreaLegalTotal;
	/** �����Ѳ�Ϸ���� */
	private float removedAreaLegalYear;
	/** �ۼ��Ѳ�Ϸ���� */
	private float removedAreaIllegalTotal;
	/** �����Ѳ�Υ����� */
	private float removedAreaIllegalYear;
	/** �ۼ���Ǩ�˿� */
	private int removedPopulationTotal;
	/** ������Ǩ�˿� */
	private int removedPopulationYear;
	/**��Ŀ����id*/
	private String categoryId;
	/**��Ŀ����str*/
	private String categoryStr;
	/**�Ƿ������*/
	private String curMonthComplete;
	/**�Ƿ�6ǰ��Ŀ*/
	private String sixForward;
	/**��Ŀ��������*/
	private String proTypeStr;
	/**��Ŀitem����*/
	private List<ProItemDto> items;

	/* getters and setters */
	public UUID getId() {
		return id;
	}

	public void setId(UUID id) {
		this.id = id;
	}

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

	public BigDecimal getTotalPayMoney() {
		return totalPayMoney;
	}

	public void setTotalPayMoney(BigDecimal totalPayMoney) {
		this.totalPayMoney = totalPayMoney;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public boolean isNewStart() {
		return newStart;
	}

	public void setNewStart(boolean newStart) {
		this.newStart = newStart;
	}

	public String getAnnounceName() {
		return announceName;
	}

	public void setAnnounceName(String announceName) {
		this.announceName = announceName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getProType() {
		return proType;
	}
	
	public void setProType(Integer proType) {
		this.proType = proType;
	}

	public int getS() {
		return s;
	}

	public void setS(int s) {
		this.s = s;
	}

	public String getStreetId() {
		return streetId;
	}

	public void setStreetId(String streetId) {
		this.streetId = streetId;
	}

	public String getCommunityId() {
		return communityId;
	}

	public void setCommunityId(String communityId) {
		this.communityId = communityId;
	}

	public float getRequisitionLandAreaTotal() {
		return requisitionLandAreaTotal;
	}

	public void setRequisitionLandAreaTotal(float requisitionLandAreaTotal) {
		this.requisitionLandAreaTotal = requisitionLandAreaTotal;
	}

	public float getRequisitionLandAreaYear() {
		return requisitionLandAreaYear;
	}

	public void setRequisitionLandAreaYear(float requisitionLandAreaYear) {
		this.requisitionLandAreaYear = requisitionLandAreaYear;
	}

	public int getRemovedBuildingsLegalTotal() {
		return removedBuildingsLegalTotal;
	}

	public void setRemovedBuildingsLegalTotal(int removedBuildingsLegalTotal) {
		this.removedBuildingsLegalTotal = removedBuildingsLegalTotal;
	}

	public int getRemovedBuildingsLegalYear() {
		return removedBuildingsLegalYear;
	}

	public void setRemovedBuildingsLegalYear(int removedBuildingsLegalYear) {
		this.removedBuildingsLegalYear = removedBuildingsLegalYear;
	}

	public int getRemovedHousesLegalTotal() {
		return removedHousesLegalTotal;
	}

	public void setRemovedHousesLegalTotal(int removedHousesLegalTotal) {
		this.removedHousesLegalTotal = removedHousesLegalTotal;
	}

	public int getRemovedHousesLegalYear() {
		return removedHousesLegalYear;
	}

	public void setRemovedHousesLegalYear(int removedHousesLegalYear) {
		this.removedHousesLegalYear = removedHousesLegalYear;
	}

	public float getRemovedAreaLegalTotal() {
		return removedAreaLegalTotal;
	}

	public void setRemovedAreaLegalTotal(float removedAreaLegalTotal) {
		this.removedAreaLegalTotal = removedAreaLegalTotal;
	}

	public float getRemovedAreaLegalYear() {
		return removedAreaLegalYear;
	}

	public void setRemovedAreaLegalYear(float removedAreaLegalYear) {
		this.removedAreaLegalYear = removedAreaLegalYear;
	}

	public float getRemovedAreaIllegalTotal() {
		return removedAreaIllegalTotal;
	}

	public void setRemovedAreaIllegalTotal(float removedAreaIllegalTotal) {
		this.removedAreaIllegalTotal = removedAreaIllegalTotal;
	}

	public float getRemovedAreaIllegalYear() {
		return removedAreaIllegalYear;
	}

	public void setRemovedAreaIllegalYear(float removedAreaIllegalYear) {
		this.removedAreaIllegalYear = removedAreaIllegalYear;
	}

	public int getRemovedPopulationTotal() {
		return removedPopulationTotal;
	}

	public void setRemovedPopulationTotal(int removedPopulationTotal) {
		this.removedPopulationTotal = removedPopulationTotal;
	}

	public int getRemovedPopulationYear() {
		return removedPopulationYear;
	}

	public void setRemovedPopulationYear(int removedPopulationYear) {
		this.removedPopulationYear = removedPopulationYear;
	}

	public String getProTypeStr() {
		return proTypeStr;
	}

	public void setProTypeStr(String proTypeStr) {
		this.proTypeStr = proTypeStr;
	}
	
	public List<ProItemDto> getItems() {
		return items;
	}

	public void setItems(List<ProItemDto> items) {
		this.items = items;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryStr() {
		return categoryStr;
	}

	public void setCategoryStr(String categoryStr) {
		this.categoryStr = categoryStr;
	}

	public String getCurMonthComplete() {
		return curMonthComplete;
	}

	public void setCurMonthComplete(String curMonthComplete) {
		this.curMonthComplete = curMonthComplete;
	}

	public String getSixForward() {
		return sixForward;
	}

	public void setSixForward(String sixForward) {
		this.sixForward = sixForward;
	}

	/* constructors */
	public ProjectDto() {
		this.items = new ArrayList<ProItemDto>();
	}

	public ProjectDto(UUID id, String proName, String approvalNumber,
			float requisitionArea, int shouldRemoveBuildings,
			int shouldRemoveHouses, float shouldRemoveLegalArea,
			float shouldRemoveIllegalArea, int shouldMovePopulation,
			BigDecimal shouldPayMoney, BigDecimal totalPayMoney,
			Date startDate, boolean newStart, String announceName,
			String address, Integer proType, int s, String streetId,
			String communityId, float requisitionLandAreaTotal,
			float requisitionLandAreaYear, int removedBuildingsLegalTotal,
			int removedBuildingsLegalYear, int removedHousesLegalTotal,
			int removedHousesLegalYear, float removedAreaLegalTotal,
			float removedAreaLegalYear, float removedAreaIllegalTotal,
			float removedAreaIllegalYear, int removedPopulationTotal,
			int removedPopulationYear) {
		this();
		this.id = id;
		this.proName = proName;
		this.approvalNumber = approvalNumber;
		this.requisitionArea = requisitionArea;
		this.shouldRemoveBuildings = shouldRemoveBuildings;
		this.shouldRemoveHouses = shouldRemoveHouses;
		this.shouldRemoveLegalArea = shouldRemoveLegalArea;
		this.shouldRemoveIllegalArea = shouldRemoveIllegalArea;
		this.shouldMovePopulation = shouldMovePopulation;
		this.shouldPayMoney = shouldPayMoney;
		this.totalPayMoney = totalPayMoney;
		this.startDate = startDate;
		this.newStart = newStart;
		this.announceName = announceName;
		this.address = address;
		this.proType = proType;
		this.s = s;
		this.streetId = streetId;
		this.communityId = communityId;
		this.requisitionLandAreaTotal = requisitionLandAreaTotal;
		this.requisitionLandAreaYear = requisitionLandAreaYear;
		this.removedBuildingsLegalTotal = removedBuildingsLegalTotal;
		this.removedBuildingsLegalYear = removedBuildingsLegalYear;
		this.removedHousesLegalTotal = removedHousesLegalTotal;
		this.removedHousesLegalYear = removedHousesLegalYear;
		this.removedAreaLegalTotal = removedAreaLegalTotal;
		this.removedAreaLegalYear = removedAreaLegalYear;
		this.removedAreaIllegalTotal = removedAreaIllegalTotal;
		this.removedAreaIllegalYear = removedAreaIllegalYear;
		this.removedPopulationTotal = removedPopulationTotal;
		this.removedPopulationYear = removedPopulationYear;
	}

	/* public methods */
	public static ProjectDto obtain(UUID id, String proName,
			String approvalNumber, float requisitionArea,
			int shouldRemoveBuildings, int shouldRemoveHouses,
			float shouldRemoveLegalArea, float shouldRemoveIllegalArea,
			int shouldMovePopulation, BigDecimal shouldPayMoney,
			BigDecimal totalPayMoney, Date startDate, boolean newStart,
			String announceName, String address, Integer proType, int s,
			String streetId, String communityId, float requisitionLandAreaTotal,
			float requisitionLandAreaYear, int removedBuildingsLegalTotal,
			int removedBuildingsLegalYear, int removedHousesLegalTotal,
			int removedHousesLegalYear, float removedAreaLegalTotal,
			float removedAreaLegalYear, float removedAreaIllegalTotal,
			float removedAreaIllegalYear, int removedPopulationTotal,
			int removedPopulationYear) {
		return new ProjectDto(id, proName, approvalNumber, requisitionArea,
				shouldRemoveBuildings, shouldRemoveHouses,
				shouldRemoveLegalArea, shouldRemoveIllegalArea,
				shouldMovePopulation, shouldPayMoney, totalPayMoney, startDate,
				newStart, announceName, address, proType, s, streetId,
				communityId, requisitionLandAreaTotal, requisitionLandAreaYear,
				removedBuildingsLegalTotal, removedBuildingsLegalYear,
				removedHousesLegalTotal, removedHousesLegalYear,
				removedAreaLegalTotal, removedAreaLegalYear,
				removedAreaIllegalTotal, removedAreaIllegalYear,
				removedPopulationTotal, removedPopulationYear);
	}

}
