package com.tq.requisition.presentation.serviceContract.sysManagement;

import java.util.UUID;

import com.tq.requisition.exception.InvalidOperationException;

/**
 * Ȩ�޷�����Լ�ӿ�
 * @author jjh
 * @time 2015-12-24 21:34
 */
public interface IPermissionService {
	/**
	 * Ϊָ�����˻�ָ�ɽ�ɫ
	 * @param id
	 * 		�˻�id
	 * @param rids
	 * 		��ɫid����
	 */
	void assignRole4User(UUID id,UUID...rIds) throws InvalidOperationException;
	
	/**
	 * Ϊָ���Ľ�ɫ������Դ
	 * @param rid
	 * 		��ɫid
	 * @param resIds
	 * 		��Դid����
	 */
	void assignRes4Role(UUID rid,UUID...resIds) throws InvalidOperationException;
	
	/**
	 * Ϊָ���Ľ�ɫ������Դ
	 * @param rid
	 * 		��ɫid
	 * @param resIds
	 * 		��Դid����
	 */
	String assignResForRole(UUID rid,UUID...resIds);
	
	/**
	 * ��ȡ������Դ��ͬʱ���ݽ�ɫid��ע�ý�ɫ���е�Ȩ�޵���Դ
	 * Json��
	 * [PermissionAtRoleDto...]
	 * @param roleId
	 * 		��ɫid
	 * @return
	 */
	String getAllRescourses(UUID roleId);

}
