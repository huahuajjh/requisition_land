package com.tq.requisition.presentation.serviceContract.rmHousehold;

import java.util.UUID;

import com.tq.requisition.domain.model.removeFamily.Family;
import com.tq.requisition.infrastructure.utils.PageFormater;
import com.tq.requisition.presentation.dto.rmHousehold.FamilyDto;
import com.tq.requisition.presentation.dto.rmHousehold.FamilyItemDto;
import com.tq.requisition.presentation.dto.rmHousehold.FamilyQueryModel;
import com.tq.requisition.presentation.dto.share.PageModel;

/**
 * ��Ǩ������ҵ��ӿ���Լ
 * 
 * @author jjh
 * @time 2015-12-28 18:04
 */
public interface IFamilyMgtServiceContract {
	/**
	 * ¼���Ǩ����ͥ��Ϣ�����ҷ���������ļ�ͥ�����ݣ���ʽΪjson
	 * @param fml
	 * @return json String
	 */
	String addFamily(FamilyDto fml);
	
	/**
	 * Ĭ�ϵļ�ͥ����Ϣ��ѯ������list���ݣ����ڲ�ѯmodel�ͷ�ҳmodel
	 * @return
	 */
	PageFormater queryFmlsList(FamilyQueryModel queryModel,PageModel pageModel);
	
	/**
	 * ���ڷ�ҳmodel�Ͳ�ѯmodel��ѯ����Ϣ���ݣ�����json����
	 * @param queryModel
	 * 		��ѯmodel
	 * @param pageModel
	 * 		��ҳmodel
	 * @return
	 */
	String queryFmlByFuzzy(FamilyQueryModel queryModel,PageModel pageModel);
	
	/**
	 * �޸ļ�ͥ����Ϣ
	 * @param fml
	 * 		����Ϣmodel
	 * @return json String
	 */
	String editFml(FamilyDto fml);
	
	/**
	 * ɾ������Ϣ
	 * @param id
	 * 		��ͥ����Ϣid
	 * @return json String
	 */
	String deleteFml(UUID id);	
	
	/**
	 * �����Ǩ����Ϣ
	 * @param dto
	 * 		��Ǩ��entity
	 * @return String
	 * 		json
	 */
	String importFml(Family dto);
	
	/**
	 * ��ӡ��Ǩ��
	 * @param uuids
	 * 		��Ǩ��id�ַ�������ʽ-'id','id','id'
	 * @return String
	 * 		json
	 */
	String getFml4Print(String uuids);
	
	/**
	 * ���ݲ�Ǩ��id��ȡ��Ǩ����Ϣ,����������Ա��Ϣ
	 * @param id
	 * 		��Աid
	 * @return String
	 * 		json
	 */
	String getFmlByItemId(UUID id);
	
	/**
	 * ��ȡ��Ŀ������Ϣ
	 * @param queryModel
	 * 		��ѯmodel
	 * @param pageModel
	 * 		��ҳmodel
	 * @return String
	 * 		json
	 */
	String getFml4HPT(FamilyQueryModel queryModel,PageModel pageModel);
}

