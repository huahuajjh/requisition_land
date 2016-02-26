package com.tq.requisition.domain.IRepository;

import java.util.Map;
import java.util.UUID;

import com.tq.requisition.domain.share.IAggregateRoot;
import com.tq.requisition.exception.InvalidOperationException;

/**
 * �ִ������Ļ���
 * @author jjh
 * @time 2015-12-17 00:46
 */
public abstract class RepositoryContext implements IRepositoryContext{
	/*fields*/
	private final static ThreadLocal<Boolean> localCommited = new ThreadLocal<Boolean>();
	private final static ThreadLocal<Map<UUID, Object>> localNewCollection = new ThreadLocal<Map<UUID, Object>>();
	private final static ThreadLocal<Map<UUID, Object>> localModifiedCollection = new ThreadLocal<Map<UUID, Object>>();
	private final static ThreadLocal<Map<UUID, Object>> localDeletedCollection = new ThreadLocal<Map<UUID, Object>>();

	public RepositoryContext(){
		localCommited.set(false);
	}

	/**
	 * ����һ��booleanֵ����ֵ�����˵�ǰ��uow�����Ƿ��ύ 
	 * @return boolean
	 * 		�Ƿ��ύ
	 */
	@Override
	public boolean commited() {
		if(localCommited.get()==null)
		{
			localCommited.set(false);
//			throw new NullPointerException("RepositoryContext���е�localCommited.get()Ϊnull");
		}
		return localCommited.get();
	}

	/**
	 * ����һ��booleanֵ����ֵ�����˵�ǰ��uow�����Ƿ��ύ 
	 * @param isCommited
	 * 		�Ƿ��ύ
	 */
	@Override
	public void commited(boolean isCommited) {
		localCommited.set(isCommited);
	}

	/*IUnitOfWorkʵ��*/	
	@Override
	public void commit() {
		doCommit();
	}
	
	/**
	 * �ر�������
	 */
	@Override
	public void close() {
		doClose();
	}

	/**
	 * ��������
	 */
	@Override
	public void beginTransaction() {
		doBegintransaction();
	}
	
	@Override
	public void rollback() {
		doRollback();
	}

	/**
	 * �ύ���񣬸÷���������ʵ��
	 */
	protected abstract void doCommit();
	
	protected abstract void doClose();
	
	/**
	 * �������񣬸÷���������ʵ��
	 */
	protected abstract void doBegintransaction();
	
	/**
	 * �ع����񣬸÷���������ʵ��
	 */
	protected abstract void doRollback();

	@Override
	public <TAggregateRoot extends IAggregateRoot> void registerNew(TAggregateRoot root) {
		if(localDeletedCollection.get().containsKey(root.id()))
		{
			throw new InvalidOperationException("�ö����ܱ����Ϊ��������Ϊ����ǰ�����Ϊɾ��״̬");
		}
		if(!localNewCollection.get().containsKey(root.id()) && !localModifiedCollection.get().containsKey(root.id()))
		{
			localModifiedCollection.get().put(root.id(), root);
			localCommited.set(false);
		}	
		
	}

	@Override
	public <TAggregateRoot extends IAggregateRoot> void registerModified(TAggregateRoot root) {
		if(localDeletedCollection.get().containsKey(root.id()))
		{
			throw new InvalidOperationException("�ö����ܱ����Ϊ��������Ϊ����ǰ�����Ϊɾ��״̬");
		}
		if(!localNewCollection.get().containsKey(root.id()) && !localModifiedCollection.get().containsKey(root.id()))
		{
			localModifiedCollection.get().put(root.id(), root);
			localCommited.set(false);
		}
		
	}

	@Override
	public <TAggregateRoot extends IAggregateRoot> void registerDeleted(TAggregateRoot root) {
		if(root.id().equals(null))
		{throw new NullPointerException("��ָ���쳣");}
		
		if(localNewCollection.get().containsKey(root.id()))
		{
			localNewCollection.get().remove(root.id());
		}
		if(!localDeletedCollection.get().containsKey(root.id()))
		{
			localDeletedCollection.get().put(root.id(),root);
			localCommited.set(false);
		}
		
	}
	
}
