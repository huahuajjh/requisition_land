package com.tq.requisition.infrastructure.Repository;

import java.util.List;
import java.util.UUID;

import org.apache.commons.lang3.NotImplementedException;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.criterion.Criterion;

import com.tq.requisition.domain.IRepository.IRepositoryContext;
import com.tq.requisition.domain.IRepository.Repository;
import com.tq.requisition.domain.Specification.ISpecification;
import com.tq.requisition.domain.Specification.expression.IHqlExpression;
import com.tq.requisition.domain.Specification.expression.OperationType;
import com.tq.requisition.domain.share.IAggregateRoot;
import com.tq.requisition.domain.share.IEntity;
import com.tq.requisition.exception.QueryStatementException;
import com.tq.requisition.infrastructure.Specifications.Expression.CriteriaExpression;
import com.tq.requisition.infrastructure.Specifications.share.ExistsByIdSpecification;

/**
 * Hibernate�ִ�
 * 
 * @param <TAggregatorRoot>
 *            �ۺϸ�
 * @author jjh
 * @time 2015-12-17 13:45
 */
public class HbRepository<TAggregatorRoot extends IAggregateRoot> extends
		Repository<TAggregatorRoot> {
	private IHbRepositoryContext hbContext;

	/**
	 * ��ʼ��
	 * 
	 * @param context
	 *            �ִ������Ķ���
	 */
	public HbRepository(IRepositoryContext context) {
		super(context);
		hbContext = (IHbRepositoryContext) context;
	}

	/**
	 * ��ȡ�ִ�������
	 * 
	 * @return IRepositoryContext �ִ�������ʵ��
	 */
	@Override
	public IRepositoryContext context() {
		return hbContext;
	}

	/* protect methods */
	/**
	 * ��ȡhibernate�Ĳִ�������
	 * 
	 * @return IHbRepositoryContext hibernate�ִ�������
	 */
	protected IHbRepositoryContext hbContext() {
		return hbContext;
	}

	/**
	 * ���rootClass
	 */
	private void checkRootClassNull() {
		if (rootClass == null)
			throw new RuntimeException(
					"HbRepository:checkRootClassNull--rootClassΪ����ʼ������ʹ��setAggregatorRootClass����ָ��Ҫ�־û���ʵ������");
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
	@Override
	protected TAggregatorRoot doGetByKey(Class<TAggregatorRoot> cls, UUID key) {
		return hbContext.session().get(cls, key);
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	protected void doAdd(TAggregatorRoot aggregateRoot) {
		hbContext.registerNew(aggregateRoot);
	}

	/**
	 * ���ݹ�Լ��ȡ�ۺϸ�����
	 * 
	 * @param specification
	 *            ��Լ
	 * @return List<TAggregatorRoot> �ۺϸ�ʵ������
	 */
	@Override
	protected List<TAggregatorRoot> doGetAll(			
			ISpecification<TAggregatorRoot> specification) {
		OperationType type = specification.getHqlExpression().getType();
		switch (type) {
		case SQL:
			return doGetAllBySql(specification);
		case HQL:
			return doGetAllByHql(specification);
		default:
			return doGetAllByCriteria(specification);
		}
	}

	/**
	 * {@inheritDoc}
	 */
	@SuppressWarnings("unchecked")
	@Override
	protected List<TAggregatorRoot> doGetAll(
			ISpecification<TAggregatorRoot> specification, int indexPage,
			int pageSize) {
		checkRootClassNull();
		Criteria ct = hbContext.session().createCriteria(super.rootClass);
		CriteriaExpression criteriaExpression = (CriteriaExpression) specification
				.getCriteriaExpression();
		for (Criterion criterion : criteriaExpression.getRestriction()) {
			ct.add(criterion);
		}
		ct.setFirstResult(indexPage);
		ct.setMaxResults(pageSize);
		return ct.list();
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	protected void doRemove(TAggregatorRoot aggregateRoot) {
		hbContext.registerDeleted(aggregateRoot);
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	protected void doUpdate(TAggregatorRoot aggregateRoot) {
		hbContext.registerModified(aggregateRoot);
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	protected void doRemove(ISpecification<TAggregatorRoot> specification) {
		throw new NotImplementedException("δʵ�ֵķ���");
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	protected void doRemove(Class<TAggregatorRoot> cls, UUID key) {
		TAggregatorRoot entity = getByKey(rootClass, key);
		if(entity == null)
		{
			throw new NullPointerException("����idδ��ѯ��ʵ�壬����Ϊnull");
		}
		doRemove(entity);
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	protected boolean doExists(ISpecification<TAggregatorRoot> specification) {
		IHqlExpression expression = specification.getHqlExpression();
		Object[] objects = expression.getParameters();
		Query hqlQuery;
		SQLQuery sqlQuery;
		OperationType type = expression.getType();
		int result = 0;
		boolean r;

		if (type == OperationType.SQL) {
			r = expression.getSql().toLowerCase().contains(" count(");
			if (!r) {
				throw new QueryStatementException("��ʹ��count��sql�Ӿ�");
			}
			sqlQuery = hbContext.session().createSQLQuery(expression.getSql());
			for (int i = 0; i < objects.length; i++) {
				sqlQuery.setParameter(i, objects[i]);
			}
			result = ((Number) sqlQuery.uniqueResult()).intValue();
		}

		if (type == OperationType.HQL) {
			r = expression.getHql().toLowerCase().contains(" count(");
			if (!r) {
				throw new QueryStatementException("��ʹ��count��sql�Ӿ�");
			}
			hqlQuery = hbContext.session().createQuery(expression.getHql());
			for (int i = 0; i < objects.length; i++) {
				hqlQuery.setParameter(i, objects[i]);
			}
			result = ((Number) hqlQuery.uniqueResult()).intValue();
		}

		if (result <= 0) {
			return false;
		}
		return true;

	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	protected boolean doExistsById(UUID id, String tableName, String idName) {
		return doExists(new ExistsByIdSpecification(rootClass, id, tableName,
				idName));
	}

	@Override
	protected int doExecuteUpdate(ISpecification<TAggregatorRoot> specification) {
		OperationType type = specification.getHqlExpression().getType();
		switch (type) {
		case SQL:
			return doExecuteUpdateBySql(specification);
		case HQL:
			return doExecuteUpdateByHql(specification);
		default:
			return doExecuteUpdateByCriteria(specification);
		}
	}

	@Override
	protected int doGetTotalCount(ISpecification<TAggregatorRoot> specification) {
		IHqlExpression expression = specification.getHqlExpression();
		if(expression.getType() == OperationType.HQL)
		{
			return doGetTotalCountByHql(specification);
		}
		Object[] objects = expression.getParameters();
		SQLQuery query = hbContext.session().createSQLQuery(expression.getSql());
		if(!(objects==null))
		{
			for (int i = 0; i < objects.length; i++) {
				query.setParameter(i, objects[i]);
			}
		}
		Object result = query.uniqueResult();
		int count = ((Number) result).intValue();
		return count;
	}
	
	private int doGetTotalCountByHql(ISpecification<TAggregatorRoot> specification){
		IHqlExpression expression = specification.getHqlExpression();
		Object[] objects = expression.getParameters();
		Query query = hbContext.session().createQuery(expression.getHql());
		if(!(objects==null))
		{
			for (int i = 0; i < objects.length; i++) {
				query.setParameter(i, objects[i]);
			}
		}
		Object result = query.uniqueResult();
		int count = ((Number) result).intValue();
		return count;
	}
	
	/**
	 * ����hql��ѯʵ�弯�ϣ��벻Ҫ���׵��ø÷������÷���Ϊ�˸��ۺϸ�һ�����ύ�ṩ����޷�Χ�ڵ�����ʵ��
	 * �־û�ʹ�õġ�������Ǹ�������ʹ�þۺϸ��ִ��ṩ��api
	 * @param query
	 * 		��ѯ���
	 * @param objects
	 * 		��ѯ����
	 * @return
	 */
	protected <T extends IEntity> List<T> getByHql(String query,Object... objects) {
		Query hql = hbContext.session().createQuery(query);
		if(objects!=null)
		{
			for (int i = 0; i < objects.length; i++) {
				hql.setParameter(i, objects[i]);
			}
		}
		return hql.list();
	}

	/**
	 * ����sql��ѯʵ�弯�ϣ��벻Ҫ���׵��ø÷������÷���Ϊ�˸��ۺϸ�һ�����ύ�ṩ����޷�Χ�ڵ�����ʵ��
	 * �־û�ʹ�õġ�������Ǹ�������ʹ�þۺϸ��ִ��ṩ��api
	 * @param query
	 * 		��ѯ���
	 * @param objects
	 * 		��ѯ����
	 * @return
	 */
	protected <T extends IEntity> List<T> getBySql(Class<T> cls,String query,Object... objects) {
		SQLQuery sql = hbContext.session().createSQLQuery(query).addEntity(cls);
		if(objects!=null)
		{
			for (int i = 0; i < objects.length; i++) {
				sql.setParameter(i, objects[i]);
			}
		}
		return sql.list();
	}
		
	/**
	 * �錍�w�־û���ԓ������ۺϸ��µČ��w�ṩ�־û�������
	 * @param entity
	 * 		�������Č��w
	 */
	protected <T extends IEntity> void add(T entity) {
		hbContext.session().save(entity);
	}
	
	/**
	 * ����ΨһԼ�����ֶβ���id
	 * @param queryStr
	 * 		sql���ʽ
	 * @param param
	 * 		����
	 * @return UUID
	 * 		UUID
	 */
	protected UUID getIdByUniqueCol(String queryStr,Object param) {
		SQLQuery query = hbContext.session().createSQLQuery(queryStr);
		query.setParameter(0, param);
		List<Object> id = query.list();
		if(null==id || id.size()==0)
		{
			return null;
		}
		return UUID.fromString(id.get(0).toString());
	}
	
	/**
	 * ����sqlɾ��ʵ�弯�ϣ��벻Ҫ���׵��ø÷������÷���Ϊ�˸��ۺϸ�һ�����ύ�ṩ����޷�Χ�ڵ�����ʵ��
	 * �־û�ʹ�õġ�������Ǹ�������ʹ�þۺϸ��ִ��ṩ��api
	 * @param query
	 * 		ɾ�����
	 * @param objects
	 * 		ɾ������
	 * @return
	 */
	protected void removeBySql(String sqlStr,Object... objects) {
		SQLQuery sql = hbContext.session().createSQLQuery(sqlStr);
		if(objects!=null)
		{
			for (int i = 0; i < objects.length; i++) {
				sql.setParameter(i, objects[i]);
			}
		}
		sql.executeUpdate();
	}
	
	protected <T> T get(Class<T> cls,UUID id) {
		return hbContext.session().get(cls, id);
	}
	
	protected <T> void update(T t) {
		hbContext.session().update(t);
	}
	
	/**
	 * ����hqlɾ��ʵ�弯�ϣ��벻Ҫ���׵��ø÷������÷���Ϊ�˸��ۺϸ�һ�����ύ�ṩ����޷�Χ�ڵ�����ʵ��
	 * �־û�ʹ�õġ�������Ǹ�������ʹ�þۺϸ��ִ��ṩ��api
	 * @param query
	 * 		ɾ�����
	 * @param objects
	 * 		ɾ������
	 * @return
	 */
	protected void removeByHql(String hqlStr,Object... objects) {
		Query sql = hbContext.session().createQuery(hqlStr);
		if(objects!=null)
		{
			for (int i = 0; i < objects.length; i++) {
				sql.setParameter(i, objects[i]);
			}
		}
		sql.executeUpdate();
	}
	
	/**
	 * ����sql����ʵ�弯�ϣ��벻Ҫ���׵��ø÷������÷���Ϊ�˸��ۺϸ�һ�����ύ�ṩ����޷�Χ�ڵ�����ʵ��
	 * �־û�ʹ�õġ�������Ǹ�������ʹ�þۺϸ��ִ��ṩ��api
	 * @param query
	 * 		�������
	 * @param objects
	 * 		���²���
	 * @return
	 */
	protected void updateBySql(String sqlStr,Object... objects) {
		SQLQuery sql = hbContext.session().createSQLQuery(sqlStr);
		if(objects!=null)
		{
			for (int i = 0; i < objects.length; i++) {
				sql.setParameter(i, objects[i]);
			}
		}
		sql.executeUpdate();
	}
	
	/**
	 * ����hql����ʵ�弯�ϣ��벻Ҫ���׵��ø÷������÷���Ϊ�˸��ۺϸ�һ�����ύ�ṩ����޷�Χ�ڵ�����ʵ��
	 * �־û�ʹ�õġ�������Ǹ�������ʹ�þۺϸ��ִ��ṩ��api
	 * @param query
	 * 		�������
	 * @param objects
	 * 		���²���
	 * @return
	 */
	protected void updateByHql(String hqlStr,Object... objects) {
		Query hql = hbContext.session().createQuery(hqlStr);
		if(objects!=null)
		{
			for (int i = 0; i < objects.length; i++) {
				hql.setParameter(i, objects[i]);
			}
		}
		hql.executeUpdate();
	}
	
	/* private methods */
	@SuppressWarnings("unchecked")
	private List<TAggregatorRoot> doGetAllBySql(ISpecification<TAggregatorRoot> specification) 
	{
			checkRootClassNull();
			IHqlExpression expression = specification.getHqlExpression();
			Object[] objects = expression.getParameters();
			SQLQuery query = hbContext.session()
					.createSQLQuery(expression.getSql()).addEntity(rootClass);
			if (!(objects == null)) {
				for (int i = 0; i < objects.length; i++) {
					query.setParameter(i, objects[i]);
				}
			}
			return query.list();
	}

	@SuppressWarnings("unchecked")
	private List<TAggregatorRoot> doGetAllByHql(
			ISpecification<TAggregatorRoot> specification) {
		checkRootClassNull();
		IHqlExpression expression = specification.getHqlExpression();
		Object[] objects = expression.getParameters();
		Query query = hbContext.session().createQuery(expression.getHql());
		if (!(objects == null)) {
			for (int i = 0; i < objects.length; i++) {
				query.setParameter(i, objects[i]);
			}
		}
		return query.list();
	}

	@SuppressWarnings("unchecked")
	private List<TAggregatorRoot> doGetAllByCriteria(
			ISpecification<TAggregatorRoot> specification) {
		checkRootClassNull();
		Criteria ct = hbContext.session().createCriteria(rootClass);
		CriteriaExpression criteriaExpression = (CriteriaExpression) specification
				.getCriteriaExpression();
		for (Criterion criterion : criteriaExpression.getRestriction()) {
			ct.add(criterion);
		}
		return ct.list();
	}

	protected List<Object> getAllBySqlJoin(ISpecification specification){
		IHqlExpression expression = specification.getHqlExpression();
		Object[] objects = expression.getParameters();
		SQLQuery query = hbContext.session()
				.createSQLQuery(expression.getSql());
		if (!(objects == null)) {
			for (int i = 0; i < objects.length; i++) {
				query.setParameter(i, objects[i]);
			}
		}
		return query.list();
	}
	
	protected List<Object[]> getAllBySqlJoin(ISpecification specification,int pageIndex,int pageSize){
		IHqlExpression expression = specification.getHqlExpression();
		Object[] objects = expression.getParameters();
		SQLQuery query = hbContext.session()
				.createSQLQuery(expression.getSql());
		if(pageIndex!=-1 || pageSize != -1)
		{
			query.setFirstResult(pageIndex);
			query.setMaxResults(pageSize);
		}
		if (!(objects == null)) {
			for (int i = 0; i < objects.length; i++) {
				query.setParameter(i, objects[i]);
			}
		}
		return query.list();
	}
	
	protected List getAllByHqlJoin(ISpecification specification,int pageIndex,int pageSize){
		IHqlExpression expression = specification.getHqlExpression();
		Object[] objects = expression.getParameters();
		Query query = hbContext.session()
				.createQuery(expression.getHql());
		if(pageIndex!=-1 || pageSize != -1)
		{
			query.setFirstResult(pageIndex);
			query.setMaxResults(pageSize);
		}
		if (!(objects == null)) {
			for (int i = 0; i < objects.length; i++) {
				query.setParameter(i, objects[i]);
			}
		}
		return query.list();
	}
	
	private int doExecuteUpdateBySql(
			ISpecification<TAggregatorRoot> specification) {
		checkRootClassNull();
		IHqlExpression expression = specification.getHqlExpression();
		Object[] objects = expression.getParameters();
		SQLQuery query = hbContext.session()
				.createSQLQuery(expression.getSql());
		if (!(objects == null)) {
			for (int i = 0; i < objects.length; i++) {
				query.setParameter(i, objects[i]);
			}
			return query.executeUpdate();
		}
		return query.executeUpdate();
	}

	private int doExecuteUpdateByHql(
			ISpecification<TAggregatorRoot> specification) {
		checkRootClassNull();
		IHqlExpression expression = specification.getHqlExpression();
		Object[] objects = expression.getParameters();
		Query query = hbContext.session().createQuery(expression.getHql());
		if (!(objects == null)) {
			for (int i = 0; i < objects.length; i++) {
				query.setParameter(i, objects[i]);
			}
			return query.executeUpdate();
		}
		return -1;
	}

	private int doExecuteUpdateByCriteria(
			ISpecification<TAggregatorRoot> specification) {
		return 0;
	}

}
