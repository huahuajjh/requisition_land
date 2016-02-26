package com.tq.requisition.application.proMgt;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.lang3.NotImplementedException;

import com.tq.requisition.application.BaseApplication;
import com.tq.requisition.autoMapper.AnnouncementMapper;
import com.tq.requisition.autoMapper.NewProjectMapper;
import com.tq.requisition.autoMapper.ProItemMapper;
import com.tq.requisition.autoMapper.ProMapper;
import com.tq.requisition.domain.IRepository.IRepositoryContext;
import com.tq.requisition.domain.model.project.Announcement;
import com.tq.requisition.domain.model.project.IProjectRepository;
import com.tq.requisition.domain.model.project.Project;
import com.tq.requisition.domain.model.project.ProjectItem;
import com.tq.requisition.domain.model.project.ProjectType;
import com.tq.requisition.exception.DomainException;
import com.tq.requisition.infrastructure.utils.Formater;
import com.tq.requisition.infrastructure.utils.PageFormater;
import com.tq.requisition.presentation.dto.project.AnnouncementDto;
import com.tq.requisition.presentation.dto.project.NewProDto;
import com.tq.requisition.presentation.dto.project.ProExportCondition;
import com.tq.requisition.presentation.dto.project.ProImportAndExportDto;
import com.tq.requisition.presentation.dto.project.ProItemDto;
import com.tq.requisition.presentation.dto.project.ProNameDto;
import com.tq.requisition.presentation.dto.project.ProQueryModel;
import com.tq.requisition.presentation.dto.project.ProTypeDto;
import com.tq.requisition.presentation.dto.project.ProjectDto;
import com.tq.requisition.presentation.dto.share.PageModel;
import com.tq.requisition.presentation.serviceContract.proMgt.IProMgtServiceContract;

/**
 * ��Ŀ������Լ�ӿ�ʵ���࣬���������Ŀ��curd���Լ���Ŀ�¶���Ϣ
 * @author jjh
 * @time 2015-12-27 17:42
 */
public class ProMgtServiceIContractmpl extends BaseApplication implements IProMgtServiceContract{
	private IProjectRepository projectRepository;
	
	public ProMgtServiceIContractmpl(
			IRepositoryContext context,//
			IProjectRepository projectRepository) {
		super(context);
		this.projectRepository = projectRepository;
		this.projectRepository.setAggregatorRootClass(Project.class);
	}

