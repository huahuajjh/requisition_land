package com.tq.requisition.domain.IRepository;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.domain.Specification.ISpecification;
import com.tq.requisition.domain.share.IAggregateRoot;

/**
 * ����ʵ�ָýӿڵ�ʵ��Ϊdomain�вִ��Ľӿ�ʵ�֣����ýӿڶ�����domain�У���Ϊ��ʵ���뼼��ϸ�ڵĳ־û��㣨������ʩ��infrastructure���ķ��루�������ã�
 * ͬʱ���ýӿڷ��������޶�������ʵ����IAggregateRoot��ʵ���������Ͳ������ͱ����Ǿۺϸ�
 * @author jjh
 * @time 2015-12-14 14:05
 */
public interface IRepository<TAggregateRoot extends IAggregateRoot> {
	/**
	 * ���÷�������class 	
	 * @param root
	 * 		��������class
	 */
	public IRepository<TAggregateRoot> setAggregatorRootClass(Class<TAggregateRoot> root);
	
	/**
	 * ����һ��booleanֵ����ֵ�����þۺϸ��Ƿ����
	 * @param specification
	 * 		��Լ
	 * @return boolean
	 * 		�������ָ����Լ�����ľۺϸ����ڣ�����true�����򷵻�false
	 */
	boolean exists(ISpecification<TAggregateRoot> specification);
	
	/**
	 * ��ȡ�ִ�������
	 * @return IRepositoryContext
	 * 		�ִ�������
	 */
	IRepositoryContext context();
	
	/**
	 * ��ָ���ľۺϸ���ӵ��ִ���
	 * @param aggregateRoot
	 * 		����ӵľۺϸ�
	 */
	void add(TAggregateRoot aggregateRoot);
	
	/**
	 * ���ݾۺϸ���idֵ����ȡ�ۺϸ�
	 * @param key
	 * 		�ۺϸ�id
	 * @param cls
	 * 		�ۺϸ�class
	 * @return TAggregateRoot
	 * 		�ۺϸ�ʵ��
	 */
	TAggregateRoot getByKey(Class<TAggregateRoot> cls,UUID key);
		
	/**
	 * ����ָ���Ĺ�Լ���Ӳִ��л�ȡ���з��������ľۺϸ�
	 * @param specification
	 * 		��Լ
	 * @return List<TAggregateRoot>
	 * 		���������ľۺϸ�ʵ������
	 */
	List<TAggregateRoot> getAll(ISpecification<TAggregateRoot> specification);
	
	/**
	 * ��ҳ��ȡ�ۺϸ����϶���
	 * @param specification
	 * 		��Լ
	 * @param indexPage
	 * 		��ʼҳ
	 * @param pageSize
	 * 		ҳ���С
	 * @return List<TAggregateRoot>
	 * 		�ۺϸ�����
	 */
	List<TAggregateRoot> getAll(ISpecification<TAggregateRoot> specification,int indexPage,int pageSize);
	
	/**
	 * ��ָ���ľۺϸ��Ӳִ���ɾ��
	 * @param aggregateRoot
	 * 		��ɾ���ľۺϸ�
	 */
	void remove(TAggregateRoot aggregateRoot);
	
	/**
	 * ���ݹ�Լɾ���ۺϸ�
	 * @param specification
	 * 		��Լ
	 */
	void remove(ISpecification<TAggregateRoot> specification);
	
	/**
	 * ����idɾ���ۺϸ�
	 * @param cls
	 * 		�ۺϸ�class
	 * @param keyUuid
	 * 		uuid����
	 */
	void removeByKey(Class<TAggregateRoot> cls,UUID keyUuid);
	
	/**
	 * ����ָ���ľۺϸ�
	 * @param aggregateRoot
	 * 		�����µľۺϸ�
	 */
	void update(TAggregateRoot aggregateRoot);
		
	/**
	 * ���ݾۺϸ�id����Ƿ���ڸþۺϸ�
	 * @param id
	 * 		�ۺϸ�id
	 * @param tableName
	 * 		����
	 * @param idName
	 * 		id����
	 * @return boolean
	 * 		���ڷ���true�����򷵻�false
	 */
	boolean existsById(UUID id,String tableName,String idName);

	/**
	 * ִ��һ��update����delet����
	 * @param specification
	 * 		��Լ
	 * @return int
	 * 		Ӱ������
	 */
	int executeUpdate(ISpecification<TAggregateRoot> specification);

	/**
	 * ��ȡ�ܼ�¼��
	 * @param tableName
	 * 		����
	 * @return int
	 * 		�ܼ�¼��
	 */
	int getTotalCount(ISpecification<TAggregateRoot> specification);
}
