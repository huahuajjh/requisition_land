package com.tq.requisition.presentation.dto.rmHousehold;

import java.util.ArrayList;
import java.util.List;

import com.excel.util.annotation.InputColAnnotation;
import com.tq.requisition.domain.model.familyMember.FamilyItem;
import com.tq.requisition.domain.model.removeFamily.Family;
import com.tq.requisition.domain.model.share.Gender;

/**
 * ��Ǩ������ģ��
 * @author jjh
 * @time 2016-01-16 13:11
 *
 */
public class FmlImportAndExport {
	/**��Ŀ����*/
	@InputColAnnotation(colCoord=1,required=true,rowCoord=1,requiredErrorMsg="[��Ŀ����]�Ǳ�����")
	private String proName;
	/**��������*/
	@InputColAnnotation(colCoord=5,required=true,rowCoord=1,requiredErrorMsg="[��������]�Ǳ�����")
	private String headName;
	/**���ع��淢������*/
	@InputColAnnotation(colCoord=7,rowCoord=1)
	private String announceDate;
	/**�磬��(���´�)*/
	@InputColAnnotation(colCoord=11,rowCoord=1)
	private String town;
	/**��*/
	@InputColAnnotation(colCoord=13,rowCoord=1)
	private String contry;
	/**��*/
	@InputColAnnotation(colCoord=15,rowCoord=1)
	private String group;
	/**��Ǩ��Ա����*/
	private List<FmlItemImportAndExport> items;

	public Family toFamily(List<FmlItemImportAndExport> list) {
		items = list;
		Family fml = new Family();
		fml.setAddress(town+"-"+contry+"-"+group);
		fml.setFmlNumber(list.size());
		fml.setHeadName(headName);
		fml.setProName(proName);
		fml.setItems(getFmlItems(list));
		return fml;
	}
	
	private List<FamilyItem> getFmlItems(List<FmlItemImportAndExport> list){
		List<FamilyItem> items = new ArrayList<FamilyItem>();
		for (FmlItemImportAndExport dto : list) {
			FamilyItem item = new FamilyItem();
			item.setAddress(town+"-"+contry+"-"+group);
			item.setBirthday(dto.getBirthday());
			item.setCurrentEducationSituation(dto.getCurrentEducationSituation());
			item.setEducationLevel(dto.getEducationLevel());
			item.setFarmingTime(dto.getFarmingTime());
			item.setGender(Gender.FEMALE.obtainByStr(dto.getGender()));
			item.setHalf(getHalf(dto.isHalf()));
			item.setHouseholdStr(dto.getHouseholdStr());
			item.setIdNumber(dto.getIdNumber());
			item.setName(dto.getName());
			item.setOnlyChildNumber(dto.getOnlyChildNumber());
			item.setProName(proName);
			item.setRelationshipStr(dto.getRelationshipStr());
			item.setServeArmySituation(dto.getServeArmySituation());
			item.setTel(dto.getTel());
			item.setIsSocialsecurity(dto.isSocialsecurity());
			items.add(item);
		}
		return items;
	}
	
	boolean getHalf(String half)
	{
		if(half != null && half.trim().equals("��"))
		{
			return true;
		}
		return false;
	}
}
