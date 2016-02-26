package com.tq.requisition.domain.IRepository;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.domain.Specification.ISpecification;
import com.tq.requisition.domain.share.IAggregateRoot;

/**
 * �����ýӿڵ�ʵ����һ���ִ�������,�ִ������Ķ����˾�������ݳ־û�api����Щapi��ʵ��λ�ڻ�����ʩ�㡣ʵ�ֿ��滻�ĳ־û����ơ�
 * 
 * @author jjh
 * @time 2015-12-17 00:12
 */
public abstract class Repository<TAggregateRoot extends IAggregateRoot>
		implements IRepository<TAggregateRoot> {
	private final IRepositoryContext context;
	protected Class<TAggregateRoot> rootClass;

	/**
	 * ��ʼ��
	 * 
	 * @param _context
	 *            �ִ�������
	 */
	public Repository(IRepositoryContext _context) {
		context = _context;
	}

	/**
	 * ���÷�������class
	 * 
	 * @param root
	 *            ��������class
	 */
	@Override
	public IRepository<TAggregateRoot> setAggregatorRootClass(
			Class<TAggregateRoot> root) {
		rootClass = root;
		return this;
	}

	/**
	 * ��ȡ�ִ�������
	 * 
	 * @return IRepositoryContext �ִ������Ķ���
	 */
	@Override
	public IRepositoryContext context() {
		return context;
	}

	@Override
	public boolean existsById(UUID id, String tableName, String idName) {
		return doExistsById(id, tableName, idName);
	}

	@Override
	public int executeUpdate(ISpecification<TAggregateRoot> specification) {
		return doExecuteUpdate(specification);
	}

	@Override
	public int getTotalCount(ISpecification<TAggregateRoot> specification) {
		return doGetTotalCount(specification);
	}
	
	/**
	 * {@inheritDoc}
	 */
	@Override
	public boolean exists(ISpecification<TAggregateRoot> specification) {
		return doExists(specification);
	}

	/**
	 * ��ָ���ľۺϸ���ӵ��ִ���
	 * 
	 * @param aggregateRoot
	 *            ����ӵľۺϸ�
	 */
	@Override
	public void add(TAggregateRoot aggregateRoot) {
		doAdd(aggregateRoot);
	}

	/**
	 * ���ݾۺϸ���idֵ����ȡ�ۺϸ�
	 * 
	 * @param key
	 *            �ۺϸ�id
	 * @param cls
	 *            �ۺϸ�class
	 * @return TAggregateRoot �ۺϸ�ʵ��
	 */
	@Override
	public TAggregateRoot getByKey(Class<TAggregateRoot> cls, UUID key) {
		return doGetByKey(cls, key);
	}

	/**
	 * ����ָ���Ĺ�Լ���Ӳִ��л�ȡ���з��������ľۺϸ�
	 * 
	 * @param specification
	 *            ��Լ
	 * @return List<TAggregateRoot> ���������ľۺϸ�ʵ������
	 */
	@Override
	public List<TAggregateRoot> getAll(
			ISpecification<TAggregateRoot> specification) {
		return doGetAll(specification);
	}

	/**
	 * ��ҳ��ȡ�ۺϸ����϶���
	 * 
	 * @param specification
	 *            ��Լ
	 * @param indexPage
	 *            ��ʼҳ
	 * @param pageSize
	 *            ҳ���С
	 * @return List<TAggregateRoot> �ۺϸ�����
	 */
	@Override
	public List<TAggregateRoot> getAll(
			ISpecification<TAggregateRoot> specification, int indexPage,
			int pageSize) {
		return doGetAll(specification, indexPage, pageSize);
	}

	/**
	 * ��ָ���ľۺϸ��Ӳִ���ɾ��
	 * 
	 * @param aggregateRoot
	 *            ��ɾ���ľۺϸ�
	 */
	@Override
	public void remove(TAggregateRoot aggregateRoot) {
		doRemove(aggregateRoot);
	}

	/**
	 * ���ݹ�Լɾ���ۺϸ�
	 * 
	 * @param specification
	 *            ��Լ
	 */
	@Override
	public void remove(ISpecification<TAggregateRoot> specification) {
		doRemove(specification);
	}

	/**
	 * ����idɾ���ۺϸ�
	 * 
	 * @param cls
	 *            �ۺϸ�class
	 * @param keyUuid
	 *            uuid����
	 */
	@Override
	public void removeByKey(Class<TAggregateRoot> cls, UUID keyUuid) {
		doRemove(cls, keyUuid);
	}

	/**
	 * ����ָ���ľۺϸ�
	 * 
	 * @param aggregateRoot
	 *            �����µľۺϸ�
	 */
	@Override
	public void update(TAggregateRoot aggregateRoot) {
		doUpdate(aggregateRoot);
	}

	/**
	 * ����id��ȡ�ۺϸ����÷���������ʵ��
	 * 
	 * @param key
	 *            �ۺϸ�id
	 * @param cls
	 *            �ۺϸ�class
	 * @return TAggregateRoot �ۺϸ�����
	 */
	protected abstract TAggregateRoot doGetByKey(Class<TAggregateRoot> cls,
			UUID key);

	/**
	 * ����ָ���ľۺϸ����ִ��У��÷���������ʵ��
	 * 
	 * @param aggregateRoot
	 *            �������ľۺϸ�
	 */
	protected abstract void doAdd(TAggregateRoot aggregateRoot);

	/**
	 * ����ָ���Ĺ�Լ��ȡ�ۺϸ����÷���������ʵ��
	 * 
	 * @param specification
	 *            ָ���Ĺ�Լ
	 * @return List<TAggregateRoot> �ۺϸ�����
	 */
	protected abstract List<TAggregateRoot> doGetAll(
			ISpecification<TAggregateRoot> specification);

	/**
	 * ����ָ���Ĺ�Լ��ҳ��ȡ�ۺϸ����÷���������ʵ��
	 * 
	 * @param specification
	 *            ָ���Ĺ�Լ
	 * @param indexPage
	 *            ��ʼҳ
	 * @param pageSize
	 *            ҳ��
	 * @return List<TAggregateRoot> �ۺϸ�����
	 */
	protected abstract List<TAggregateRoot> doGetAll(
			ISpecification<TAggregateRoot> specification, int indexPage,
			int pageSize);

	/**
	 * ɾ��ָ���ľۺϸ����÷���������ʵ��
	 * 
	 * @param aggregateRoot
	 *            ��ɾ���ľۺϸ�
	 */
	protected abstract void doRemove(TAggregateRoot aggregateRoot);

	/**
	 * ���ݹ�Լɾ���ۺϸ�
	 * 
	 * @param specification
	 *            ��Լ
	 */
	protected abstract void doRemove(
			ISpecification<TAggregateRoot> specification);

	/**
	 * ����idɾ���ۺϸ�
	 * 
	 * @param cls
	 *            �ۺϸ�class
	 * @param keyUuid
	 *            uuid����
	 */
	protected abstract void doRemove(Class<TAggregateRoot> cls, UUID key);

	/**
	 * ����ָ���ľۺϸ����ִ��У��÷���������ʵ��
	 * 
	 * @param aggregateRoot
	 *            �����µľۺϸ�
	 */
	protected abstract void doUpdate(TAggregateRoot aggregateRoot);

	/**
	 * ����һ��booleanֵ����ֵ�����þۺϸ��Ƿ���� �÷���Ӧ����������д
	 * 
	 * @param specification
	 *            ��Լ
	 * @return boolean �������ָ����Լ�����ľۺϸ����ڣ�����true�����򷵻�false
	 */
	protected abstract boolean doExists(
			ISpecification<TAggregateRoot> specification);

	protected abstract boolean doExistsById(UUID id, String tableName,
			String idName);

	protected abstract int doExecuteUpdate(ISpecification<TAggregateRoot> specification);
		
	protected abstract int doGetTotalCount(ISpecification<TAggregateRoot> specification);
}
