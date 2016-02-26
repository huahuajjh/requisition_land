package com.tq.requisition.application.fmlMgtImpl;

import java.util.List;
import java.util.UUID;

import org.apache.commons.lang3.NotImplementedException;

import com.tq.requisition.application.BaseApplication;
import com.tq.requisition.autoMapper.FamilyItemMapper;
import com.tq.requisition.domain.IRepository.IRepositoryContext;
import com.tq.requisition.domain.model.familyMember.FamilyItem;
import com.tq.requisition.domain.model.familyMember.IFamilyItemRepository;
import com.tq.requisition.infrastructure.utils.Formater;
import com.tq.requisition.infrastructure.utils.PageFormater;
import com.tq.requisition.presentation.dto.rmHousehold.FamilyItemDto;
import com.tq.requisition.presentation.dto.rmHousehold.FamilyItemQueryModel;
import com.tq.requisition.presentation.dto.share.PageModel;
import com.tq.requisition.presentation.serviceContract.rmHousehold.IFamilyItemServiceContract;

public class FamilyItemServiceImpl extends BaseApplication implements IFamilyItemServiceContract{
	private IFamilyItemRepository itemRepository;
	
	public FamilyItemServiceImpl(//
			IRepositoryContext context,//
			IFamilyItemRepository itemRepository) {
		super(context);
		this.itemRepository = itemRepository;
		this.itemRepository.setAggregatorRootClass(FamilyItem.class);
	}

	@Override
	public String queryFamilyItemsByFuzzy(FamilyItemQueryModel queryModel,
			PageModel pageModel) {
		try {
			return toJsonByPage(queryFamilyItemListByFuzzy(queryModel, pageModel), "成功", Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			return toJson("失败-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
	}

	@Override
	public PageFormater queryFamilyItemListByFuzzy(
			FamilyItemQueryModel queryModel, PageModel pageModel) {
		PageFormater page = itemRepository.queryByFuzzy(queryModel, pageModel);
		return page;
	}

	@Override
	public String editFmlItem(FamilyItemDto item) {
		FamilyItem i = FamilyItemMapper.toModel(item);
		item.setId(item.getId());
		i.setId(item.getId());
		try {
			context().beginTransaction();
			FamilyItem fmlItem = itemRepository.editFamilyItem(i);
			context().commit();
			return toJson("编辑成功", fmlItem, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			context().rollback();
			return toJson("编辑失败-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
		finally{
			context().close();
		}
	}

	@Override
	public String deleteFmlItem(UUID id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public String queryByIdNumber(String idNumber) {
		try {
			FamilyItem item = itemRepository.queryByIdNumber(idNumber);
			return toJson("成功", item, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			return toJson("失败-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
	}

	@Override
	public String queryByFmlId(UUID id) {
		try {
			List<FamilyItem> list = itemRepository.queryItemsByFmlId(id);
			return toJson("成功", FamilyItemMapper.toDtoList(list), Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			return toJson("失败-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
	}
	
	@Override
	public String addFmlItem(FamilyItemDto dto) {
		throw new NotImplementedException("未实现的方法");
	}
	
	@Override
	public String queryByIdNumberAndName(String idNumber, String name) {
		try {
			FamilyItem item = itemRepository.queryByIdNumberAndName(idNumber, name);
			return toJson("查询人员信息成功", FamilyItemMapper.toDto(item), Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			return toJson("查询人员信息失败-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
	}
	
}
