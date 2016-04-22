package com.tq.requisition.domain.model.familyMember;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.domain.IRepository.IRepository;
import com.tq.requisition.exception.SpecifiedObjectDoesNotExistsException;
import com.tq.requisition.infrastructure.utils.PageFormater;
import com.tq.requisition.presentation.dto.rmHousehold.FamilyItemDto;
import com.tq.requisition.presentation.dto.rmHousehold.FamilyItemQueryModel;
import com.tq.requisition.presentation.dto.share.PageModel;

public interface IFamilyItemRepository extends IRepository<FamilyItem>{
	
	/**
	 * ¼���Ǩ����ͥ��Ա��Ϣ
	 * @param fid
	 * @return
	 */
	FamilyItem addFamilyItem(FamilyItem item);
	
	/**
	 * ģ����ѯ
	 * @param queryModel
	 * 		ģ����ѯmodel
	 * @param pageModel
	 * 		��ҳmodel
	 * @return
	 */
	PageFormater queryByFuzzy(FamilyItemQueryModel queryModel,PageModel pageModel);
	
	/**
	 * �༭��Ǩ����Ա��Ϣ
	 * @param item
	 * 		��Ǩ����Աʵ��
	 */
	FamilyItem editFamilyItem(FamilyItem item);
	
	/**
	 * ɾ����Ǩ����Ա��Ϣ
	 * @param id
	 * 		��ɾ��������ʵ��id
	 */
	void deleteFamilyItem(UUID id);
	
	/**
	 * �������֤��ȡ��Ǩ����Ա��Ϣ
	 * @param idNumber
	 * 		���֤
	 * @return
	 */
	FamilyItem queryByIdNumber(String idNumber) throws SpecifiedObjectDoesNotExistsException;

	/**
	 * �������֤��������ѯ�Ƿ���ڸò�Ǩ����Ա��¼
	 * @param idNumber
	 * 		���֤
	 * @param name
	 * 		����
	 * @return
	 * 		����һ��Booleanֵ�������ڸü�¼ʱ����true�����򷵻�false
	 */
	boolean existsByIdNumAndName(String idNumber,String name);

	/**
	 * ���ݲ�Ǩ��id��ѯ��Ǩ����Ա��Ϣ
	 * @param fmlId
	 * 		��Ǩ��id
	 * @return
	 * 		��Ǩ����Ա��������
	 */
	List<FamilyItem> queryItemsByFmlId(UUID fmlId);
	
	/**
	 * ������ĿID��ȡ��Ա�б�
	 * @param proId
	 * 		��ĿID
	 * @return
	 */
	List<FamilyItem> queryItemsByProName(String proName);
	
	/**
	 * �������֤��������ѯ��Ǩ��Ա��Ϣ
	 * @param idNumber
	 * 		���֤
	 * @param name
	 * 		����
	 * @return FamilyItem
	 * 		��Ǩ��Ա��Ϣ
	 */
	FamilyItem queryByIdNumberAndName(String idNumber,String name);
	
	/**
	 * �������֤��ѯid
	 * @param idnumber
	 * 		���֤
	 * @return UUID
	 * 		id
	 */
	UUID getIdByIdNumber(String idnumber);

}
