package com.tq.requisition.domain.model.householdType;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.domain.IRepository.IRepository;
import com.tq.requisition.exception.DomainException;

/**
 * �������ʾۺϸ��ִ��ӿ�
 * @author jjh
 * @time 2015-12-28 0:54
 */
public interface IHouseholdTypeRepository extends IRepository<HouseholdType>{
	/**
	 * ������������
	 * @param model
	 * 		�������Ļ�������
	 * @return HouseholdType
	 * 		������Ļ�������ʵ��
	 */
	HouseholdType addHouseholdType(HouseholdType entity) throws DomainException ;
	
	List<HouseholdType> getAllType();
	
	/**
	 * �༭��������
	 * @param name
	 * 		������������
	 * @param id
	 * 		��������id
	 */
	void editType(UUID id,String name) throws DomainException ;	
}
