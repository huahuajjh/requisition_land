package com.tq.requisition.application.fmlMgtImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.lang3.NotImplementedException;

import com.tq.requisition.application.BaseApplication;
import com.tq.requisition.autoMapper.FamilyMapper;
import com.tq.requisition.domain.IRepository.IRepositoryContext;
import com.tq.requisition.domain.model.familyMember.FamilyItem;
import com.tq.requisition.domain.model.familyMember.IFamilyItemRepository;
import com.tq.requisition.domain.model.project.IProjectRepository;
import com.tq.requisition.domain.model.project.Project;
import com.tq.requisition.domain.model.relationshipType.IRelationshipTypeRepository;
import com.tq.requisition.domain.model.relationshipType.RelationshipType;
import com.tq.requisition.domain.model.removeFamily.Family;
import com.tq.requisition.domain.model.removeFamily.IFamilyRepository;
import com.tq.requisition.domain.model.removedInfo.RemovedInfo;
import com.tq.requisition.domain.model.socialsecurityType.ISocialsecurityTypeRepository;
import com.tq.requisition.domain.model.socialsecurityType.SocialsecurityType;
import com.tq.requisition.infrastructure.utils.Formater;
import com.tq.requisition.infrastructure.utils.PageFormater;
import com.tq.requisition.presentation.dto.rmHousehold.FamilyDto;
import com.tq.requisition.presentation.dto.rmHousehold.FamilyItemDto;
import com.tq.requisition.presentation.dto.rmHousehold.FamilyQueryModel;
import com.tq.requisition.presentation.dto.share.PageModel;
import com.tq.requisition.presentation.serviceContract.rmHousehold.IFamilyMgtServiceContract;

public class FamilyMgtServiceImpl extends BaseApplication implements IFamilyMgtServiceContract{
	private IFamilyRepository fmlRepository;
	private IProjectRepository projectRepository;
	private ISocialsecurityTypeRepository socialsecurityTypeRepository;
	private IRelationshipTypeRepository relationshipTypeRepository;
	private IFamilyItemRepository fmlItemRepository;

	public FamilyMgtServiceImpl(//
			IRepositoryContext context,//
			IFamilyRepository fmlRepository,//
			IProjectRepository projectRepository,//
			ISocialsecurityTypeRepository socialsecurityTypeRepository,//
			IRelationshipTypeRepository relationshipTypeRepository,//
			IFamilyItemRepository fmlItemRepository) {
		super(context);
		this.fmlRepository = fmlRepository;
		this.fmlRepository.setAggregatorRootClass(Family.class);
		
		this.projectRepository = projectRepository;
		this.projectRepository.setAggregatorRootClass(Project.class);
		
		this.socialsecurityTypeRepository = socialsecurityTypeRepository;
		this.socialsecurityTypeRepository.setAggregatorRootClass(SocialsecurityType.class);
		
		this.relationshipTypeRepository = relationshipTypeRepository;
		this.relationshipTypeRepository.setAggregatorRootClass(RelationshipType.class);
		
		this.fmlItemRepository = fmlItemRepository;
		this.fmlItemRepository.setAggregatorRootClass(FamilyItem.class);
	}

