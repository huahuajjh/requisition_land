package com.tq.requisition.domain.model.operationRecord;

import java.util.Date;

import com.tq.requisition.domain.model.account.Account;
import com.tq.requisition.domain.share.AggregateRoot;

/**
 * ������־��¼�ۺϸ�
 * @author jjh
 * @time 2015-12-18 23:15
 */
public class OperationRecord extends AggregateRoot{
	/**ip��ַ*/
	private String ipAddr;
	/**��������*/
	private Date oprTime;
	/**����ģ��*/
	private String oprMoudle;
	/**��������*/
	private String oprAction;
	/**�������ݼ�¼*/
	private String oprContent;
	/**�����ַ*/
	private String macAddr;
	/**������*/
	private Account account;
}
