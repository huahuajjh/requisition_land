package com.tq.requisition.application.sysManagement;

import java.util.UUID;

import com.tq.requisition.application.BaseApplication;
import com.tq.requisition.domain.IRepository.IRepositoryContext;
import com.tq.requisition.exception.InvalidOperationException;
import com.tq.requisition.presentation.serviceContract.sysManagement.IPermissionService;

/**
 * Ȩ�޹���
 * @author jjh
 * @time 2015-12-24 22:14
 */
public class PermissionServiceImpl extends BaseApplication implements IPermissionService{	
	private com.tq.requisition.domain.service.idomainservice.IPermissionService pmsService;

	public PermissionServiceImpl(IRepositoryContext context,com.tq.requisition.domain.service.idomainservice.IPermissionService _pmsService) {		
		super(context);
		pmsService = _pmsService;
	}

	@Override
	public void assignRole4User(UUID id, UUID... rIds)  throws InvalidOperationException{
		pmsService.assignRole4User(id, rIds);
	}

	@Override
	public void assignRes4Role(UUID rid, UUID... resIds)  throws InvalidOperationException{
		context().beginTransaction();
		pmsService.assignRes4Role(rid, resIds);
		context().commit();
	}

	@Override
	public String assignResForRole(UUID rid, UUID... resIds) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getAllRescourses(UUID roleId) {
		return pmsService.getAllRescourses(roleId);
	}

}
