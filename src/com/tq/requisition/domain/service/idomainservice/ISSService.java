package com.tq.requisition.domain.service.idomainservice;

import java.util.List;

import com.tq.requisition.domain.model.socialsecurity.SocialsecurityInfo;
import com.tq.requisition.exception.DomainException;

/**
 * �籣�������ӿ�
 * @author jjh
 * @time 2015-01-04 17:30
 */
public interface ISSService {
	/**
	 * �����籣��Ϣ
	 * @param ss
	 * 		���������籣��Ϣʵ��
	 * @return
	 * 		����������Ϣ
	 */
	void addSSInfo(SocialsecurityInfo ss)  throws DomainException ;
	
	/**
	 * ���������籣��Ϣ
	 * @param list
	 * 		���������籣��Ϣ����
	 * @return
	 * 		�������������Ϣ
	 */
	void addSSBatch(List<SocialsecurityInfo> list)  throws DomainException ;
	
}
