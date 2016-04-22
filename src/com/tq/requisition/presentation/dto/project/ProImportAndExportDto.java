package com.tq.requisition.presentation.dto.project;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import com.excel.util.annotation.InputColAnnotation;
import com.excel.util.annotation.OutputColAnnotation;
import com.tq.requisition.domain.model.project.Announcement;
import com.tq.requisition.domain.model.project.Project;
import com.tq.requisition.domain.model.project.ProjectItem;
import com.tq.requisition.domain.model.project.ProjectType;

/**
 * ���뵼����Ŀdto
 * 
 * @author jjh
 * @time 2016-01-15 19::49
 * 
 */
public class ProImportAndExportDto {
	/**���*/
	@OutputColAnnotation(colCoord = 0,formula="(row() - 6)")
	private String num;
	/** ��Ŀ���� */
	@InputColAnnotation(colCoord = 1, isAbandonRowspanData = true)
	@OutputColAnnotation(colCoord = 1)
	private String proName;
	/** ��Ŀ������ */
	@InputColAnnotation(colCoord = 2,isAbandonRowspanData = true)
	@OutputColAnnotation(colCoord = 2)
	private String approvalNumber;
	/** ��Ŀ���� */
	@InputColAnnotation(colCoord = 3)
	@OutputColAnnotation(colCoord = 3)
	private String proCategory;
	/** ��Ŀ��������-������ʩ */
	@InputColAnnotation(colCoord = 4)
	@OutputColAnnotation(colCoord = 4)
	private String proTypeStrInfra;
	/** ��Ŀ��������-���� */
	@InputColAnnotation(colCoord = 5)
	@OutputColAnnotation(colCoord = 5)
	private String proTypeStrOther;
	/** ������������Ŀ */
	@InputColAnnotation(colCoord = 6)
	@OutputColAnnotation(colCoord = 6)
	private String newStart;
	/** �Ƿ�Ϊ������ɽ�����Ŀ */
	@InputColAnnotation(colCoord = 7)
	@OutputColAnnotation(colCoord = 7)
	private String curMonthComplete;
	/** ��Ŀȫ��ַ */
	@InputColAnnotation(colCoord = 8)
	@OutputColAnnotation(colCoord = 8)
	private String totalAddress;
	
	/** ����1 */
	@OutputColAnnotation(colCoord = 9)
	private Date announce1;
	private String announce1Number;
	/** ����2 */
	@OutputColAnnotation(colCoord = 10)
	private Date announce2;
	private String announce2Number;
	/** ����3 */
	@OutputColAnnotation(colCoord = 11)
	private Date announce3;
	private String announce3Number;

	/** ������� */
	@InputColAnnotation(colCoord = 9, required = true, converErrorMsg = "���ʹ���[�������]��С������", requiredErrorMsg = "[�������]����Ϊ��")
	@OutputColAnnotation(colCoord = 12)
	private float requisitionArea;
	/** �ۼ����ڵ� */
	@InputColAnnotation(colCoord = 10, converErrorMsg = "���ʹ���[�ۼ����ڵ�]��С������")
	@OutputColAnnotation(colCoord = 13)
	private float requisitionLandAreaTotal;
	/** �������ڵ� */
	@InputColAnnotation(colCoord = 11, converErrorMsg = "���ʹ���[�������ڵ�]��С������")
	@OutputColAnnotation(colCoord = 14)
	private float removedLandArea;
	/** �������ڵ� */
	@InputColAnnotation(colCoord = 12, converErrorMsg = "���ʹ���[�������ڵ�]��С������")
	@OutputColAnnotation(colCoord = 15)
	private float requisitionLandAreaYear;
	
