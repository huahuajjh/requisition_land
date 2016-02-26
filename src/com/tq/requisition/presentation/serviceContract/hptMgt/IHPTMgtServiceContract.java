package com.tq.requisition.presentation.serviceContract.hptMgt;

import java.util.List;

import com.tq.requisition.presentation.dto.hpt.HPTExchangeInfoDto;
import com.tq.requisition.presentation.dto.hpt.HPTFuzzyQueryModel;
import com.tq.requisition.presentation.dto.hpt.HPTImportAndExport;
import com.tq.requisition.presentation.dto.hpt.HPTLossInfoDto;
import com.tq.requisition.presentation.dto.hpt.HPTMendInfoDto;
import com.tq.requisition.presentation.dto.hpt.HPTQueryModel;
import com.tq.requisition.presentation.dto.hpt.HPTRecevieInfoDto;
import com.tq.requisition.presentation.dto.hpt.HPTUseAndCashInfoDto;
import com.tq.requisition.presentation.dto.hpt.HousePuraseTicketDto;
import com.tq.requisition.presentation.dto.share.PageModel;

/**
 * ����ȯ������Լ
 * @author jjh
 * @time 2015-01-02 17:31
 *
 */
public interface IHPTMgtServiceContract {
	/**
	 * ��������ȯ��Ϣ
	 * @param dto
	 * 		�������Ĺ���ȯ��Ϣ
	 * @return
	 * 		json
	 */
	String add(HousePuraseTicketDto dto);
	
	/**
	 * ������������ȯ��Ϣ
	 * @param dtos
	 * 		����ȯdto����
	 * @return
	 * 		json
	 */
	String add(List<HousePuraseTicketDto> dtos);
	
	/**
	 * ��ȯ
	 * @param dto
	 * 		��ȯ��Ϣ
	 * @param hpt
	 * 		�����Ĺ���ȯ
	 * @return
	 * 		json
	 */
	String exchange(HPTExchangeInfoDto dto,HousePuraseTicketDto hpt);
	
	/**
	 * ��ȯ
	 * @param mendDto
	 * 		��ȯ��Ϣ
	 * @param hptDto
	 * 		�����Ĺ���ȯ
	 * @return
	 * 		json
	 */
	String mend(HPTMendInfoDto mendDto,HousePuraseTicketDto hptDto);
	
	/**
	 * ����ȯ��ʹ�úͶ���
	 * @param dto
	 * 		ʹ����Ϣ
	 * @return
	 * 		json
	 */
	String use(HPTUseAndCashInfoDto dto);
	
	/**
	 * ����ȯ�ķ���
	 * @param dto
	 * 		������Ϣ
	 * @return
	 * 		json
	 */
	String provide(HPTRecevieInfoDto dto);
	
	/**
	 * ��ʧ
	 * @param dto
	 * 		��ʧ��Ϣ
	 * @return
	 * 		json
	 */
	String lossOfReport(HPTLossInfoDto dto);

	/**
	 * ��ѯ��ȯ��Ϣ
	 * @param queryModel
	 * 		��ѯmodel
	 * @return
	 * 		json
	 */
	String queryExchangeInfo(HPTQueryModel queryModel);

	/**
	 * ��ѯһ���Ĺ���ȯ��Ϣ
	 * @param idNumber
	 * 		�������֤
	 * @return
	 * 		json
	 */
	String queryByFml(String idNumber);
	
	/**
	 * ��ѯ���˵Ĺ���ȯ��Ϣ
	 * @param idNumber
	 * 		���֤
	 * @return
	 * 		json
	 */
	String queryByIdNumber(String idNumber);
	
	/**
	 * ��ѯ����̨��
	 * @param queryModel
	 * 		��ѯmodel
	 * @return
	 * 		json
	 */
	String queryProvideTable(HPTFuzzyQueryModel queryModel,PageModel pageModel);
	
	/**
	 * ��ѯ�Ҹ�̨��
	 * @param queryModel
	 * 		��ѯmodel
	 * @return
	 * 		json
	 */
	String queryUseTable(HPTFuzzyQueryModel queryModel,PageModel pageModel);	
	
	/**
	 * �������Ź���ȯ
	 * @param list
	 * 		����dto����
	 * @return
	 */
	String provideByFml(List<HPTRecevieInfoDto> list);
	
	/**
	 * ���빺��ȯ
	 * @param list
	 * 		����ȯ���뵼��dto
	 * @return String
	 * 		json
	 */
	String importHPT(List<HPTImportAndExport> list);
}
