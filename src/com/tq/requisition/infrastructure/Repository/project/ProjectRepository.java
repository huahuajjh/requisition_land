package com.tq.requisition.infrastructure.Repository.project;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.tq.requisition.domain.IRepository.IRepositoryContext;
import com.tq.requisition.domain.Specification.SpecificationExt;
import com.tq.requisition.domain.Specification.expression.OperationType;
import com.tq.requisition.domain.model.project.Announcement;
import com.tq.requisition.domain.model.project.IProjectRepository;
import com.tq.requisition.domain.model.project.Project;
import com.tq.requisition.domain.model.project.ProjectItem;
import com.tq.requisition.exception.DomainException;
import com.tq.requisition.infrastructure.Repository.HbRepository;
import com.tq.requisition.infrastructure.Specifications.project.ProByMonthSpecification;
import com.tq.requisition.infrastructure.Specifications.project.ProExistsByApprovalNumSpecification;
import com.tq.requisition.infrastructure.Specifications.project.ProExistsByNameSpecification;
import com.tq.requisition.infrastructure.Specifications.project.ProFuzzyQueryPageCountSpecification;
import com.tq.requisition.infrastructure.Specifications.project.ProFuzzyQuerySpecification;
import com.tq.requisition.infrastructure.Specifications.project.ProItemExistsDateSpecification;
import com.tq.requisition.infrastructure.Specifications.project.ProQuery4PrintSpecification;
import com.tq.requisition.infrastructure.Specifications.project.ProQueryByNameSpecification;
import com.tq.requisition.infrastructure.utils.PageFormater;
import com.tq.requisition.presentation.dto.project.ProExportCondition;
import com.tq.requisition.presentation.dto.project.ProNameDto;
import com.tq.requisition.presentation.dto.project.ProQueryModel;
import com.tq.requisition.presentation.dto.share.PageModel;

/**
 * ��Ŀ�ִ�ʵ����
 * 
 * @author jjh
 * @time 2015-12-27 21:01
 */
