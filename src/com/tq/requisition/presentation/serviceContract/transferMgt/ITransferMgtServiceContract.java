package com.tq.requisition.presentation.serviceContract.transferMgt;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.infrastructure.utils.PageFormater;
import com.tq.requisition.presentation.dto.share.PageModel;
import com.tq.requisition.presentation.dto.transferMgt.NewAndEditTransferHouseholdInfoDto;
import com.tq.requisition.presentation.dto.transferMgt.TransferInfoQueryModel;

/**
 * ת������ҵ��ӿ���Լ
 * @author jjh
 * @time 2015-12-30 17:07
 *
 */
public interface ITransferMgtServiceContract {
	/**
	 * ����ת����Ϣ
	 * @param dto
	 * 		ת����Ϣdto
	 * @return
	 */
	String addTransferInfo(NewAndEditTransferHouseholdInfoDto dto);
	
	/**
	 * ��������ת����Ϣ
	 * @param list
	 * 		ת����Ϣdto����
	 * @return
	 */
	String addBatchTransferInfo(List<NewAndEditTransferHouseholdInfoDto> list);
	
	/**
	 * ���ݲ�ѯmodel��ȡת����Ϣ�б�����json��ʽ
	 * @param queryModel
	 * 		��ѯmodel
	 * @param pageModel
	 * 		��ҳmodel
	 * @return
	 */
	String queryJsonByFuzzy(TransferInfoQueryModel queryModel,PageModel pageModel);
	
	/**
	 * ���ݲ�ѯmodel��ȡת����Ϣ����
	 * @param queryModel
	 * 		��ѯmodel
	 * @param pageModel
	 * 	��ҳmodel
	 * @return
	 */
	PageFormater queryListByFuzzy(TransferInfoQueryModel queryModel,PageModel pageModel);
	
	/**
	 * �����༭ת����Ϣʱ��ѯ�Ľӿڣ����������༭�Ĳ�ѯ��
	 * @param queryModel
	 * 		��ѯmodel
	 * @param pageModel
	 * 		��ҳmodel
	 * @return
	 */
//	PageFormater queryListByFuzzy4Edit(TransferInfoQueryModel queryModel,PageModel pageModel);
	
	/**
	 * �����༭ǰ�Ĳ�ѯ����������json�ַ���	
	 * @param queryModel
	 * 		��ѯmodel
	 * @param pageModel
	 * 		��ҳmodel
	 * @return
	 */
//	String queryByFuzzy4Edit(TransferInfoQueryModel queryModel,PageModel pageModel);
	
	/**
	 * ��������ת��������Ϣ
	 * @param list
	 * 		�����µ�ת������
	 * @return
	 */
//	String editBatchTransferInfo(List<NewAndEditTransferHouseholdInfoDto> list);
	
	/**
	 * ����ʱ��ѯapi
	 * @param queryModel
	 * 		��ѯmodel
	 * @param pageModel
	 * 		��ҳmodel
	 * @return
	 */
	PageFormater queryList4AddByFuzzy(TransferInfoQueryModel queryModel,PageModel pageModel);
	
	/**
	 * ����ʱ��ѯapi
	 * @param queryModel
	 * 		��ѯmodel
	 * @param pageModel
	 * 		��ҳmodel
	 * @return
	 */
	String query4AddByFuzzy(TransferInfoQueryModel queryModel,PageModel pageModel);
	
	/**
	 * ����ɾ��������վ
	 * @param uuids
	 * 		��ɾ����id����
	 * @return
	 */
	String deleteBatch(UUID... uuids);

	/**
	 * �༭ת����Ϣ
	 * @param dto
	 * 		dto
	 * @return
	 */
	String editTransferInfo(NewAndEditTransferHouseholdInfoDto dto);
}
