package com.tq.requisition.domain.model.roleAccount;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.domain.IRepository.IRepository;
import com.tq.requisition.domain.model.account.Account;
import com.tq.requisition.domain.model.role.Role;

/**
 * ��ɫ�û���ϵ�ִ��ӿ�
 * @author jjh
 * @time 2015-12-21 17:32
 */
public interface IRoleAccountRepository extends IRepository<RoleAccount>{
	/**
	 * �����û�id��ȡ��ɫ
	 * @param uId
	 * 		�û�id
	 * @return Role
	 * 		��ɫ����
	 */
	Role getRoleByUid(UUID uId);
	
	/**
	 * ���ݽ�ɫid��ȡ�û��б�
	 * @param rId
	 * 		��ɫid
	 * @return List<Account>
	 * 		�û�����
	 */
	List<Account> getUsersByRid(UUID rId);
	
	/**
	 * �����˻���ɫ��ϵ	
	 * @param uid
	 * 		�˻�id
	 * @param rId
	 * 		��ɫid
	 */
	void	createRelationship(UUID uid,UUID rId);
		
	/**
	 * ���ָ���˻��Ľ�ɫ
	 * @param uid
	 * 		�˻�id
	 * @param rId
	 * 		��ɫid
	 */
	void removeRelationship(UUID uid,UUID rId);
	
	/**
	 * �Ƴ�ָ���˻������н�ɫ���������ֻ���ɾ�����Ϊtrue
	 * @param uid
	 * 		�˻�id
	 */
	void removeAllRelationships(UUID uid);

	/**
	 * �����û���ɫ
	 * @param uid
	 * 		�û�id
	 * @param roleid
	 * 		��ɫid
	 */
	void	changeRole(UUID uid,UUID roleid);
}