	/** Ӧ���� */
	@InputColAnnotation(colCoord = 13, required = true, converErrorMsg = "���ʹ���[Ӧ����]����������", requiredErrorMsg = "[Ӧ����]����Ϊ��")
	@OutputColAnnotation(colCoord = 16)
	private int shouldRemoveBuildings;
	/** �ۼ��Ѳ�Ϸ����� */
	@InputColAnnotation(colCoord = 14, converErrorMsg = "���ʹ���[�ۼ��Ѳ�Ϸ�����]����������")
	@OutputColAnnotation(colCoord = 17)
	private int removedBuildingsLegalTotal;
	/** �����Ѳ��� */
	@InputColAnnotation(colCoord = 15, converErrorMsg = "���ʹ���[�����Ѳ���]����������")
	@OutputColAnnotation(colCoord = 18)
	private int removedBuildings;
	/** �����Ѳ�Ϸ����� */
	@InputColAnnotation(colCoord = 16, converErrorMsg = "���ʹ���[�����Ѳ�Ϸ�����]����������")
	@OutputColAnnotation(colCoord = 19)
	private int removedBuildingsLegalYear;
	
	/** Ӧ��Ϸ������ */
	@InputColAnnotation(colCoord = 17, required = true, converErrorMsg = "���ʹ���[Ӧ��Ϸ������]��С������", requiredErrorMsg = "[Ӧ��Ϸ������]����Ϊ��")
	@OutputColAnnotation(colCoord = 20)
	private float shouldRemoveLegalArea;
	/** �ۼ��Ѳ�Ϸ���� */
	@InputColAnnotation(colCoord = 18, converErrorMsg = "���ʹ���[�ۼ��Ѳ�Ϸ����]��С������")
	@OutputColAnnotation(colCoord = 21)
	private float removedAreaLegalTotal;
	/** �����Ѳ�Ϸ���� */
	@InputColAnnotation(colCoord = 19, converErrorMsg = "���ʹ���[�����Ѳ�Ϸ����]��С������")
	@OutputColAnnotation(colCoord = 22)
	private float removedLegalArea;
	/** �����Ѳ�Ϸ���� */
	@InputColAnnotation(colCoord = 20, converErrorMsg = "���ʹ���[�����Ѳ�Ϸ����]��С������")
	@OutputColAnnotation(colCoord = 23)
	private float removedAreaLegalYear;
	
	/** Ӧ��Ǩ�˿� */
	@InputColAnnotation(colCoord = 21, required = true, converErrorMsg = "���ʹ���[Ӧ��Ǩ�˿�]����������", requiredErrorMsg = "[Ӧ��Ǩ�˿�]����Ϊ��")
	@OutputColAnnotation(colCoord = 24)
	private int shouldMovePopulation;
	/** �ۼ���Ǩ�˿� */
	@InputColAnnotation(colCoord = 22, converErrorMsg = "���ʹ���[�ۼ���Ǩ�˿�]����������")
	@OutputColAnnotation(colCoord = 25)
	private int removedPopulationTotal;
	/** �����Ѷ�Ǩ�˿� */
	@InputColAnnotation(colCoord = 23, converErrorMsg = "���ʹ���[�����Ѷ�Ǩ�˿�]��������")
	@OutputColAnnotation(colCoord = 26)
	private int movedPopulation;
	/** ������Ǩ�˿� */
	@InputColAnnotation(colCoord = 24, converErrorMsg = "���ʹ���[������Ǩ�˿�]����������")
	@OutputColAnnotation(colCoord = 27)
	private int removedPopulationYear;
	
