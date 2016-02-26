package com.tq.requisition.domain.service.idomainservice;

import java.util.UUID;

import com.tq.requisition.exception.InvalidOperationException;

/**
 * ��Ȩ�������ӿ�
 * @author jjh
 * @time 2015-12-24 22:55
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
	 * ��ȡ������Դ��ͬʱ���ݽ�ɫid��ע�ý�ɫ���е�Ȩ�޵���Դ
	 * Json��
	 * [PermissionAtRoleDto...]
	 * @param roleId
	 * 		��ɫid
	 * @return
	 */
	String getAllRescourses(UUID roleId);
}
