package com.tq.requisition.domain.model.socialsecurityType;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.domain.IRepository.IRepository;
import com.tq.requisition.exception.DomainException;

public interface ISocialsecurityTypeRepository extends IRepository<SocialsecurityType>{
	/**
	 * �����籣����
	 * @param entity
	 * 		���������籣����
	 * @return SocialsecurityType
	 * 		��������籣ʵ������
	 */
	SocialsecurityType addType(SocialsecurityType entity) throws DomainException;
	
	List<SocialsecurityType> getAllType();
	
	/**
	 * �༭�籣��������
	 * @param id
	 * 		�籣id
	 * @param name
	 * 		�籣����
	 * @throws DomainException
	 * 		ҵ���쳣
	 */
	void editType(UUID id,String name) throws DomainException;

	/**
	 * ����ΨһԼ���ֶλ�ȡ��¼��id
	 * @param name
	 * 		�ֶ�����
	 * @return UUID
	 * 		����id
	 */
	UUID getIdByName(String name);
}
