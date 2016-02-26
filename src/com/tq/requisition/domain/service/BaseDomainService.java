package com.tq.requisition.domain.service;

import com.tq.requisition.domain.IRepository.IRepositoryContext;

/**
 * �������������
 * @author jjh
 * @time 2015-12-26 14:49
 */
public abstract class BaseDomainService {
	private IRepositoryContext context;
	
	public BaseDomainService(IRepositoryContext context)
	{
		this.context = context;
	}
	
	protected IRepositoryContext context()
	{
		return this.context;
	}
	
}
