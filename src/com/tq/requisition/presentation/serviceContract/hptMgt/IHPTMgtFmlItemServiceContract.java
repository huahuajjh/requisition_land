package com.tq.requisition.presentation.serviceContract.hptMgt;

import com.tq.requisition.presentation.dto.hpt.PersonAndHPTDto;

/**
 * ����ȯ����Ա�ķ�����Լ
 * @author Bless
 * @time 2015-03-16 15��25
 *
 */
public interface IHPTMgtFmlItemServiceContract {
	
	/**
	 * ��������ȯ��Ϣ
	 * @param dto
	 * 		�������Ĺ���ȯ��Ϣ
	 * @return
	 * 		json
	 */
	String add(PersonAndHPTDto personAndHPTDto);
}
