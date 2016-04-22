package com.tq.requisition.application.sysManagement;

import java.util.UUID;

import com.tq.requisition.application.BaseApplication;
import com.tq.requisition.autoMapper.AccountMapper;
import com.tq.requisition.autoMapper.AccountSafeMapper;
import com.tq.requisition.domain.IRepository.IRepositoryContext;
import com.tq.requisition.domain.model.account.Account;
import com.tq.requisition.domain.model.account.IAccountRepository;
import com.tq.requisition.domain.model.department.Department;
import com.tq.requisition.domain.model.department.IDepartmentRepository;
import com.tq.requisition.domain.model.organization.IOrganizationRepository;
import com.tq.requisition.domain.model.organization.Organization;
import com.tq.requisition.domain.model.roleAccount.IRoleAccountRepository;
import com.tq.requisition.domain.model.roleAccount.RoleAccount;
import com.tq.requisition.exception.AccountOperationException;
import com.tq.requisition.infrastructure.utils.ConfigFileUtil;
import com.tq.requisition.infrastructure.utils.Formater;
import com.tq.requisition.infrastructure.utils.PageFormater;
import com.tq.requisition.presentation.dto.sysMgt.AccountDto;
import com.tq.requisition.presentation.serviceContract.sysManagement.IAccountService;

/**
 * �˻���ز���ʵ����
 * @author jjh
 * @time 2015-12-23 16:22
 * 
 * ʵ���˼���˺��Ƿ���ڵĽӿ�
 * @author Bless
 * @time 2016/3/3 9:54
 */
public class AccountServiceImpl extends BaseApplication implements IAccountService{
	/*private fields*/
	private IAccountRepository accountRepository;
	private IDepartmentRepository departmentRepository;
	private IOrganizationRepository organizationRepository;
	private IRoleAccountRepository roleAccountRepository;
	
	/*consrtuctors*/
	public AccountServiceImpl(
			IRepositoryContext context,
			IAccountRepository _accountRepository
			,IDepartmentRepository _departmentRepository
			,IOrganizationRepository _organizationRepository
			,IRoleAccountRepository roleAccountRepository) {
		super(context);
		
		this.accountRepository = _accountRepository;
		this.accountRepository.setAggregatorRootClass(Account.class);
		
		this.departmentRepository = _departmentRepository;
		this.departmentRepository.setAggregatorRootClass(Department.class);
		
		this.organizationRepository = _organizationRepository;
		this.organizationRepository.setAggregatorRootClass(Organization.class);
		
		this.roleAccountRepository = roleAccountRepository;
		this.roleAccountRepository.setAggregatorRootClass(RoleAccount.class);
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public String createAccount(AccountDto accountDto){
		if(validateAdmin(accountDto.getAccount()))
		{
			return toJson("�����˻�ʧ��-�˻���["+accountDto.getAccount()+"]�Ѵ���", null, Formater.OperationResult.FAIL);
		}
		try {
			context().beginTransaction();
			Account account = accountRepository.createAccount(AccountMapper.toModel(accountDto));
			context().commit();
			return toJson("�����˻��ɹ�", AccountSafeMapper.toDto(account), Formater.OperationResult.SUCCESS);
		} catch (AccountOperationException e) {
			return toJson("�����˻�ʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
	}

	@Override
	public boolean checkAccountExists(String account) {
		//Bless 2016/3/3 9:45
		return accountRepository.existsByAccount(account);
	}

	@Override
	public String disableAccount(UUID id) {
		try {
			context().beginTransaction();
			Account acc = accountRepository.getByKey(Account.class, id);
			acc.setState(1);
			accountRepository.updateAccount(acc);
			context().commit();
			return toJson("�����˻��ɹ�", null, Formater.OperationResult.SUCCESS);
		} catch (AccountOperationException e) {
			return toJson("�����˻�ʧ��-"+e.getMessage(),null, Formater.OperationResult.FAIL);
		}
	}

	@Override
	public String enableAccount(UUID id) {
		// TODO Auto-generated method stub
		return "";
	}

	@Override
	public String updateAccount(AccountDto dto) {
		try {
			context().beginTransaction();
			Account acc = AccountMapper.toModel(dto);
			acc.setId(dto.getId());
			accountRepository.updateAccount(acc);
			context().commit();
			return toJson("�����˻��ɹ�", null, Formater.OperationResult.SUCCESS);
		} catch (AccountOperationException e) {
			return toJson("�����˻�ʧ��-"+e.getMessage(),null, Formater.OperationResult.FAIL);
		}
	}
	
	@Override
	public String removeAccount(UUID uid) { 
		try {
			context().beginTransaction();
			accountRepository.removeByKey(Account.class, uid);
			roleAccountRepository.removeAllRelationships(uid);
			context().commit();
			return toJson("ɾ���˻��ɹ�",null, Formater.OperationResult.SUCCESS); 
		} catch (Exception e) {
			return toJson("ɾ���˻�ʧ��-"+e.getMessage(),null, Formater.OperationResult.FAIL);
		}
		
	}

	@Override
	public String resetAccountPassword(UUID uId) {
		try {
			context().beginTransaction();
			Account account = accountRepository.getByKey(Account.class, uId);
			account.resetPwd();
			accountRepository.update(account);
			context().commit();
			return toJson("��������ɹ�", null, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			return toJson("��������ʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
	}

	@Override
	public String getAccountList(String userName, String name, UUID orgId, UUID deptId, int pageIndex, int pageNum) {
		try {
			PageFormater page = accountRepository.queryByPage(userName, name, orgId, deptId, pageIndex, pageNum);
			return toJsonByPage(page, "��ȡ�˻��б�ɹ�", Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			return toJsonByPage(null, "��ȡ�˻��б�ʧ��-"+e.getMessage(), Formater.OperationResult.FAIL);	
		}
	}

	private boolean validateAdmin(String acc) {
		String admin = ConfigFileUtil.readByKey("acc");
		if(acc.trim().equals(admin)){return true;}
		return false;
	}
}
