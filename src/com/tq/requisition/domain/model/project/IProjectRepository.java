package com.tq.requisition.domain.model.project;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import com.tq.requisition.domain.IRepository.IRepository;
import com.tq.requisition.exception.DomainException;
import com.tq.requisition.infrastructure.utils.PageFormater;
import com.tq.requisition.presentation.dto.project.ProNameDto;
import com.tq.requisition.presentation.dto.project.ProQueryModel;
import com.tq.requisition.presentation.dto.share.PageModel;

/**
 * ��Ŀ�ִ��ӿ�
 * 
 * @author jjh
 * @time 2015-12-27 20:47
 */
public interface IProjectRepository extends IRepository<Project> {
	/**
	 * ������Ŀ
	 * @param model
	 * 		��Ŀmodel
	 */
	void addPro(Project model) throws DomainException;
	
	/**
	 * ������Ŀid��ȡ���漯��
	 * @param proId
	 * 		��Ŀid
	 * @return List<Announcement>
	 * 		���漯��
	 */
	List<Announcement> getAnnouncementsByProId(UUID proId);
	
	/**
	 * ��Ŀ������ģ����ѯ
	 * @param queryModel
	 * 		��ѯ����model
	 * @param pageModel
	 * 		��ѯ��ҳ����model
	 * @return PageFormater
	 * 		��ҳmodel
	 */
	PageFormater getProjectsByFuzzy(ProQueryModel queryModel,PageModel pageModel);
	
	/**
	 * ������Ŀģ������ѯ��Ŀ������
	 * @param fuzzyName
	 * 		��Ŀģ����
	 * @return
	 */
	List<ProNameDto> getProNameByFuzzy(String fuzzyName);
	
	/**
	 * ������Ŀid��ȡ��Ŀ�¶ȼ�������
	 * @param proId
	 * 		��Ŀid
	 * @return List<ProjectItem>
	 * 		��Ŀ�¶���Ϣ����
	 */
	List<ProjectItem> getProjectItemsByProId(UUID proId);
	
	/**
	 * Ϊָ������Ŀ������Ŀ�¶���Ϣ
	 * @param item
	 * 		��Ŀ�¶���Ϣʵ��
	 * @param proId
	 * 		��Ŀid
	 */
	Project addProItem(ProjectItem item,UUID proId) throws DomainException;

	/**
	 * ��������
	 * @param announcement
	 * @return
	 */
	public Project addAnnouncement(Announcement announcement);
	
	/**
	 * �����ļ���������Ŀ
	 * @param list
	 * 		��Ŀ����
	 */
	public void addProByFile(List<Project> list) throws DomainException;
	
	/**
	 * �����·ݵ�����Ŀ����
	 * @param date
	 * 		ɸѡ���·�
	 * @return List<Project>
	 * 		��Ŀ����
	 */
	public List<Project> exportByMonth(Date date);
	
	/**
	 * �޸Ĺ���
	 * @param model
	 * 		����ʵ��
	 */
	public void editAnnouncement(Announcement model);
	
	/**
	 * �༭
	 * @param item
	 */
	public void editProItem(ProjectItem item);
	
	/**
	 * ������Ŀid���ϻ�ȡ��Ŀ����
	 * @param uuids
	 * 		��Ŀid����
	 * @return List<Project>
	 * 		��Ŀ����
	 */
	public List<Project> getProjects4Print(String uuids);
	
	/**
	 * ������Ŀ���ƻ�ȡid
	 * @param name
	 * 		��Ŀ��
	 * @return UUID
	 * 		��Ŀid
	 */
	public UUID getIdByName(String name);
	
}
