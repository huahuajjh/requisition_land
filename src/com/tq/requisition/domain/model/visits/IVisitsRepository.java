package com.tq.requisition.domain.model.visits;

import java.util.UUID;

import com.tq.requisition.domain.IRepository.IRepository;
import com.tq.requisition.infrastructure.utils.PageFormater;
import com.tq.requisition.presentation.dto.share.PageModel;
import com.tq.requisition.presentation.dto.visits.VisitsQueryModel;

/**
 * �Ϸü�¼�ִ��ӿ�
 * @author jjh
 * @time 2016-01-13 15:42
 *
 */
public interface IVisitsRepository extends IRepository<Visits>{
	/**
	 * ����idɾ��ָ�����Ϸ���Ϣ
	 * @param id
	 * 		��ɾ�������id
	 */
	void delById(UUID id);
	
	PageFormater queryByPage(VisitsQueryModel queryModel,PageModel pageModel);
}
