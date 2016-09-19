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
import com.tq.requisition.presentation.dto.removedinfo.RemovedExportCondition;
import com.tq.requisition.presentation.dto.rmHousehold.FamilyAndItem;
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
			return toJson("成功", f, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			context().rollback();
			return toJson("失败-"+e.getMessage(), null, Formater.OperationResult.FAIL);
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
			return toJsonByPage(queryFmlsList(queryModel, pageModel), "成功", Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			return toJson("失败-"+e.getMessage(), null, Formater.OperationResult.FAIL);
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
			return toJson("成功", r, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			context().rollback();
			return toJson("失败-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
		finally{
			context().close();
		}
	}

	@Override
	public String deleteFml(UUID id) {
		throw new NotImplementedException("未实现的方法");
	}

	@Override
	public String importFml(Family dto) {
		if(null==dto)
		{
			return toJson("上传的拆迁户数据为空", null, Formater.OperationResult.FAIL);
		}
		UUID proId = projectRepository.getIdByName(dto.getProName());
		if(proId==null){
			return toJson("未查询到拆迁户所属项目-["+dto.getProName()+"]", null, Formater.OperationResult.FAIL);
		}
		
		//检测是否有户主
		boolean hasHouselead = hasHouselead(dto);
		if(!hasHouselead){
			return toJson("在[与户主关系]字段中,必须指定一个[户主]", null, Formater.OperationResult.FAIL);
		}
		
		dto.setProId(proId);
		for (FamilyItem item : dto.getItems()) {
			item.setProId(proId);
			//根据导入的社保名称查询社保id
			UUID sid = socialsecurityTypeRepository.getIdByName(item.getSocialsecurityStr());
			//根据导入的关系名称查询关系id
			UUID rid = relationshipTypeRepository.getIdByName(item.getRelationshipStr());
			item.setSocialsecurityTypeId(sid);
			item.setRelationshipId(rid);
		}
		try {
			context().beginTransaction();
			fmlRepository.addFamily(dto);
			context().commit();
			return toJson("上传拆迁户信息成功", new Object[]{dto,toRemovedInfos(dto.getItems())}, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			context().rollback();
			return toJson(e.getMessage(), null, Formater.OperationResult.FAIL);
		}
		finally{
			context().close();
		}
		
	}

	@Override
	public String getFml4Print(String uuids) {
		if(null==uuids || uuids.trim().equals("")){
			return toJson("获取拆迁户打印信息失败-未查询到户信息", null, Formater.OperationResult.FAIL);
		}
		
		List<Family> fmls = fmlRepository.getFml4Print(uuids);
		if(null==fmls){return toJson("获取拆迁户打印信息失败-未查询到户信息", null, Formater.OperationResult.FAIL); }
		
		for (Family family : fmls) {
			List<FamilyItem> items = fmlItemRepository.queryItemsByFmlId(family.getId());
			family.setItems(items);
		}
				
		return toJson("查询打印信息成功", fmls, Formater.OperationResult.SUCCESS);
	}

	@Override
	public String getFmlByItemId(UUID id) {
		Family fml = fmlRepository.getByKey(Family.class, id);
		if(null==fml){return toJson("未查询到户信息", null, Formater.OperationResult.FAIL);}
		
		List<FamilyItem> list = fmlItemRepository.queryItemsByFmlId(id);
		if(null==list || list.size()==0){return toJson("未查询到拆迁人员信息", null, Formater.OperationResult.FAIL);}
		
		fml.setItems(list);
		return toJson("查询拆迁户成功", fml, Formater.OperationResult.SUCCESS);
	}
	
	@Override
	public String getFml4HPT(FamilyQueryModel queryModel, PageModel pageModel) {
		PageFormater page = fmlRepository.getFmlBasicInfo(queryModel, pageModel);
		return toJsonByPage(page, "获取拆迁户信息成功", Formater.OperationResult.SUCCESS);
	}

	private boolean hasHouselead(Family fml)
	{
		for (FamilyItem item : fml.getItems()) {
			if(item.getRelationshipStr().trim().equals("户主")){
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

	@Override
	public List<FamilyAndItem> exportByDate(RemovedExportCondition query) {
		List<Family> listData = this.fmlRepository.exportByDate(query);
		if(listData == null || listData.size() <= 0) return new ArrayList<FamilyAndItem>();
		List<FamilyAndItem> datas = new ArrayList<FamilyAndItem>();
		for(int i = 0; i<listData.size();i++) {
			Family family = listData.get(i);
			List<FamilyItem> list = fmlItemRepository.queryItemsByFmlId(family.getId());
			if(list != null && list.size() > 0) {
				for(int l = 0; l < list.size(); l++){
					FamilyItem item = list.get(l);
					datas.add(FamilyAndItem.ToModel(family, item));
				}
			}
		}
		return datas;
	}
}
