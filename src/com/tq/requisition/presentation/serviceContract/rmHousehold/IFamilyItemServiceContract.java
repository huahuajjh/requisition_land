package com.tq.requisition.presentation.serviceContract.rmHousehold;

import java.util.UUID;

import com.tq.requisition.infrastructure.utils.PageFormater;
import com.tq.requisition.presentation.dto.rmHousehold.FamilyItemDto;
import com.tq.requisition.presentation.dto.rmHousehold.FamilyItemQueryModel;
import com.tq.requisition.presentation.dto.share.PageModel;

public interface IFamilyItemServiceContract {
	/**
	 * ����ģ��������ѯmodel��ѯ��Ǩ����Ա��Ϣ������json����
	 * @param queryModel
	 * 		ģ��������ѯmodel
	 * @param pageModel
	 * 		��ҳmodel
	 * @return json String
	 */
	String queryFamilyItemsByFuzzy(FamilyItemQueryModel queryModel,PageModel pageModel);
	
	/**
	 * Ĭ�ϻ�ȡ��Ǩ����Ա��Ϣ�б���,���ڷ�ҳmodel����ѯmodel
	 * @param queryModel
	 * 		��ѯmodel
	 * @param pageModel
	 * 		��ҳmodel
	 * @return
	 * 		��Ǩ����Ա����
	 */
	PageFormater queryFamilyItemListByFuzzy(FamilyItemQueryModel queryModel,PageModel pageModel);
	
	/**
	 * �༭��Ա��Ϣ
	 * @param item
	 * 		��Ա��Ϣmodel
	 * @return
	 */
	String editFmlItem(FamilyItemDto item);
	
	/**
	 * ɾ����Ǩ����Ա��Ϣ
	 * @param id
	 * 		��ɾ���Ĳ�Ǩ����Ա��Ϣ
	 * @return json
	 */
	String deleteFmlItem(UUID id);
	
	/**
	 * �������֤��ȡ��Ǩ����Ա��Ϣ
	 * @param idNumber
	 * 		���֤
	 * @return
	 */
	String queryByIdNumber(String idNumber);
	
	/**
	 * ���ݲ�Ǩ��id��ȡ��Ǩ����Ա�б�
	 * @param id
	 * 		��Ǩ��id
	 * @return
	 */
	String queryByFmlId(UUID id);
	
	/**
	 * ������Ǩ����Ա��Ϣ
	 * @param dto
	 * 		�������Ĳ�Ǩ����Ա��Ϣ
	 * @return
	 * 		������Ĳ�Ǩ����Ա��Ϣ
	 */
	String addFmlItem(FamilyItemDto dto);
	
	/**
	 * �������֤��������ѯ��Ǩ��Ա��Ϣ
	 * @param idNumber
	 * 		���֤
	 * @param name
	 * 		����
	 * @return
	 * 		��Ǩ��Ա��Ϣ
	 */
	String queryByIdNumberAndName(String idNumber,String name);
}