	@Override
	public String addPro(NewProDto dto) {
		Project pro = NewProjectMapper.toModel(dto);
		context().beginTransaction();
		try {
			projectRepository.addPro(pro);
			context().commit();
			return toJson("�����Ŀ�ɹ�", null, Formater.OperationResult.SUCCESS);
		} catch (DomainException e) {
			return toJson("�����Ŀʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
		finally{
			context().close();
		}
	}

	@Override
	public List<ProTypeDto> getProType() {
		List<ProTypeDto> list = new ArrayList<ProTypeDto>();
		list.add(ProTypeDto.obtain(ProjectType.OTHER.toValue(),ProjectType.OTHER.toStr()));
		list.add(ProTypeDto.obtain(ProjectType.INFRASTRUCTURE.toValue(),ProjectType.INFRASTRUCTURE.toStr()));
		return list;
	}

	@Override
	public String getAnnounce(UUID proId) {
		try {
			List<Announcement> list = projectRepository.getAnnouncementsByProId(proId);
			List<AnnouncementDto> dtos = AnnouncementMapper.toDtoList(list);
			return toJson("�ɹ�", dtos, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			return toJson("ʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
	}

	@Override
	public String getProListFuzzy(ProQueryModel query, PageModel page) {
		try {
			PageFormater pageFormater = projectRepository.getProjectsByFuzzy(query, page);
			return toJson("�ɹ�", pageFormater, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			return toJson("ʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
		finally{
		}
		
	}

	@Override
	public String editPro(ProjectDto dto) {
		context().beginTransaction();
		try {
			Project pro = projectRepository.getByKey(Project.class, dto.getId());
			pro.modify(ProMapper.toModel(dto));
			pro.validate();
			pro.toAnnStr();
			pro.toProTypeStr();
			projectRepository.update(pro);
			context().commit();
			return toJson("�޸���Ŀ��Ϣ�ɹ�", pro, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			return toJson("�޸���Ŀ��Ϣʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
		finally{
			context().close();
		}
	}

	@Override
	public String deletePro(UUID proId) {
		throw new NotImplementedException("δʵ�ֵķ���");
	}

	@Override
	public String getProNameListFuzzy(String fuzzyName) {
		/*�ִ��п���������*/
		try {
			List<ProNameDto> names = projectRepository.getProNameByFuzzy(fuzzyName);
			return toJson("�ɹ�", names, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			return toJson("��ȡ��Ŀ��ʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
	}

	@Override
	public String addProItem(ProItemDto dto, UUID proId) {
		context().beginTransaction();
		try {
			Project pro = projectRepository.addProItem(ProItemMapper.toModel(dto), proId);
			context().commit();
			return toJson("�����Ŀ�¶���Ϣ�ɹ�", pro, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			return toJson("�����Ŀ�¶���Ϣʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
		finally{
			context().close();
		}
	}

	@Override
	public String getProItemsByProId(UUID proId) {
		try {
			List<ProjectItem> items = projectRepository.getProjectItemsByProId(proId);
			List<ProItemDto> dtos = ProItemMapper.toDtoList(items);
			return toJson("�ɹ�", dtos, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			return toJson("�@ȡ�¶���Ϣʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
	}

	@Override
	public String addAnnouncement(AnnouncementDto dto) {
		try {
			context().beginTransaction();
			Project pro = projectRepository.addAnnouncement(AnnouncementMapper.toModel(dto));
			context().commit();
			return toJson("��������ɹ�", pro, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			return toJson("��������ʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
		
	}

	@Override
	public String getProById(UUID id) {
		try {
			return toJson("�ɹ�", getById4Entity(id), Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			return toJson("��ȡ��Ŀ��Ϣʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
	}

	@Override
	public ProjectDto getById4Entity(UUID id) {
		Project pro = projectRepository.getByKey(Project.class, id);
		if(null==pro){return null;}
		pro.toAnnStr();
		pro.toProTypeStr();
		ProjectDto dto = ProMapper.toDto(pro);
		return dto;
	}

	@Override
	public String addByFile(List<ProImportAndExportDto> list) {
		if(null == list){
			return toJson("��Ŀ����ת���쳣-δ��ȡ����Ŀ��Ϣ", null, Formater.OperationResult.FAIL);
		}
		List<Project> pros = new ArrayList<>();
		for (ProImportAndExportDto proImportAndExportDto : list) {
			pros.add(proImportAndExportDto.toProject());
		}
		
		context().beginTransaction();
		try {
			projectRepository.addProByFile(pros);
			context().commit();
			return toJson("��Ŀ�����ϴ��ɹ�", null, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			context().rollback();
			return toJson("��Ŀ����ת���쳣-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
		finally{
			context().close();
		}
	}
	
	@Override
	public List<ProImportAndExportDto> exportProByDate(ProExportCondition condition) {
		if(null==condition){
			return null;
		}
		List<Project> list = projectRepository.exportByMonth(condition);
		if(null==list || list.size()==0){
			return null;
		}
		List<ProImportAndExportDto> dtos = ProImportAndExportDto.obtainByProList(list);
		return dtos;
	}
	
	@Override
	public String editAnnouncement(AnnouncementDto dto) {
		try {
			context().beginTransaction();
			Announcement an = AnnouncementMapper.toModel(dto);
			an.setId(dto.getId());
			projectRepository.editAnnouncement(an);
			context().commit();
			return toJson("�༭����ɹ�", null, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			return toJson("�༭����ʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
		finally{
			context().rollback();
		}
	}
	
	@Override
	public String editProItem(ProItemDto dto) {
		try {
			context().beginTransaction();
			ProjectItem item = ProItemMapper.toModel(dto);
			item.setId(dto.getId());
			projectRepository.editProItem(item);
			context().commit();
			return toJson("�༭�¶���Ϣ�ɹ�", null, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			return toJson("�༭�¶���Ϣʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
		finally{
			context().rollback();
		}
	}
	
	@Override
	public String getPro4Print(String uuids) {
		List<Project> list = projectRepository.getProjects4Print(uuids);
		return toJson("��ȡ��ӡ��Ϣ�ɹ�", list, Formater.OperationResult.SUCCESS);
	}

}
