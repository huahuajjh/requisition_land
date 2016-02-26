package com.tq.requisition.domain.service.domainserviceimpl;

import java.util.UUID;

import com.tq.requisition.domain.IRepository.IRepositoryContext;
import com.tq.requisition.domain.model.account.Account;
import com.tq.requisition.domain.model.account.IAccountRepository;
import com.tq.requisition.domain.model.department.Department;
import com.tq.requisition.domain.model.department.IDepartmentRepository;
import com.tq.requisition.domain.model.organization.IOrganizationRepository;
import com.tq.requisition.domain.model.organization.Organization;
import com.tq.requisition.domain.service.BaseDomainService;
import com.tq.requisition.domain.service.idomainservice.IOrgRemoveService;
import com.tq.requisition.infrastructure.Specifications.deptMgt.DeptRemoveByOrgIdSpecification;

/**
 * ɾ����֯����ʵ����
 * @author jjh
 * @time 2015-12-26 14:51
 */
public class OrgRemoveServiceImpl extends BaseDomainService implements IOrgRemoveService{
	/**��֯�ִ�*/
	private IOrganizationRepository orgRepository;
	/**���Ųִ�*/
	private IDepartmentRepository deptRepository;
	/**�˻��ִ�*/
	private IAccountRepository accountRepository;
	
	public OrgRemoveServiceImpl(//
			IRepositoryContext context,//
			IOrganizationRepository orgRepository,//
			IDepartmentRepository deptRepository,//
			IAccountRepository accountRepository) {	
		super(context);
		this.orgRepository = orgRepository;
		this.orgRepository.setAggregatorRootClass(Organization.class);
		
		this.deptRepository = deptRepository;
		this.deptRepository.setAggregatorRootClass(Department.class);
		
		this.accountRepository = accountRepository;
		this.accountRepository.setAggregatorRootClass(Account.class);
	}

	@Override
	public void removeOrgById(UUID Id) {
		//����ɾ������֯���Ϊɾ��״̬
		orgRepository.removeByKey(Organization.class, Id);
		System.out.println("--------------------------org delete--------------------------");
		//������֯idȥ���Ųִ��б�ǲ���Ϊɾ��״̬
		deptRepository.executeUpdate(new DeptRemoveByOrgIdSpecification(Department.class, Id));
		System.out.println("--------------------------dept delete--------------------------");
		//���˻��ִ��й��ڸò��ŵ�id��¼���Ϊnull״̬
		accountRepository.updateOrg(Id);
		System.out.println("--------------------------acc update--------------------------");
		//�ύ����
		context().commit();
	}

}
