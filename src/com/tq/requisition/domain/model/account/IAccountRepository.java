package com.tq.requisition.domain.model.account;

import java.util.UUID;

import com.tq.requisition.domain.IRepository.IRepository;
import com.tq.requisition.domain.model.share.AccountState;
import com.tq.requisition.exception.AccountOperationException;
import com.tq.requisition.exception.DomainException;
import com.tq.requisition.infrastructure.utils.PageFormater;

/**
 * ��ʾ�˻��ľۺϸ��ִ��ӿ�
 * @author jjh
 * @time 2015-12-20 23:26
 * 
 * ����һ������û��˺��Ƿ���ڵĽӿ�
 * @author Bless
 * @time 2016/3/3 9:51
 */
public interface IAccountRepository extends IRepository<Account>{
	/**
	 * ��½�˻����
	 * @param account
	 * 		�˻���
	 * @param pwd
	 * 		�˻�����
	 * @return boolean
	 * 		����һ��booleanֵ�������������û����������Ƿ���ڶ�Ӧ���˻�
	 */
	boolean login(String account,String pwd);
	
	/**
	 * ��½�˻����
	 * @param account
	 * 		�˻���
	 * @param pwd
	 * 		�˻�����
	 * @return Account
	 */
	Account login4session(String account,String pwd);
	
	/**
	 * ����id��ȡ�û�ʵ��
	 * @param id
	 * 		�û�id
	 * @return
	 */
	Account getById(UUID id);
	
	/**
	 * �������˻�
	 * @param account
	 * 		�˻�ʵ��
	 * @return TODO
	 */
	Account createAccount(Account account) throws AccountOperationException;
	
	/**
	 * �����˻�
	 * @param account
	 * 		�˻���
	 * @param pwd
	 * 		����
	 * @param state
	 * 		�˻�״̬
	 * @param name
	 * 		����
	 */
	public void createAccount(String account,String pwd,AccountState state,String... name);
	
	/**
	 * �޸�����
	 * @param id
	 * 		�˻�id
	 * @param oldPwd
	 * 		������
	 * @param newPwd
	 * 		������
	 */
	public void changePwd(UUID id,String oldPwd,String newPwd) throws DomainException;
	
	/**
	 * �����˻�
	 * @param id
	 * 		�˻�id
	 */
	public void disableAccount(UUID id);
	
	/**
	 * �����˻���Ϣ
	 * @param account
	 * 		�����µ��˻�
	 */
	public void updateAccount(Account account) throws AccountOperationException ;
	
	/**
	 * ���˻�
	 * @param id
	 * 		�˻�id
	 */
	public void lockAccount(UUID id);

	/**
	 * �����˻�
	 * @param id
	 * 		�˻�id
	 */
	public void enableAccount(UUID id);
	
	/**
	 * �����û�id����Ƿ���ڸ��û�
	 * @param id
	 * 		�û�id
	 * @return boolean
	 * 		������ڸ��û�����true�����򷵻�false
	 */
	public boolean existsById(UUID id);
	
	/**
	 * �����ɾ�����ż���֯
	 * @param orgid
	 * 		��ɾ����֯id
	 */
	public void updateOrg(UUID orgid);
	
	/**
	 * �����˻��ִ��б�ɾ�������в���idΪnull
	 * @param deptid
	 * 		��ɾ���Ĳ���id
	 */
	public void updateDept(UUID deptid);	

	/**
	 * ָ����ɫ��ɾ��ʱ�����������˺Ųִ��Ľ�ɫ��Ϣ
	 * @param rid
	 * 		��ɾ���Ľ�ɫid
	 */
	public void updateRole(UUID rid);
	
	/**
	 * ��ҳ��ȡ�˻��б�
	 * @param userName
	 * 		�û���
	 * @param name
	 * 		����
	 * @param orgId
	 * 		��λid
	 * @param deptId
	 * 		����id
	 * @param pageIndex
	 * 		��ʼҳ
	 * @param pageNum
	 * 		ҳ��
	 * @return List<Account>
	 * 		�˻�����
	 */
	PageFormater queryByPage(String userName, String name, UUID orgId, UUID deptId, int pageIndex, int pageNum);
	
	/**
	 * �����û��˺ż���Ƿ���ڸ��û�
	 * @param account
	 * 		�û��˺�
	 * @return boolean
	 * 		������ڸ��û�����true�����򷵻�false
	 */
	public boolean existsByAccount(String account);
}
