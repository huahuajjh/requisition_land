package com.tq.requisition.domain.service.idomainservice;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.domain.model.resource.Resource;

/**
 * 
 * @author Administrator
 *
 */
public interface IAuthorizeService {

	/**
	 * ��ȡ�û���ӵ�е���Դ
	 * 
	 * @param userId
	 *            �û�DI
	 * @param hierarchy
	 *            ��Դ�㼶
	 * @return ��Դ����
	 */
	List<Resource> getResourceByUserId(UUID userId, int hierarchy);
}