public class ProjectRepository extends HbRepository<Project> implements
		IProjectRepository {

	public ProjectRepository(IRepositoryContext context) {
		super(context);
	}

	@Override
	public List<Announcement> getAnnouncementsByProId(UUID proId) {
		if (proId == null) {
			throw new NullPointerException("��ĿidΪnull");
		}
		List<Announcement> list = getBySql(Announcement.class, //
				"select * from tb_announcement where pro_id=?",//
				proId.toString());
		return list;
	}

	@Override
	public PageFormater getProjectsByFuzzy(ProQueryModel queryModel,
			PageModel pageModel) {
		int count = getTotalCount(new ProFuzzyQueryPageCountSpecification(
				Project.class, queryModel));
		List<Project> list = getAll(new ProFuzzyQuerySpecification(
				Project.class, queryModel, pageModel));
		for (Project project : list) {
			project.toAnnStr();
			project.toProTypeStr();
		}
		return PageFormater.obtain(list, count);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProNameDto> getProNameByFuzzy(String fuzzyName) {
		Session session = hbContext().session();
		if (fuzzyName == null) {
			fuzzyName = "";
		}
		SQLQuery sql = session
				.createSQLQuery("select id,pro_name from tb_project where pro_name like '%"
						+ fuzzyName.trim() + "%'");
		sql.setFirstResult(0);
		sql.setMaxResults(10);
		List<Object[]> list = sql.list();
		List<ProNameDto> proNames = new ArrayList<ProNameDto>();
		for (Object[] objects : list) {
			ProNameDto p = new ProNameDto();
			p.setId(objects[0].toString());
			p.setProName(objects[1].toString());
			proNames.add(p);
		}
		return proNames;
	}

	@Override
	public List<ProjectItem> getProjectItemsByProId(UUID proId) {
		if (proId == null) {
			throw new NullPointerException("��ĿidΪnull");
		}
		List<ProjectItem> items = getBySql(ProjectItem.class,
				"select * from tb_project_item where pro_id=?",
				proId.toString());
		return items;
	}

	@Override
	public Project addProItem(ProjectItem item, UUID proId)
			throws DomainException {
		if (item == null) {
			throw new DomainException("δ��ѯ��ָ������Ŀ��Ϣ");
		}
		item.validate();

		// ����ظ�ʱ��
		boolean r = exists(new ProItemExistsDateSpecification(Project.class,
				item.getDate(), proId));
		if (r) {
			throw new DomainException("ʱ��[" + item.getDate().toLocaleString()
					+ "]�Ѿ�¼������Ŀ�¶���Ϣ����Ҫ�޸ģ�����[�����±�]");
		}

		// ������Ŀ�Ƿ�������
		Project pro = getByKey(Project.class, proId);
		// ������Ŀ�ۼ��⸶����
		pro.updateMoney(item.getPaidMoney());
		if (item.getStartDate() != null) {
			pro.updateStartDate(item.getStartDate());
		}
		// ������Ŀ��Ⱥ��ۼ�����
		pro.updateTotalData(item);
		update(pro);
		add(item);
		pro.toProTypeStr();
		return pro;
	}

	@Override
	public Project addAnnouncement(Announcement announcement) {
		announcement.validate();
		Announcement an = Announcement.obtain(announcement.getNumber(),//
				announcement.getDocPath(), announcement.getDate(), //
				announcement.getSequence(), announcement.getProId());

		// ������Ŀ�������
		Project pro = getByKey(Project.class, announcement.getProId());
		if (null == pro) {
			throw new NullPointerException("δ��ѯ����Ŀ��Ϣ");
		}
		pro.setSequence(announcement.getSequence());
		pro.toAnnStr();
		pro.toProTypeStr();

		// ������Ŀ�������
		update(pro);

		// �־û�������Ϣ
		add(an);
		return pro;
	}

	@Override
	public void addProByFile(List<Project> list) throws DomainException {
		for (Project project : list) {
			// for (Announcement an : project.getAnnouncements()) {
			// an.setProId(project.getId());
			// addAnnouncement(an);
			// }
			saveOrUpdatePro(project);
		}
	}

	@Override
	public void addPro(Project model) throws DomainException {
		if (null == model) {
			throw new DomainException("��������Ŀ��ϢΪ��");
		}

		boolean r = exists(new ProExistsByNameSpecification(Project.class,
				model.getProName()));
		if (r) {
			throw new DomainException("��Ŀ����[" + model.getProName() + "]�Ѿ�����");
		}

//		boolean r1 = exists(new ProExistsByApprovalNumSpecification(
//				Project.class, model.getApprovalNumber()));
//		if (r1) {
//			throw new DomainException("��Ŀ������[" + model.getApprovalNumber()
//					+ "]�Ѿ�����");
//		}

		add(model);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Project> exportByMonth(ProExportCondition condition) {
		List<ProjectItem> list = getAllByHqlJoin(new ProByMonthSpecification(
				ProjectItem.class, condition), -1, -1);
		if (null == list || list.size() == 0) {
			return null;
		}
		List<Project> pros = new ArrayList<>();
		for (ProjectItem projectItem : list) {
			Project pro = getByKey(Project.class, projectItem.getProId());
			if(null==pro){continue;}
			if(condition.getProCategory() != null && !condition.getProCategory().equals("")){
				if(pro.getCategoryStr() == null || !pro.getCategoryStr().equals(condition.getProCategory())){
					continue;
				}
			}
			pro.setAnnouncements(getAnnouncementsByProId(pro.getId()));
			pro.getItems().add(projectItem);
			pro.toProTypeStr();
			pros.add(pro);
		}
		return pros;
	}

	@Override
	public void editAnnouncement(Announcement model) {
		Announcement an = get(Announcement.class, model.getId());
		an.modify(model);
		update(an);
	}

	@Override
	public void editProItem(ProjectItem item) {
		ProjectItem entity = get(ProjectItem.class, item.getId());
		if (null == entity) {
			throw new NullPointerException("δ��ѯ���¶���Ϣ");
		}
		entity.modify(item);
		update(entity);
	}

	@Override
	public List<Project> getProjects4Print(String uuids) {
		List<Project> list = getAll(new ProQuery4PrintSpecification(
				Project.class, uuids));
		for (Project project : list) {
			List<Announcement> ans = getAnnouncementsByProId(project.getId());
			project.setAnnouncements(ans);
			List<ProjectItem> items = getProjectItemsByProId(project.getId());
			project.setItems(items);
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public UUID getIdByName(String name) {
		Session session = hbContext().session();
		SQLQuery query = session
				.createSQLQuery("select id from tb_project where pro_name=?");
		query.setParameter(0, name);
		List<Object> id = query.list();
		if (id != null && id.size() > 0) {
			return UUID.fromString(id.get(0).toString());
		}
		return null;

	}

	@SuppressWarnings("unchecked")
	private void saveOrUpdateProItem(final ProjectItem proItem)
			throws DomainException {
		SpecificationExt<ProjectItem> sp = new SpecificationExt<ProjectItem>(
				ProjectItem.class) {

			@Override
			public String getAbsHql() {
				return "from ProjectItem where date=? and proId=?";
			}

			@Override
			public String getAbsSql() {
				// TODO Auto-generated method stub
				return null;
			}

			@Override
			public Object[] getAbsParameters() {
				return new Object[] { proItem.getDate(), proItem.getProId() };
			}

			@Override
			public OperationType getAbsType() {
				return OperationType.HQL;
			}

		};
		List<ProjectItem> items = getAllByHqlJoin(sp, -1, -1);
		// ���δ��ѯ��ָ����Ŀid����Ŀ�¶�����ڵļ�¼����������Ŀ�¶���Ϣ
		if (null == items || items.size() == 0) {
			add(proItem);
			return;
		}

		// �����ѯ��ָ����Ŀ���¶��ʱ��ļ�¼���򸲸��¶�����
		ProjectItem item = items.get(0);
		item.modify(proItem);
		// �����¶���Ϣ
		update(item);
	}

	private void saveOrUpdatePro(Project pro) throws DomainException {
		List<Project> ps = getAll(new ProQueryByNameSpecification(Project.class, pro.getProName()));
		
		// ���δ��ѯ����Ŀ��Ϣ����Ϊ����
		if (null == ps || ps.size()==0) {
			add(pro);
			for (ProjectItem item : pro.getItems()) {
				item.setProId(pro.getId());
				add(item);
			}
//			for (Announcement ann : pro.getAnnouncements()) {
//				ann.setId(UUID.randomUUID());
//				ann.setProId(pro.getId());
//				add(ann);
//			}
		} 
		else {
			// �����Ϊ�գ������
			ps.get(0).modify4Import(pro);
			update(ps.get(0));
			for (ProjectItem item : pro.getItems()) {
				item.setProId(ps.get(0).getId());
				saveOrUpdateProItem(item);
			}
//			for (Announcement ann : pro.getAnnouncements()) {				
//				saveOrUpdateAnnouncement(pro.getAnnouncements(), ps.get(0).getId());
//			}
		}

	}

//	@SuppressWarnings("unchecked")
//	private void saveOrUpdateAnnouncement(List<Announcement> list, UUID proId) {
//		if (null == list || list.size() == 0) {
//			return;
//		}
//		for (Announcement announcement : list) {
//			List<Announcement> anns = getAllByHqlJoin(new AnnQueryBySequenceAndPIdSpecification(Announcement.class, announcement.getSequence(),proId), -1, -1);
//			if(anns==null || anns.size()==0){
//				announcement.setId(UUID.randomUUID());
//				announcement.setProId(proId);
//				add(announcement);
//			}
//			else {
//				anns.get(0).modify(announcement);
//			}
//		}
//	}

}
