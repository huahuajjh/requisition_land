package com.tq.requisition.domain.model.removeFamily;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.domain.IRepository.IRepository;
import com.tq.requisition.infrastructure.utils.PageFormater;
import com.tq.requisition.presentation.dto.rmHousehold.FamilyQueryModel;
import com.tq.requisition.presentation.dto.share.PageModel;

/**
 * ��Ǩ���ۺϸ��ӿ�
 * @author jjh
 * @time 2015-12-28 2:26
 */
public interface IFamilyRepository extends IRepository<Family>{
	/**
	 * ������Ǩ��
	 * @param fml
	 * 		�������Ĳ�Ǩ��
	 * @return
	 * 		������Ĳ�Ǩ��
	 */
	Family addFamily(Family fml);
	
	/**
	 * ���ݲ�ѯģ�Ͳ�ѯ��Ǩ������
	 * @param queryModel
	 * 		��ѯģ��
	 * @param pageModel
	 * 		��ҳģ��
	 * @return PageFormater
	 * 		pageģ��
	 */
	PageFormater getListByFuzzy(FamilyQueryModel queryModel,PageModel pageModel);
	
	/**
	 * �༭��Ǩ������
	 * @param fml
	 */
	Family editFamily(Family fml);
	
	/**
	 * ɾ����Ǩ����Ϣ
	 * @param id
	 * 		��Ǩ��id
	 */
	void deleteFamily(UUID id);
	
	/**
	 * ����id���ϻ�ȡ����Ϣ����
	 * @param uuids
	 * 		id����
	 * @return List<Family>
	 * 		������
	 */
	List<Family> getFml4Print(String uuids);
	
	/**
	 * ��ѯ��Ǩ��������Ϣ����
	 * @param queryModel
	 * 		��ѯmodel
	 * @param pageModel
	 * 		��ҳmodel
	 * @return List<FamilyBasicInfoDto>
	 * 		List<FamilyBasicInfoDto>
	 */
	PageFormater getFmlBasicInfo(FamilyQueryModel queryModel,PageModel pageModel);
}
