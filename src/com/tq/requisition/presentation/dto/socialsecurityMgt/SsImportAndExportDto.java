package com.tq.requisition.presentation.dto.socialsecurityMgt;

import java.util.Date;
import java.util.UUID;

import com.excel.util.annotation.InputColAnnotation;
import com.tq.requisition.domain.model.socialsecurity.SocialsecurityInfo;


/**
 * �籣���뵼��model
 * @author jjh
 * @time 2016-01-16 15:16
 */
public class SsImportAndExportDto {
	
	/**����*/
	@InputColAnnotation(colCoord=0)
	private String name;
	
	/**���֤��*/
	@InputColAnnotation(colCoord=1,only = true,required=true,onlyErrorMsg="[���֤��]ֻ��Ψһ",requiredErrorMsg="[���֤��]����Ϊ��")
	private String idNumber;
	
	/**�Ա�*/
	@InputColAnnotation(colCoord=2)
	private String gender;
	
	/**��������*/
	@InputColAnnotation(colCoord=3)
	private String birthday;
	
	/**�����*/
	@InputColAnnotation(colCoord=4)
	private String ageRange;
	
	/**����ũҵ����ʱ��*/
	@InputColAnnotation(colCoord=5)
	private String farmingTime;
	
	/**���̻��Ͷ�����ʱ��(��)*/
	@InputColAnnotation(colCoord=6,converErrorMsg="���ʹ���[���̻��Ͷ�����ʱ��(��)]������")
	private int prisonTime;
	
	/**���ӷ���ʱ��(��)*/
	@InputColAnnotation(colCoord=7,converErrorMsg="���ʹ���[���ӷ���ʱ��(��)]������")
	private int serveArmyTime;
	
	/**���ϱ��ղ�������*/
	@InputColAnnotation(colCoord=8,converErrorMsg="���ʹ���[���ϱ��ղ�������]������")
	private int endowmentInsuranceYear;
	
	/**ҽ�Ʊ�����ͬ�ɷ�����*/
	@InputColAnnotation(colCoord=9,converErrorMsg="���ʹ���[ҽ�Ʊ�����ͬ�ɷ�����]������")
	private int medicalInsuranceMonth;
	
	/**�μӺ���ҽ�Ʊ���*/
	@InputColAnnotation(colCoord=10)
	private String joinWhichMedicalInsurance;
	
	/**�Ƿ�μӹ��籣*/
	@InputColAnnotation(colCoord=11)
	private String isSocialsecurity;
	
	/**��������*/
	@InputColAnnotation(colCoord=12)
	private String community;
	
	/**��ϵ�绰*/
	@InputColAnnotation(colCoord=13)
	private String tel;

	/**������׼*/
	@InputColAnnotation(colCoord=14,required=true,requiredErrorMsg="[������׼]����Ϊ��")
	private String type;
	
	/**��������*/
	@InputColAnnotation(colCoord=15)
	private String proName;
	
	/**������id*/
	private UUID userId;
	
	/**�����˵ı�ʶ*/
	private String createUid;
	/**����ʱ��*/
	private Date createDate;
	
	public void setUserId(UUID userId) {
		this.userId = userId;
	}

	public SocialsecurityInfo toSocialsecurityInfo() {
		SocialsecurityInfo info = new SocialsecurityInfo();
		info.setId(UUID.randomUUID());
		info.setDel(false);
		info.setCommunity(community);
		info.setEndowmentInsuranceYear(endowmentInsuranceYear);
		info.setJoinWhichMedicalInsurance(joinWhichMedicalInsurance);
		info.setMedicalInsuranceMonth(medicalInsuranceMonth);
		info.setOprDate(new Date());
		info.setOprUserId(userId);
		info.setTypeStr(type);
		info.setIdNumber(idNumber);
		info.setPrisonTime(prisonTime);
		info.setSocialsecurityDate(new Date());
		info.setServeArmyTime(serveArmyTime);
		info.setIsSocialsecurity(getSS(isSocialsecurity));
		info.setCreateDate(createDate);
		info.setCreateUid(createUid);
		return info;
	}
	
	private boolean getSS(String ss)
	{
		if(ss!=null && ss.trim().equals("��"))
		{
			return true;
		}
		return false;
	}
	
	public void setCreateUid(String createUid) {
		this.createUid = createUid;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
}
