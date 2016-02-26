package com.tq.requisition.domain.model.role;

import java.util.List;

import com.tq.requisition.domain.IRepository.IRepository;
import com.tq.requisition.exception.InvalidOperationException;
import com.tq.requisition.infrastructure.utils.Formater;
import com.tq.requisition.infrastructure.utils.TotalCount;

/**
 * ��ɫ�ִ��ӿ�
 * 
 * @author jjh
 * @time 2015-12-21 13:16
 * 
 */
public interface IRoleRepository extends IRepository<Role> {
	/**
	 * ������ɫ
	 * @param dto
	 * ��ɫdto
	 */
	Formater createRole(Role role) throws InvalidOperationException;
	
	/**
	 * ���ݽ�ɫ���ƻ�ȡ��ɫ�б�ģ����ѯ
	 * @param name
	 * 		��ɫ��
	 * @param pageIndex
	 * 		��ʼҳ
	 * @param pageNum
	 * 		ҳ��
	 * @param totalCount TODO
	 * @return List<RoleDto>
	 * 		��ɫ����
	 */
	List<Role> getRoleList(String name, int pageIndex, int pageNum, TotalCount totalCount);

	/**
	 * �޸Ľ�ɫ
	 * @param dto
	 * 		���޸ĵĽ�ɫdto
	 */
	Formater	modifyRole(Role role) throws InvalidOperationException;
	
	/**
	 * ���ݽ�ɫ���ƻ�ȡ��ɫ
	 * @param roleName
	 * 		��ɫ����
	 * @return RoleDto
	 * 		��ɫdto����
	 */
	Role getRoleByName(String roleName);

	/**
	 * ��ȡ���н�ɫ
	 * @return
	 */
	List<Role> getAllRole();
}
