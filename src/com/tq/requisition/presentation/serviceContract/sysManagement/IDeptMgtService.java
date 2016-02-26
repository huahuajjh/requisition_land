package com.tq.requisition.presentation.serviceContract.sysManagement;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.presentation.dto.sysMgt.DeptDto;

/**
 * ������Լ�ӿ�
 * 
 * @author Bless
 * @version 1.0
 * @time 2015/12/24 14:15
 */
public interface IDeptMgtService {
	/**
	 * ��������
	 * @param dto
	 * 		�������Ĳ���dto
	 * @return
	 * 		json��Ϣ{DeptDto}
	 */
	String createDept(DeptDto dto);
	
	/**
	 * �޸Ĳ���
	 * 
	 * @param dept
	 *            ���޸ĵĲ���ʵ��DTO
	 */
	String edit(DeptDto dept);

	/**
	 * ����ID��ɾ������
	 * 
	 * @param id
	 *            ���ű�ʶ
	 */
	String delete(UUID id);
	
	/**
	 * ������֯ID��ȡ�����б�
	 * 
	 * @param orgId
	 *            ��֯ID
	 * @return �����б�
	 */
	List<DeptDto> getDeptDtoListByOrgId(UUID orgId);
	
	/**
	 * ������֯ID��ȡ�����б�
	 * 
	 * @param orgId
	 *            ��֯ID
	 * @return ����Json�б�
	 */
	String getDeptDtoListByOrgIdToJson(UUID orgId);
}
