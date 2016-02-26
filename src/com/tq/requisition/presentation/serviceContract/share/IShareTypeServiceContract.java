package com.tq.requisition.presentation.serviceContract.share;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.presentation.dto.share.HouseholdTypeDto;
import com.tq.requisition.presentation.dto.share.RelationshipTypeDto;
import com.tq.requisition.presentation.dto.share.SocialsecurityTypeDto;

/**
 * �ֶ����ͽӿ�
 * @author jjh
 * @time 2015-12-29 17:53
 *
 */
public interface IShareTypeServiceContract {
	/**
	 * ��ȡ���л������ͣ�����json����
	 * @return
	 */
	String getAllHouseholdType();
	
	/**
	 * ��ȡ�����뻧����ϵ���ϣ�����json����
	 * @return
	 */
	String getAllRelationshipType();
	
	/**
	 * ��ȡ�����籣���ͼ��ϣ�����json����
	 * @return
	 */
	String getAllSocialsecurityType();
		
	/**
	 * ��ȡ���л������ͼ���
	 * @return
	 */
	List<HouseholdTypeDto> getAllHouseholdTypeList();
	
	/**
	 * ��ȡ�����뻧����ϵ����
	 * @return
	 */
	List<RelationshipTypeDto> getAllRelationshipTypeList();
	
	/**
	 * ��ȡ�����籣���ͼ���
	 * @return
	 */
	List<SocialsecurityTypeDto> getAllSocialsecurityTypeList();
	
	/**
	 * ɾ���籣����
	 * @param id
	 * 		�籣id
	 * @return String
	 * 		json
	 */
	String delSSType(UUID id);
	
	/**
	 * ɾ���뻧����ϵ����
	 * @param id
	 * 		����id
	 * @return String
	 * 		json
	 */
	String delRelationshipType(UUID id);
	
	/**
	 * ɾ����������
	 * @param id
	 * 		����id
	 * @return String
	 * 		json
	 */
	String delHouseholdType(UUID id);
	
	/**
	 * �༭�籣����
	 * @param id
	 * 		�籣id
	 * @param name
	 * 		��������
	 * @return String
	 * 		json
	 */
	String editSSType(UUID id,String name);
	
	/**
	 * �༭�뻧����ϵ����
	 * @param id
	 * 		��ϵid
	 * @param name
	 * 		��������
	 * @return String
	 * 		json
	 */
	String editRelationshipType(UUID id,String name);
	
	/**
	 * �༭��������
	 * @param id
	 * 		����id
	 * @param name
	 * 		��������
	 * @return String
	 * 		json
	 */
	String editHouseholdType(UUID id,String name);
	
	/**
	 * �����籣����
 	 * @param name
 	 * 		�籣����
	 * @return String
	 * 		json
	 */
	String addSSType(String name);
	
	/**
	 * ������������
 	 * @param name
 	 * 		��������
	 * @return String
	 * 		json
	 */
	String addHouseholdType(String name);
	
	/**
	 * �����뻧����ϵ����
 	 * @param name
 	 * 		��ϵ����
	 * @return String
	 * 		json
	 */
	String addRelationshipType(String name);
}
