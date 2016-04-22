package com.tq.requisition.domain.model.removedInfo;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.domain.IRepository.IRepository;
import com.tq.requisition.exception.DomainException;
import com.tq.requisition.infrastructure.utils.PageFormater;
import com.tq.requisition.presentation.dto.removedinfo.RemovedInfoQueryModel;
import com.tq.requisition.presentation.dto.share.PageModel;

/**
 * ��Ǩ���ۺϸ��ִ��ӿ�
 * @author jjh
 * @time 2015-12-30 22:46
 */
public interface IRemovedInfoRepository extends IRepository<RemovedInfo>{
	/**
	 * ������Ǩ��Ա������Ϣ
	 * @param entity
	 * 		��Ǩ��Ա������Ϣʵ��
	 * @return
	 * 		�����Ѳ�Ǩ��Ա������Ϣʵ��
	 */
	RemovedInfo addRemovedInfo(RemovedInfo entity) throws DomainException ;

	/**
	 * ����������Ǩ����Ա������Ϣ
	 * @param list
	 * 		��Ǩ����Ա������Ϣ
	 */
	void addBatch(List<RemovedInfo> list) throws DomainException;
	
	/**
	 * ����ָ��idɾ���Ĳ�Ǩ��Ա������Ϣ
	 * @param id
	 * 		��Աid
	 */
	void delRemovedInfo(UUID id);
	
	/**
	 * ��ѯ��Ǩ������
	 * @param queryModel
	 * 		��ѯmodel
	 * @param pageModel
	 * 		��ҳmodel
	 * @return
	 * 		��Ǩ����������
	 */
	PageFormater queryByPage(RemovedInfoQueryModel queryModel, PageModel pageModel);
	
	/**
	 * �༭��Ǩ��������Ϣ
	 * @param entity
	 * 		���༭����Ǩ������ʵ��
	 * @return
	 * 		���ر��༭��ĵ���ʵ��
	 */
	RemovedInfo editRemovedInfo(RemovedInfo entity) throws DomainException ;
	
	/**
	 * ���ݲ�ѯmodel��ѯ��Ǩ������
	 * @param queryModel
	 * 		��ѯmodel
	 * @return List<RemovedInfo>
	 * 		��Ǩ������
	 */
	List<RemovedInfo> queryByModel(RemovedInfoQueryModel queryModel);
	
	/**
	 * ����ָ�������֤ɾ��
	 * @param idNum ���֤
	 */
	void deleteByIdNum(String idNum);
}