	@Override
	public String addFamily(FamilyDto fml) {
		try {
			context().beginTransaction();
			Family f = fmlRepository.addFamily(FamilyMapper.toModel(fml));
			context().commit();
			return toJson("�ɹ�", f, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			context().rollback();
			return toJson("ʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
		finally{
			context().close();
		}
	}

	@Override
	public PageFormater queryFmlsList(FamilyQueryModel queryModel,
			PageModel pageModel) {
		PageFormater page = fmlRepository.getListByFuzzy(queryModel, pageModel);
		return page;
	}

	@Override
	public String queryFmlByFuzzy(FamilyQueryModel queryModel,
			PageModel pageModel) {
		try {
			return toJsonByPage(queryFmlsList(queryModel, pageModel), "�ɹ�", Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			return toJson("ʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
	}

	@Override
	public String editFml(FamilyDto fml) {
		try {
			context().beginTransaction();
			Family f = FamilyMapper.toModel(fml);
			f.setId(fml.getId());
			Family r = fmlRepository.editFamily(f);
			context().commit();
			return toJson("�ɹ�", r, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			context().rollback();
			return toJson("ʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
		finally{
			context().close();
		}
	}

	@Override
	public String deleteFml(UUID id) {
		throw new NotImplementedException("δʵ�ֵķ���");
	}

	@Override
	public String importFml(Family dto) {
		if(null==dto)
		{
			return toJson("�ϴ��Ĳ�Ǩ������Ϊ��", null, Formater.OperationResult.SUCCESS);
		}
		UUID proId = projectRepository.getIdByName(dto.getProName());
		if(proId==null){
			return toJson("δ��ѯ����Ǩ��������Ŀ-["+dto.getProName()+"]", null, Formater.OperationResult.SUCCESS);
		}
		
		//����Ƿ��л���
		boolean hasHouselead = hasHouselead(dto);
		if(!hasHouselead){
			return toJson("��[�뻧����ϵ]�ֶ���,����ָ��һ��[����]", null, Formater.OperationResult.FAIL);
		}
		
		dto.setProId(proId);
		for (FamilyItem item : dto.getItems()) {
			item.setProId(proId);
			//���ݵ�����籣���Ʋ�ѯ�籣id
			UUID sid = socialsecurityTypeRepository.getIdByName(item.getSocialsecurityStr());
			//���ݵ���Ĺ�ϵ���Ʋ�ѯ��ϵid
			UUID rid = relationshipTypeRepository.getIdByName(item.getRelationshipStr());
			item.setSocialsecurityTypeId(sid);
			item.setRelationshipId(rid);
		}
		try {
			context().beginTransaction();
			fmlRepository.addFamily(dto);
			context().commit();
			return toJson("�ϴ���Ǩ����Ϣ�ɹ�", new Object[]{dto,toRemovedInfos(dto.getItems())}, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			context().rollback();
			return toJson("�ϴ���Ǩ����Ϣʧ��", null, Formater.OperationResult.FAIL);
		}
		finally{
			context().close();
		}
		
	}

	@Override
	public String getFml4Print(String uuids) {
		if(null==uuids || uuids.trim().equals("")){
			return toJson("��ȡ��Ǩ����ӡ��Ϣʧ��-δ��ѯ������Ϣ", null, Formater.OperationResult.FAIL);
		}
		
		List<Family> fmls = fmlRepository.getFml4Print(uuids);
		if(null==fmls){return toJson("��ȡ��Ǩ����ӡ��Ϣʧ��-δ��ѯ������Ϣ", null, Formater.OperationResult.FAIL); }
		
		for (Family family : fmls) {
			List<FamilyItem> items = fmlItemRepository.queryItemsByFmlId(family.getId());
			family.setItems(items);
		}
				
		return toJson("��ѯ��ӡ��Ϣ�ɹ�", fmls, Formater.OperationResult.SUCCESS);
	}

	@Override
	public String getFmlByItemId(UUID id) {
		Family fml = fmlRepository.getByKey(Family.class, id);
		if(null==fml){return toJson("δ��ѯ������Ϣ", null, Formater.OperationResult.FAIL);}
		
		List<FamilyItem> list = fmlItemRepository.queryItemsByFmlId(id);
		if(null==list || list.size()==0){return toJson("δ��ѯ����Ǩ��Ա��Ϣ", null, Formater.OperationResult.FAIL);}
		
		fml.setItems(list);
		return toJson("��ѯ��Ǩ���ɹ�", fml, Formater.OperationResult.SUCCESS);
	}
	
	@Override
	public String getFml4HPT(FamilyQueryModel queryModel, PageModel pageModel) {
		PageFormater page = fmlRepository.getFmlBasicInfo(queryModel, pageModel);
		return toJsonByPage(page, "��ȡ��Ǩ����Ϣ�ɹ�", Formater.OperationResult.SUCCESS);
	}

	private boolean hasHouselead(Family fml)
	{
		for (FamilyItem item : fml.getItems()) {
			if(item.getRelationshipStr().trim().equals("����")){
				return true;
			}
		}
		return false;
	}

	private List<RemovedInfo> toRemovedInfos(List<FamilyItem> items){
		List<RemovedInfo> infos = new ArrayList<RemovedInfo>();
		for (FamilyItem familyItem : items) {
			infos.add(familyItem.toRemovedInfo());
		}
		return infos;
	}
}
