package com.tq.requisition.application.sysManagement;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.tq.requisition.application.BaseApplication;
import com.tq.requisition.autoMapper.RoleMapper;
import com.tq.requisition.domain.IRepository.IRepositoryContext;
import com.tq.requisition.domain.model.account.Account;
import com.tq.requisition.domain.model.account.IAccountRepository;
import com.tq.requisition.domain.model.role.IRoleRepository;
import com.tq.requisition.domain.model.role.Role;
import com.tq.requisition.infrastructure.utils.Formater;
import com.tq.requisition.infrastructure.utils.PageFormater;
import com.tq.requisition.infrastructure.utils.Serialization;
import com.tq.requisition.infrastructure.utils.TotalCount;
import com.tq.requisition.presentation.dto.sysMgt.RoleDto;
import com.tq.requisition.presentation.serviceContract.sysManagement.IRoleService;

/**
 * ��ɫ��������ʵ��
 * 
 * @author jjh
 * @time 2015-12-24 10:10
 */
public class RoleServiceImpl extends BaseApplication implements IRoleService {
	/* private fields */
	private IRoleRepository roleRepository;
	private IAccountRepository accountRepository;
	
	/* constructors */
	public RoleServiceImpl(IRoleRepository roleRepository,
			IAccountRepository accountRepository,
			IRepositoryContext context) {
		super(context);
		this.roleRepository = roleRepository;
		this.roleRepository.setAggregatorRootClass(Role.class);
		
		this.accountRepository = accountRepository;
		this.accountRepository.setAggregatorRootClass(Account.class);
	}

	@Override
	public String addRole(RoleDto dto) {
		context().beginTransaction();
		Formater formater = roleRepository
				.createRole(RoleMapper.dto2Model(dto));
		context().commit();
		return Serialization.toJson(formater);
	}

	@Override
	public String updateRole(RoleDto dto) {
		context().beginTransaction();
		Formater formater = roleRepository
				.modifyRole(RoleMapper.dto2Model(dto));
		context().commit();
		return Serialization.toJson(formater);
	}

	@Override
	public String getListJson(String name, int pageIndex, int pageNum) {
		TotalCount tc = new TotalCount();
		List<Role> list = roleRepository.getRoleList(name, pageIndex, pageNum,
				tc);
		List<RoleDto> dtoList = new ArrayList<RoleDto>();
		for (Role role : list) {
			dtoList.add(RoleMapper.model2Dto(role));
		}
		String json = Serialization.toJson(Formater.obtain(
				"��ȡ��ɫ�б�ɹ�", //
				PageFormater.obtain(dtoList, tc.getTotalCount()),
				Formater.OperationResult.SUCCESS));
		return json;
	}

	@Override
	public String deleteRole(UUID roleId) {
		context().beginTransaction();
		//��ǽ�ɫ״̬Ϊɾ��
		roleRepository.removeByKey(Role.class, roleId);
		//�����˻��ִ�
		accountRepository.updateRole(roleId);
		//�ύ����
		context().commit();
		return toJson("ɾ����ɫ�ɹ�", null, Formater.OperationResult.SUCCESS);
	}

	@Override
	public String getRoleListJson() {
		return Serialization.toJson(//
				Formater.obtain("�ɹ�",//
						getRoleList(),//
						Formater.OperationResult.SUCCESS));
	}

	@Override
	public List<RoleDto> getRoleList() {
		List<Role> roleList = roleRepository.getAllRole();
		List<RoleDto> dtoList = new ArrayList<>();
		for (Role role : roleList) {
			dtoList.add(RoleMapper.model2Dto(role));
		}
		return dtoList;
	}

}
