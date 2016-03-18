package com.tq.requisition.application.hpt;

import com.tq.requisition.application.BaseApplication;
import com.tq.requisition.domain.IRepository.IRepositoryContext;
import com.tq.requisition.domain.model.familyMember.FamilyItem;
import com.tq.requisition.domain.model.familyMember.IFamilyItemRepository;
import com.tq.requisition.domain.model.housePuraseTicket.IHPTRepository;
import com.tq.requisition.infrastructure.utils.Formater;
import com.tq.requisition.presentation.dto.hpt.PersonAndHPTDto;
import com.tq.requisition.presentation.serviceContract.hptMgt.IHPTMgtFmlItemServiceContract;

public class HPTMgtFmlItemServiceImpl extends BaseApplication implements IHPTMgtFmlItemServiceContract{

	private IHPTRepository htpRepository;
	private IFamilyItemRepository familyItemRepository;
	
	public HPTMgtFmlItemServiceImpl(IRepositoryContext context,
			IHPTRepository htpRepository,
			IFamilyItemRepository familyItemRepository) {
		super(context);
		this.htpRepository = htpRepository;
		this.familyItemRepository = familyItemRepository;
	}

	@Override
	public String add(PersonAndHPTDto personAndHPTDto) {
		try {
			context().beginTransaction();
			FamilyItem item = personAndHPTDto.toFamilyItem();
			familyItemRepository.addFamilyItem(item);
			htpRepository.addHPT(personAndHPTDto.toHousePuraseTicket(item));
			context().commit();
			return toJson("新增人员以及购房券成功", null, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			context().rollback();
			return toJson("新增人员以及购房券失败-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
		finally{
			context().close();
		}
	}

}
