package com.tq.requisition.domain.model.socialsecurity;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.domain.IRepository.IRepository;
import com.tq.requisition.exception.SpecifiedObjectDoesNotExistsException;
import com.tq.requisition.infrastructure.utils.PageFormater;
import com.tq.requisition.presentation.dto.share.PageModel;
import com.tq.requisition.presentation.dto.socialsecurityMgt.SocialsecurityQueryModel;

/**
 * �籣�ִ��ӿ�
 * @author jjh
 * @time 2015-12-31 20:26
 */
public interface ISocialsecurityRepository extends IRepository<SocialsecurityInfo>{
	/**
	 * �����籣��Ϣ
	 * @param ss
	 * 		���������籣��Ϣ
	 */
	void addSS(SocialsecurityInfo ss) throws SpecifiedObjectDoesNotExistsException ;
	
	/**
	 * ���������籣����
	 * @param list
	 * 		���������籣��������
	 */
	void addBatch(List<SocialsecurityInfo> list) throws SpecifiedObjectDoesNotExistsException;
	
	/**
	 * ����ָ����idɾ���籣��Ϣʵ��
	 * @param uuids
	 * 		��ɾ����id����
	 */
	void deleteSS(UUID... uuids);
	
	/**
	 * �༭ָ�����籣��Ϣ
	 * @param ss
	 * 		�����µ��籣ʵ��
	 */
	void editSS(SocialsecurityInfo ss) throws SpecifiedObjectDoesNotExistsException;
	
	/**
	 * ��ҳ��ѯ�籣����̨��,̨�˲�ѯ
	 * @param queryModel
	 * 		��ѯmodel
	 * @param pageModel
	 * 		��ҳmodel
	 * @return
	 */
	PageFormater query4TableByFuzzy(SocialsecurityQueryModel queryModel,PageModel pageModel);

	/**
	 * �����籣����ʱ�Ĳ�ѯ����ҳ��ѯ�籣����̨��
	 * @param queryModel
	 * 		��ѯmodel
	 * @param pageModel
	 * 		��ҳmodel
	 * @return
	 */
	PageFormater query4AddByFuzzy(SocialsecurityQueryModel queryModel,PageModel pageModel);
}
