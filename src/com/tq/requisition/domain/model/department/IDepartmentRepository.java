package com.tq.requisition.domain.model.department;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.domain.IRepository.IRepository;
import com.tq.requisition.exception.DomainException;

/**
 * ���žۺϲִ�
 * 
 * @author jjh
 * @time 2015-12-21 16��38
 */
public interface IDepartmentRepository extends IRepository<Department>{
	
	/**
	 * ������֯id��������Ĳ��������Ƿ�Ψһ
	 * @param orgId
	 * 		��֯id
	 * @param deptName
	 * 		��������
	 * @return boolean
	 * 		����һ��booleanֵ�������ò��������Ƿ��ڵ�ǰ��֯����Ψһ��
	 */
	boolean isDeptNameUnique(UUID orgId,String deptName);
	
	/**
	 * ��ָ������֯���洴���䲿�ţ��ò������ڸ���֯
	 * @param dept
	 * 		�������Ĳ��T���w
	 * 		�M��id
	 * @return TODO
	 */
	Department createDept(Department dept) throws DomainException;
	
	/**
	 * �޸Ĳ���ʵ��
	 * @param dept
	 * 		���޸ĵĲ���ʵ��
	 */
	void modifyDept(Department dept) throws DomainException;
	
	/**
	 * ������֯id��ȡ���ż���
	 * @param orgId
	 * 		��֯id
	 * @return List<Department>
	 * 		���ż���
	 */
	List<Department> getDeptByOrgId(UUID orgId);
	
	/**
	 * ����idɾ��ָ���Ĳ���
	 * @param deptId
	 * 		����id
	 */
	void removeDept(UUID deptId);
}
