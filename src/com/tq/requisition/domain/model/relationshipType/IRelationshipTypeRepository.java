package com.tq.requisition.domain.model.relationshipType;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.domain.IRepository.IRepository;
import com.tq.requisition.exception.DomainException;

public interface IRelationshipTypeRepository extends IRepository<RelationshipType>{
	/**
	 * ������ϵ����
	 * @param entity
	 * 		�������Ĺ�ϵ����ʵ��
	 * @return RelationshipType
	 * 		������Ĺ�ϵ����ʵ��
	 */
	RelationshipType addType(RelationshipType entity) throws DomainException;
	
	List<RelationshipType> getAllType();
	
	/**
	 * �༭�뻧����ϵ����
	 * @param id
	 * 		��ϵid
	 * @param name
	 * 		��ϵ����
	 */
	void editType(UUID id,String name) throws DomainException;
	
	/**
	 * �������ƻ�ȡid
	 * @param name
	 * 		��ϵ����
	 * @return UUID
	 * 		UUID
	 */
	UUID getIdByName(String name);
}