	/** �����´������ڵؾ����� */
	@InputColAnnotation(colCoord = 25, converErrorMsg = "���ʹ���[�����´������ڵؾ�����]��������")
	@OutputColAnnotation(colCoord = 28)
	private int yearDeadlineFile;
	/** �������뷨Ժִ�� */
	@InputColAnnotation(colCoord = 26, converErrorMsg = "���ʹ���[�������뷨Ժִ��]��������")
	@OutputColAnnotation(colCoord = 29)
	private int yearCourtExecute;
	/** ��������ʵʩǿ���ڵػ��� */
	@InputColAnnotation(colCoord = 27, converErrorMsg = "���ʹ���[��������ʵʩǿ���ڵػ���]��������")
	@OutputColAnnotation(colCoord = 30)
	private int yearLegalRemoved;
	/** �Ƿ���ǰ��Ŀ�� */
	@InputColAnnotation(colCoord = 28)
	@OutputColAnnotation(colCoord = 31)
	private String sixForheadPro;
	/** ��ע */
	@InputColAnnotation(colCoord = 29)
	@OutputColAnnotation(colCoord = 32)
	private String remark;
	
	
	/** Ӧ���� */
	private int shouldRemoveHouses;
	/** �ۼ��Ѳ�Ϸ����� */
	private int removedHousesLegalTotal;
	/** �����Ѳ�Ϸ����� */
	private int removedHousesLegalYear;
	/** Ӧ��Υ������� */
	private float shouldRemoveIllegalArea;
	/** ��ĿӦ�������� */
	private BigDecimal shouldPayMoney;
	/** ��Ŀ�ۼ��Ѹ������� */
	private BigDecimal totalPayMoney = new BigDecimal(0);
	/** ��Ŀ�������� */
	private Date startDate;
	/** �ۼ��Ѳ�Υ����� */
	private float removedAreaIllegalTotal;
	/** �����Ѳ�Υ����� */
	private float removedAreaIllegalYear;
	/** ������Ǩ���� */
	private int rmovedHouses;
	/** �����Ѳ�Υ����� */
	private float removedIllegalArea;
	/** �����Ѹ��⳥�� */
	private BigDecimal paidMoney = new BigDecimal(0);
	/**��Ŀ����id*/
	private String categoryId;
	
	/**��Ŀ����str*/
	@InputColAnnotation(colCoord = 5)
	@OutputColAnnotation(colCoord = 5)
	private String categoryStr;
	
	/** �¶��ʱ�� */
	private Date date;
	
	/**�����˵ı�ʶ*/
	private String createUid;
	/**����ʱ��*/
	private Date createDate;

	/* public methods */
	public Project toProject() {
		// ��Ŀa
		Project model = new Project();
		model.setProName(proName);
		model.setApprovalNumber(approvalNumber);
		model.setRequisitionArea(requisitionArea);
		model.setShouldRemoveBuildings(shouldRemoveBuildings);
		model.setShouldRemoveHouses(shouldRemoveHouses);
		model.setShouldRemoveLegalArea(shouldRemoveLegalArea);
		model.setShouldRemoveIllegalArea(shouldRemoveIllegalArea);
		model.setShouldMovePopulation(shouldMovePopulation);
		model.setShouldPayMoney(shouldPayMoney);
		model.setTotalPayMoney(totalPayMoney);
		if(curMonthComplete != null && (curMonthComplete.trim().equals("��") || curMonthComplete.trim().equals("��"))){
			model.setStartDate(date);
		}
		model.setProType(getProType());
		// model.setProTypeStr(proTypeStr);
		model.setTotalAddress(totalAddress);
		model.setSequence(0);
		// model.setSequenceStr(dto.getAnnounceName());
		//List<Announcement> anns = getAnnouncements();
		//model.setAnnouncements(anns);
		//model.setSequence(anns.size());
		model.setRequisitionLandAreaTotal(requisitionLandAreaTotal);
		model.setRequisitionLandAreaYear(requisitionLandAreaYear);
		model.setRemovedBuildingsLegalTotal(removedBuildingsLegalTotal);
		model.setRemovedBuildingsLegalYear(removedBuildingsLegalYear);
		model.setRemovedHousesLegalTotal(removedHousesLegalTotal);
		model.setRemovedHousesLegalYear(removedHousesLegalYear);
		model.setRemovedAreaLegalTotal(removedAreaLegalTotal);
		model.setRemovedAreaLegalYear(removedAreaLegalYear);
		model.setRemovedAreaIllegalTotal(removedAreaIllegalTotal);
		model.setRemovedAreaIllegalYear(removedAreaIllegalYear);
		model.setRemovedPopulationTotal(removedPopulationTotal);
		model.setRemovedPopulationYear(removedPopulationYear);
		
		model.setCurMonthComplete(curMonthComplete);
		model.setCategoryStr(proCategory);
		if(sixForheadPro != null && (sixForheadPro.trim().equals("��") || sixForheadPro.trim().equals("��"))){
			model.setSixForward("��");
		} else {
			model.setSixForward(sixForheadPro);
		}
		
		model.setCreateDate(createDate);
		model.setCreateUid(createUid);

		// ��Ŀ�¶�		
		ProjectItem item = new ProjectItem();
		item.setId(UUID.randomUUID());
		item.setDate(date);
		item.setRemovedLandArea(removedLandArea);
		item.setRemovedBuildings(removedBuildings);
		item.setRmovedHouses(rmovedHouses);
		item.setRemovedLegalArea(removedLegalArea);
		item.setRemovedIllegalArea(removedIllegalArea);
		item.setMovedPopulation(movedPopulation);
		item.setYearDeadlineFile(yearDeadlineFile);
		item.setYearCourtExecute(yearCourtExecute);
		item.setYearLegalRemoved(yearLegalRemoved);
		item.setRemark(remark);
		item.setNewStart(false);
		item.setProId(model.getId());
		item.setStartDate(startDate);
		if(curMonthComplete != null && (curMonthComplete.trim().equals("��") || curMonthComplete.trim().equals("��"))){
			item.setCurMonthComplete("��");
		} else {
			item.setCurMonthComplete(curMonthComplete);
		}
		
		model.getItems().add(item);
		return model;
	}

