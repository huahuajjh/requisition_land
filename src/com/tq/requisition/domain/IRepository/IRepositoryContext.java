package com.tq.requisition.domain.IRepository;

import com.tq.requisition.domain.share.IAggregateRoot;
import com.tq.requisition.infrastructure.unitOfWork.IUnitOfWork;

/**
 * �����ýӿڵ�ʵ����һ���ִ�������,�ִ������Ķ����˾�������ݳ־û�api����Щapi��ʵ��λ�ڻ�����ʩ�㡣ʵ�ֿ��滻�ĳ־û����ơ�
 * @author jjh
 * @time 2015-12-14 14:11
 */
public interface IRepositoryContext extends IUnitOfWork{
	/**
	 * ��ָ���ľۺϸ����Ϊ'�½�'״̬
	 * @param root
	 * 		����ע�ľۺϸ����� 
	 * @return TAggregateRoot
	 * 		���ͷ����ķ��Ͳ�������
	 */
	<TAggregateRoot extends IAggregateRoot> void registerNew(TAggregateRoot root);
	
	/**
	 * ��ָ���ľۺϸ����Ϊ'�޸�'״̬
	 * @param root
	 * 		����ע�ľۺϸ����� 
	 * @return TAggregateRoot
	 * 		���ͷ����ķ��Ͳ�������
	 */
	<TAggregateRoot extends IAggregateRoot> void registerModified(TAggregateRoot root);
	
	/**
	 * ��ָ���ľۺϸ����Ϊ'ɾ��'״̬
	 * @param root
	 * 		����ע�ľۺϸ����� 
	 * @return TAggregateRoot
	 * 		���ͷ����ķ��Ͳ�������
	 */
	<TAggregateRoot extends IAggregateRoot> void registerDeleted(TAggregateRoot root);
	
	void close();
}
