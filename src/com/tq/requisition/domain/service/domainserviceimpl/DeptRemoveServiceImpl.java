package com.tq.requisition.domain.service.domainserviceimpl;

import java.util.UUID;

import com.tq.requisition.domain.IRepository.IRepositoryContext;
import com.tq.requisition.domain.model.account.Account;
import com.tq.requisition.domain.model.account.IAccountRepository;
import com.tq.requisition.domain.model.department.Department;
import com.tq.requisition.domain.model.department.IDepartmentRepository;
import com.tq.requisition.domain.service.BaseDomainService;
import com.tq.requisition.domain.service.idomainservice.IDeptRemoveService;

/**
 * ɾ������ʵ����
 * 
 * @author jjh
 * @time 2015-12-26 16:01
 */
public class DeptRemoveServiceImpl extends BaseDomainService implements IDeptRemoveService{
	//�˻��ִ�
	private IAccountRepository accountRepository;
	//���Ųִ�
	private IDepartmentRepository deptRepository;	

	public DeptRemoveServiceImpl(
			IRepositoryContext context,
			IAccountRepository accountRepository,
			IDepartmentRepository deptRepository) {
		
		super(context);		
		this.accountRepository = accountRepository;
		this.accountRepository.setAggregatorRootClass(Account.class);
		
		this.deptRepository = deptRepository;
		this.deptRepository.setAggregatorRootClass(Department.class);
	}

	@Override
	public void removeDept(UUID deptId) {
		//����ɾ���Ĳ��ű��Ϊɾ��״̬
		deptRepository.removeDept(deptId);
		//�������еĹ��ڱ�ɾ�����ŵ��˻��Ĳ�����Ϣ��עΪnull
		accountRepository.updateDept(deptId);
	}

}