	/**
	 * ��ȡ��Ŀ����intֵ
	 * 
	 * @return int ����һ��intֵ����ֵ����һ����Ŀ���͵�intֵ
	 */
	private int getProType() {
		if (proTypeStrInfra != null && !(proTypeStrInfra.trim().equals(""))) {
			return ProjectType.INFRASTRUCTURE.toValue();
		}
		return ProjectType.OTHER.toValue();
	}

	/**
	 * ��ȡ��������
	 * 
	 * @return int ����һ��intֵ����ֵ������ǰ��Ŀ���ڵڼ�����
	 */
//	private int getSequence() {
//		if (announce1 != null) {
//			return 1;
//		}
//		if (announce2 != null) {
//			return 2;
//		}
//		return 3;
//	}

//	private List<Announcement> getAnnouncements() {
//		List<Announcement> announcements = new ArrayList<>();
//		if (announce1 != null) {
//			Announcement announcement = new Announcement();
//			announcement.setDate(announce1);
//			announcement.setSequence(1);
//			announcements.add(announcement);
//		}
//		if (announce2 != null) {
//			Announcement announcement = new Announcement();
//			announcement.setDate(announce2);
//			announcement.setSequence(2);
//			announcements.add(announcement);
//		}
//
//		if(announce3!=null)
//		{
//			Announcement announcement = new Announcement();
//			announcement.setDate(announce3);
//			announcement.setSequence(3);
//			announcements.add(announcement);
//		}
//		return announcements;
//	}

