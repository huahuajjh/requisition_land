package com.tq.requisition.presentation.serviceContract.hptMgt;

import com.tq.requisition.presentation.dto.hpt.PersonAndHPTDto;

/**
 * 购房券和人员的服务契约
 * @author Bless
 * @time 2015-03-16 15：25
 *
 */
public interface IHPTMgtFmlItemServiceContract {
	
	/**
	 * 新增购房券信息
	 * @param dto
	 * 		待新增的购房券信息
	 * @return
	 * 		json
	 */
	String add(PersonAndHPTDto personAndHPTDto);
}
