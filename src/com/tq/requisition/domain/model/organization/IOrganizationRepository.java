package com.tq.requisition.domain.model.organization;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.domain.IRepository.IRepository;
import com.tq.requisition.exception.DomainException;
import com.tq.requisition.exception.InvalidOperationException;

/**
 * ��֯�ۺϲִ��ӿ�
 * 
 * @author jjh
 * @time 2015-12-21 15:01
 */
public interface IOrganizationRepository extends IRepository<Organization> {
	/**
	 * ���һ����֯�����Ƿ�Ψһ
	 * 
	 * @param orgName
	 *            ��֯����
	 * @return boolean ����һ��booleanֵ����������֯ÿ���Ƿ���Ψһ��
	 */
	boolean isOrgNameUnique(String orgName);

	/**
	 * ������֯����
	 * 
	 * @param org
	 *            ��֯����
	 * @return TODO
	 * @throws InvalidOperationException
	 *             �����쳣
	 */
	Organization createOrg(Organization org) throws DomainException;

	/**
	 * �޸���֯��Ϣ
	 * 
	 * @param org
	 *            ��֯����
	 * @throws InvalidOperationException
	 *             �����쳣
	 */
	void editOrg(Organization org) throws DomainException;

	/**
	 * ��ȡ��֯���ݼ���
	 * 
	 * @return ��֯���ݼ���
	 */
	List<Organization> getOrgList();
	
	/**
	 * ������֯IDɾ����֯
	 * @param orgId ������֯IDɾ����֯
	 */
	void deleteOrgByKey(UUID orgId);
}