	/**
	 * ������Ŀ����ת���ɱ���model
	 * 
	 * @param pros
	 *            ��Ŀ����
	 * @return List<ProImportAndExportDto> ��Ŀ���뵼��model
	 */
	public static List<ProImportAndExportDto> obtainByProList(List<Project> pros) {
		List<ProImportAndExportDto> list = new ArrayList<ProImportAndExportDto>();
		for (Project project : pros) {
			ProImportAndExportDto dto = new ProImportAndExportDto();
			dto.proName = project.getProName();
			dto.approvalNumber = project.getApprovalNumber();
			dto.requisitionArea = project.getRequisitionArea();
			dto.shouldRemoveBuildings = project.getShouldRemoveBuildings();
			dto.shouldRemoveHouses = project.getShouldRemoveHouses();
			dto.shouldRemoveLegalArea = project.getShouldRemoveLegalArea();
			dto.shouldRemoveIllegalArea = project.getShouldRemoveIllegalArea();
			dto.shouldMovePopulation = project.getShouldMovePopulation();
			dto.shouldPayMoney = project.getShouldPayMoney();
			dto.totalPayMoney = project.getTotalPayMoney();
			dto.startDate = project.getStartDate();
			dto.categoryId = project.getCategoryId();
			dto.categoryStr = project.getCategoryStr();
			setProType(dto, project.getProTypeStr());
			dto.totalAddress = project.getTotalAddress();
			setAnnounce(dto, project);
			dto.requisitionLandAreaTotal = project.getRequisitionLandAreaTotal();
			dto.requisitionLandAreaYear = project.getRequisitionLandAreaYear();
			dto.removedBuildingsLegalTotal = project.getRemovedBuildingsLegalTotal();
			dto.removedBuildingsLegalYear = project.getRemovedBuildingsLegalYear();
			dto.removedHousesLegalTotal = project.getRemovedHousesLegalTotal();
			dto.removedHousesLegalYear = project.getRemovedHousesLegalYear();
			dto.removedAreaLegalTotal = project.getRemovedAreaLegalTotal();
			dto.removedAreaLegalYear = project.getRemovedAreaLegalYear();
			dto.removedAreaIllegalTotal = project.getRemovedAreaIllegalTotal();
			dto.removedAreaIllegalYear = project.getRemovedAreaIllegalYear();
			dto.removedPopulationTotal = project.getRemovedPopulationTotal();
			dto.removedPopulationYear = project.getRemovedPopulationYear();
			dto.sixForheadPro = project.getSixForward();
			List<ProjectItem> items = project.getItems();
			if (null != items && items.size() != 0) {
				dto.date = items.get(0).getDate();
				dto.removedLandArea = items.get(0).getRemovedLandArea();
				dto.removedBuildings = items.get(0).getRemovedBuildings();
				dto.rmovedHouses = items.get(0).getRmovedHouses();
				dto.removedLegalArea = items.get(0).getRemovedLegalArea();
				dto.removedIllegalArea = items.get(0).getRemovedIllegalArea();
				dto.movedPopulation = items.get(0).getMovedPopulation();
				dto.paidMoney = items.get(0).getPaidMoney();
				dto.yearDeadlineFile = items.get(0).getYearDeadlineFile();
				dto.yearCourtExecute = items.get(0).getYearCourtExecute();
				dto.yearLegalRemoved = items.get(0).getYearLegalRemoved();
				dto.remark = items.get(0).getRemark();
				dto.curMonthComplete = items.get(0).getCurMonthComplete();
			}
			list.add(dto);
		}
		return list;
	}

	private static void setProType(ProImportAndExportDto dto, String typeName) {
		if (typeName.equals("������ʩ")) {
			dto.proTypeStrInfra = "��";
			return;
		}
		dto.proTypeStrOther = "��";
	}

	private static void setAnnounce(ProImportAndExportDto dto, Project pro) {
		for (Announcement announcement : pro.getAnnouncements()) {
			switch (announcement.getSequence()) {
			case 1:
				dto.announce1 = announcement.getDate();
				dto.announce1Number = announcement.getNumber();
				break;

			case 2:
				dto.announce2 = announcement.getDate();
				dto.announce2Number = announcement.getNumber();
				break;

			default:
				dto.announce3 = announcement.getDate();
				dto.announce3Number = announcement.getNumber();
				break;
			}
		}
	}

	public void setDate(Date date) {
		this.date = date;
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

	public String getProTypeStrInfra() {
		return proTypeStrInfra;
	}

	public void setProTypeStrInfra(String proTypeStrInfra) {
		this.proTypeStrInfra = proTypeStrInfra;
	}

	public String getProTypeStrOther() {
		return proTypeStrOther;
	}

	public void setProTypeStrOther(String proTypeStrOther) {
		this.proTypeStrOther = proTypeStrOther;
	}

	public String getNewStart() {
		return newStart;
	}

	public void setNewStart(String newStart) {
		this.newStart = newStart;
	}

	public String getCurMonthComplete() {
		return curMonthComplete;
	}

	public void setCurMonthComplete(String curMonthComplete) {
		this.curMonthComplete = curMonthComplete;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public void setCreateUid(String createUid) {
		this.createUid = createUid;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
}
