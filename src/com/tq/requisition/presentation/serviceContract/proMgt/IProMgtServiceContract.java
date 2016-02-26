package com.tq.requisition.presentation.serviceContract.proMgt;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import com.tq.requisition.presentation.dto.project.AnnouncementDto;
import com.tq.requisition.presentation.dto.project.NewProDto;
import com.tq.requisition.presentation.dto.project.ProImportAndExportDto;
import com.tq.requisition.presentation.dto.project.ProItemDto;
import com.tq.requisition.presentation.dto.project.ProQueryModel;
import com.tq.requisition.presentation.dto.project.ProTypeDto;
import com.tq.requisition.presentation.dto.project.ProjectDto;
import com.tq.requisition.presentation.dto.share.PageModel;

/**
 * ��Ŀ������Լ�ӿڣ�������Ŀ��curd
 * @author jjh
 * @time 2015-12-27 16:16
 *
 */
public interface IProMgtServiceContract {
	/**
	 * �����Ŀ
	 * @param dto
	 * 		�����Ŀdto
	 * @return
	 */
	String addPro(NewProDto dto);	
	
	/**
	 * �@ȡ�Ŀ���
	 * @return
	 */
	List<ProTypeDto> getProType();
	
	/**
	 * ������Ŀid��ȡ����
	 * @param proId
	 * @return
	 */
	String getAnnounce(UUID proId);
	
	/**
	 * ģ����ѯ��Ŀ
	 * @param query
	 * 		ģ����ѯģ��
	 * @param page
	 * 		��ҳģ��
	 * @return
	 */
	String getProListFuzzy(ProQueryModel query,PageModel page);
	
	/**
	 * �༭��Ŀ
	 * @param dto
	 * 		���༭����Ŀdto
	 * @return
	 */
	String editPro(ProjectDto dto);
	
	/**
	 * ɾ����Ŀ
	 * @param proId
	 * 		��Ŀid
	 * @return
	 */
	String deletePro(UUID proId);
	
	/**
	 * ����ģ����Ŀ�����ַ�����ȡ��Ŀ���Ƽ���
	 * @param fuzzyName
	 * 		ģ����Ŀ����
	 * @return
	 */
	String getProNameListFuzzy(String fuzzyName);
	
	/**
	 * Ϊָ������Ŀ�����Ŀ�¶���Ϣ
	 * @param dto
	 * 		��Ŀ�¶�dto
	 * @param proId
	 * 		��Ŀid
	 * @return
	 */
	String addProItem(ProItemDto dto,UUID proId);
	
	/**
	 * ������Ŀid��ȡ����Ŀ�µ��¶Ƚ�����Ϣ
	 * @param proId
	 * 		��Ŀid
	 * @return
	 */
	String getProItemsByProId(UUID proId);
	
	/**
	 * ��������
	 * @param dto
	 * 		�������Ĺ���
	 * @return
	 * 		����������Ĺ���ʵ������
	 */
	String addAnnouncement(AnnouncementDto dto);

	/**
	 * ������Ŀid��ȡ��Ŀ��Ϣ
	 * @param id
	 * @return
	 */
	String getProById(UUID id);

	/**
	 * ������Ŀid��ȡ��Ŀ��Ϣ
	 * @param id
	 * @return
	 */
	ProjectDto getById4Entity(UUID id);
	
	/**
	 * ������Ŀ��Ϣ
	 * @param list
	 * 		��Ŀdto����
	 * @return String
	 * 		json��Ϣ
	 */
	String addByFile(List<ProImportAndExportDto> list);
	
	/**
	 * �����·ݵ�����Ŀ����
	 * @param date
	 * 		����
	 * @return List<ProImportAndExportDto>
	 * 		��Ŀ���뵼��model
	 * 
	 */
	List<ProImportAndExportDto> exportProByDate(Date date);
	
	/**
	 * �༭����
	 * @param dto
	 * 		����ʵ��dto
	 * @return String
	 * 		json
	 */
	String editAnnouncement(AnnouncementDto dto);
	
	/**
	 * �༭��Ŀ�¶���Ϣ
	 * @param dto
	 * 		��Ŀ�¶�ʵ��
	 * @return String
	 * 		json
	 */
	String editProItem(ProItemDto dto);
	
	/**
	 * Ϊ��Ŀ��ӡ�ṩ�ӿڣ�������Ŀid���ϻ�ȡ��Ŀ����
	 * @param uuids
	 * 		��Ŀid����
	 * @return String
	 * 		json
	 */
	String getPro4Print(String uuids);	
}
