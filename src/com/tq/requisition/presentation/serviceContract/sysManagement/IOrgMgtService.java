package com.tq.requisition.presentation.serviceContract.sysManagement;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.presentation.dto.sysMgt.OrgDto;

/**
 * ��֯������Լ�ӿ�
 * 
 * @author jjh
 * @time 2015-12-23 17:51
 */
public interface IOrgMgtService {
	/**
	 * ������֯
	 * 
	 * @param org
	 *            ��֯Dto����
	 * @return
	 */
	String addOrg(OrgDto org);

	/**
	 * �޸���֯��Ϣ
	 * 
	 * @param org
	 * @return
	 */
	String editOrgInfo(OrgDto org);

	/**
	 * ɾ����֯
	 * 
	 * @param id
	 *            ��֯��ʶ
	 */
	String deleteByOrgKey(UUID orgId);

	/**
	 * ��ȡ��֯DTO��������
	 * 
	 * @return ����DTO�б�
	 */
	List<OrgDto> getOrgList();

	/**
	 * ��ȡ��֯DTO����Json��������
	 * json��[OrgDto...]
	 * @return Json����
	 */
	String getOrgListJson();

}
