package com.tq.requisition.presentation.serviceContract.sysManagement;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.presentation.dto.sysMgt.RoleDto;

/**
 * ��ɫ������Լ�ӿ�
 * @author jjh
 * @time 2015-12-24 9:38
 */
public interface IRoleService {	
	/**
	 * ������ɫ -
	 * @param dto
	 * ��ɫdto
	 */
	String addRole(RoleDto dto);
	
	/**
	 * �޸Ľ�ɫ
	 * @param dto
	 * 		���޸ĵĽ�ɫdto
	 */
	String updateRole(RoleDto dto);
	
	/**
	 * ��ȡ��ɫ�б�
	 * * 		{
	 * 			datas:[roledto...],
	 * 			totalCount:�ܼ�¼��
	 * 		}
	 * @param name ��ɫ���ƣ��ջ���null��ʾ��ѯ���н�ɫ
	 * @param pageIndex ҳ��
	 * @param pageNum ÿҳ��ʾ������
	 * @return String
	 * 		json��ʽ����
	 */
	String getListJson(String name,int pageIndex,int pageNum);
	
	/**
	 * ɾ����ɫ
	 * @param roleId ��ɫ���
	 * @return
	 */
	String deleteRole(UUID roleId);

	/**
	 * ��ȡ��ɫ�б�
	 * @return String
	 * 		json���ݽ��
	 */
	String getRoleListJson();
	
	/**
	 * ��ȡ��ɫ�б�
	 * @return List<RoleDto>
	 * 		��ɫdto����
	 */
	List<RoleDto> getRoleList();
}
