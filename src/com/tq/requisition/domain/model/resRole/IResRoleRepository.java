package com.tq.requisition.domain.model.resRole;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.domain.IRepository.IRepository;

/**
 * ��ɫ��Դ�ִ��ӿ�
 * 
 * @author jjh
 * @time 2015-12-21 21:19
 */
public interface IResRoleRepository extends IRepository<ResRole> {
	/**
	 * ���ݽ�ɫID��ȡ��ɫ��ԴID
	 * 
	 * @param roldIds
	 *            ��ɫId����
	 * @return ��ԴID����
	 */
	List<UUID> getResIdsByRoleIds(UUID... roldIds);
	
	/**
	 * �Ƴ�ָ����ɫid�µ�����Ȩ����Դ���÷����������ɾ�����Ϊtrue
	 * @param rId
	 * 		��ɫid
	 * @return int
	 * 		Ӱ��������-1��ʾδ�ҵ���Ӧ��rid
	 */
	int removeAllPermissionByRId(UUID rId);

	/**
	 * Ϊָ���Ľ�ɫ������Դ
	 * @param rid
	 * 		��ɫid
	 * @param resId
	 * 		��Դid
	 */
	void assignRes4Role(UUID rid,UUID resId);
	
	/**
	 * ������ɫid�@ȡ�YԴid����
	 * @param rid
	 * 		��ɫid
	 * @return
	 */
	public List<UUID> getResourcesByRid(UUID rid);
	
}
