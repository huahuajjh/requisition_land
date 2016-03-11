package com.tq.requisition.presentation.serviceContract.socialsecurityMgt;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.domain.model.socialsecurity.SocialsecurityInfo;
import com.tq.requisition.infrastructure.utils.PageFormater;
import com.tq.requisition.presentation.dto.share.PageModel;
import com.tq.requisition.presentation.dto.socialsecurityMgt.NewSocialsecurityDto;
import com.tq.requisition.presentation.dto.socialsecurityMgt.SocialsecurityQueryModel;
import com.tq.requisition.presentation.dto.socialsecurityMgt.SsImportAndExportDto;

/**
 * �籣����ӿ�
 * @author jjh
 * @time 2015-12-30 17:39
 */
public interface ISocialsecurityMgtServiceContract {
	/**
	 * ¼���籣��Ϣ
	 * @param dto
	 * 		�籣��Ϣdto
	 * @return
	 * 		��������籣��Ϣ
	 */
	String addSSInfo(NewSocialsecurityDto dto);
	
	/**
	 * ���������籣����
	 * @param list
	 * 		���������籣��������
	 * @return
	 */
	String addBatch(List<NewSocialsecurityDto> list);
	
	/**
	 * ���ݲ�ѯmodel��ѯ����
	 * @param queryModel
	 * 		��ѯmodel
	 * @param pageModel
	 * 		��ҳmodel
	 * @return
	 */
	PageFormater queryFuzzyByAdd(SocialsecurityQueryModel queryModel,PageModel pageModel);
	
	/**
	 * ���ݲ�ѯmodel��ѯ����
	 * @param queryModel
	 * 		��ѯmodel
	 * @param pageModel
	 * 		��ҳmodel
	 * @return
	 */
	String queryFuzzyByAddJson(SocialsecurityQueryModel queryModel,PageModel pageModel);
	
	/**
	 * ̨�˲�ѯ�ӿ�
	 * @param queryModel
	 * 		��ѯmodel
	 * @param pageModel
	 * 		��ҳmodel
	 * @return
	 * 		̨��dto����
	 */
	PageFormater query4TableListByFuzzy(SocialsecurityQueryModel queryModel,PageModel pageModel);
	
	/**
	 * ̨�˲�ѯ�ӿ�
	 * @param queryModel
	 * 		��ѯmodel
	 * @param pageModel
	 * 		��ҳmodel
	 * @return
	 * 		̨��dto json����
	 */
	String query4TableByFuzzy(SocialsecurityQueryModel queryModel,PageModel pageModel);
	
	/**
	 * �༭�籣��Ϣ
	 * @param dto
	 * 		�����µ��籣����
	 * @return
	 */
	String editSS(NewSocialsecurityDto dto);
	
	/**
	 * ɾ��ָ���籣id������
	 * @param uuids
	 * 		��ɾ����id����
	 * @return
	 */
	String deleteSS(UUID... uuids);
	
	/**
	 * �����籣��Ϣ
	 * @param list
	 * 		�籣����
	 * @return String
	 * 		json
	 */	
	String importSS(List<SsImportAndExportDto> items);
}
