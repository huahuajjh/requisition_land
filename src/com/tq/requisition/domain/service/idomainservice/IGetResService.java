package com.tq.requisition.domain.service.idomainservice;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.domain.model.resource.Resource;

public interface IGetResService {

//	/**
//	 * ��ȡ�û���ӵ�е���Դ
//	 * 
//	 * @param userId
//	 *            �û�DI
//	 * @param hierarchy
//	 *            ��Դ�㼶
//	 * @return ��Դ����
//	 */
//	List<Resource> getResourceByUserId(UUID userId, int hierarchy);
//
//	/**
//	 * ��ȡ�û���ӵ�е���Դ
//	 * 
//	 * @param userId
//	 *            �û�DI
//	 * @param hierarchy
//	 *            ��Դ�㼶
//	 * @param ResourceType
//	 *            ��Դ����
//	 * @return ��Դ����
//	 */
//	List<Resource> getResourceByUserId(UUID userId, ResourceType type,
//			int hierarchy);
//	
	/**
	 * �����û���ȡ��Դ
	 * @param uid
	 * @return
	 */
	List<Resource> getResByUserId(UUID uid);
}
