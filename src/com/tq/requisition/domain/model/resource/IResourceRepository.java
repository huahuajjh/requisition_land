package com.tq.requisition.domain.model.resource;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.domain.IRepository.IRepository;
import com.tq.requisition.domain.model.share.ResourceType;

/**
 * ��Դ�ۺϸ��ִ�
 * 
 * @author jjh
 * @time 2015-12-21 18��13
 */
public interface IResourceRepository extends IRepository<Resource> {

	/**
	 * ������Դ����ID��ȡ��Դ�б�
	 * 
	 * @param uuids
	 *            ��Դ����
	 * @return ��Դ����
	 */
	List<Resource> getResourceByIds( int hierarchy,UUID... uuids);
	
	List<Resource> getResourcesByIdsAndType(int hierarchy,ResourceType type ,UUID... uuids);

	/**
	 * �@ȡ�����YԴ�б�
	 * ֻ��Ҫ�����ֶΣ��YԴ���Q���YԴid���YԴ�Ƿ����ӹ��c
	 * @return List<Resource>
	 * 		�YԴ����
	 */
	List<Resource> getAllResources();
}
