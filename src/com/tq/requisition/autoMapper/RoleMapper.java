package com.tq.requisition.autoMapper;

import com.tq.requisition.domain.model.role.Role;
import com.tq.requisition.presentation.dto.sysMgt.RoleDto;

/**
 * role�ۺϸ���dtoת����,���಻�ܱ��̳�
 * @author jjh
 * @time 2015-12-24 9:43
 */
public final class RoleMapper {
	/**
	 * role dtoתrole����ʵ��
	 * @param RoleDto
	 * 		��ת����role dto
	 * @return role
	 * 		����role����ʵ��
	 */
	public static Role dto2Model(RoleDto dto){		
		Role role = new Role();
		role.setId(dto.getId());
		role.setDel(false);
		role.setRoleName(dto.getName());
		return role;
	}
	
	/**
	 * role����ʵ��תrole dto
	 * @param Role
	 * 		��ת����role
	 * @return RoleDto
	 * 		����RoleDto
	 */
	public static RoleDto model2Dto(Role model){
		return new RoleDto(model.getRoleName(),model.getId());
	}
}
