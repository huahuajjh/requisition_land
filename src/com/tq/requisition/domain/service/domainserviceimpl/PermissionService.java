package com.tq.requisition.domain.service.domainserviceimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.tq.requisition.domain.IRepository.IRepositoryContext;
import com.tq.requisition.domain.model.resRole.IResRoleRepository;
import com.tq.requisition.domain.model.resRole.ResRole;
import com.tq.requisition.domain.model.resource.IResourceRepository;
import com.tq.requisition.domain.model.resource.Resource;
import com.tq.requisition.domain.model.roleAccount.IRoleAccountRepository;
import com.tq.requisition.domain.model.roleAccount.RoleAccount;
import com.tq.requisition.domain.service.idomainservice.IPermissionService;
import com.tq.requisition.exception.InvalidOperationException;
import com.tq.requisition.infrastructure.utils.Formater;
import com.tq.requisition.infrastructure.utils.Serialization;
import com.tq.requisition.presentation.dto.sysMgt.PermissionAtRoleDto;

/**
 * 授权管理服务
 * @author jjh
 * @time 2015-12-24 23:12
 */
public class PermissionService implements IPermissionService{
	/*private fields*/
	/*角色賬戶中間倉儲*/
	private IRoleAccountRepository roleAccountRepository;
	/*資源角色中間倉儲-權限表*/
	private IResRoleRepository resRoleRepository;
	/*倉儲上下文*/
	private IRepositoryContext repositoryContext;
	/*資源倉儲*/
	private IResourceRepository resourceRepository;
	
	/*construtors*/
	public PermissionService(IRoleAccountRepository roleAccountRepository,
			IResRoleRepository resRoleRepository,
			IRepositoryContext repositoryContext,
			IResourceRepository resourceRepository) {
		super();
		this.roleAccountRepository = roleAccountRepository;
		this.roleAccountRepository.setAggregatorRootClass(RoleAccount.class);
		
		this.resRoleRepository = resRoleRepository;
		this.resRoleRepository.setAggregatorRootClass(ResRole.class);
		
		this.repositoryContext = repositoryContext;
		
		this.resourceRepository = resourceRepository;
		this.resourceRepository.setAggregatorRootClass(Resource.class);
	}

	@Override
	public void assignRole4User(UUID id, UUID... rIds)
			throws InvalidOperationException {
		repositoryContext.beginTransaction();
		if(rIds==null)
		{
			throw new NullPointerException("角色id数组为null，rIds=null");
		}
		
		//清空该账户id下的所有角色
		roleAccountRepository.removeAllRelationships(id);		
		
		//新增待插入的角色
		for (int i = 0; i < rIds.length; i++) {
			roleAccountRepository.createRelationship(id, rIds[i]);
		}
		repositoryContext.commit();
	}

	@Override
	public void assignRes4Role(UUID rid, UUID... resIds)
			throws InvalidOperationException {
		repositoryContext.beginTransaction();
		if(resIds==null)
		{
			throw new NullPointerException("角色id数组为null，rIds=null");
		}
		//清空该角色下的所有资源列表
		resRoleRepository.removeAllPermissionByRId(rid);
		
		//为角色分配新的资源
		for (int i = 0; i < resIds.length; i++) {
			resRoleRepository.assignRes4Role(rid, resIds[i]);
		}
		repositoryContext.commit();
	}
	
	@Override
	public String getAllRescourses(UUID roleId) {
		//獲取所有資源集合
		List<Resource> resources = resourceRepository.getAllResources();
		//dto集合
		List<PermissionAtRoleDto> p = new ArrayList<PermissionAtRoleDto>();
		//將資源集合轉換為dto集合
		for (Resource resource : resources) {
			PermissionAtRoleDto dto = new PermissionAtRoleDto();
			dto.setId(resource.getId());
			dto.setName(resource.getTitle());
			dto.setExpansion(resource.getChildren());
			dto.setPid(resource.getParentResourceId());
			dto.setOrder(resource.getOrder());
			p.add(dto);
		}
		//根據角色id獲取其具有的所有資源集合
		List<UUID> ids = resRoleRepository.getResourcesByRid(roleId);
		//映射兩個集合，將角色具有的權限的資源標註為true
		for (UUID uuid : ids) {
			for (PermissionAtRoleDto permissionAtRoleDto : p) {
				if(permissionAtRoleDto.getId().equals(uuid))
				{
					permissionAtRoleDto.setPermission(true);
				}
			}
		}
		return Serialization.toJson(Formater.obtain("獲取資源成功", p, Formater.OperationResult.SUCCESS));
	}

}
