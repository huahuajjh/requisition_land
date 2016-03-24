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
 * ��Ȩ�������
 * @author jjh
 * @time 2015-12-24 23:12
 */
public class PermissionService implements IPermissionService{
	/*private fields*/
	/*��ɫ�~�����g�}��*/
	private IRoleAccountRepository roleAccountRepository;
	/*�YԴ��ɫ���g�}��-���ޱ�*/
	private IResRoleRepository resRoleRepository;
	/*�}��������*/
	private IRepositoryContext repositoryContext;
	/*�YԴ�}��*/
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
			throw new NullPointerException("��ɫid����Ϊnull��rIds=null");
		}
		
		//��ո��˻�id�µ����н�ɫ
		roleAccountRepository.removeAllRelationships(id);		
		
		//����������Ľ�ɫ
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
			throw new NullPointerException("��ɫid����Ϊnull��rIds=null");
		}
		//��ոý�ɫ�µ�������Դ�б�
		resRoleRepository.removeAllPermissionByRId(rid);
		
		//Ϊ��ɫ�����µ���Դ
		for (int i = 0; i < resIds.length; i++) {
			resRoleRepository.assignRes4Role(rid, resIds[i]);
		}
		repositoryContext.commit();
	}
	
	@Override
	public String getAllRescourses(UUID roleId) {
		//�@ȡ�����YԴ����
		List<Resource> resources = resourceRepository.getAllResources();
		//dto����
		List<PermissionAtRoleDto> p = new ArrayList<PermissionAtRoleDto>();
		//���YԴ�����D�Q��dto����
		for (Resource resource : resources) {
			PermissionAtRoleDto dto = new PermissionAtRoleDto();
			dto.setId(resource.getId());
			dto.setName(resource.getTitle());
			dto.setExpansion(resource.getChildren());
			dto.setPid(resource.getParentResourceId());
			dto.setOrder(resource.getOrder());
			p.add(dto);
		}
		//������ɫid�@ȡ����е������YԴ����
		List<UUID> ids = resRoleRepository.getResourcesByRid(roleId);
		//ӳ��ɂ����ϣ�����ɫ���еę��޵��YԴ���]��true
		for (UUID uuid : ids) {
			for (PermissionAtRoleDto permissionAtRoleDto : p) {
				if(permissionAtRoleDto.getId().equals(uuid))
				{
					permissionAtRoleDto.setPermission(true);
				}
			}
		}
		return Serialization.toJson(Formater.obtain("�@ȡ�YԴ�ɹ�", p, Formater.OperationResult.SUCCESS));
	}

}
