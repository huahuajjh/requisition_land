package com.tq.requisition.presentation.serviceContract.userAssociated;

import java.util.UUID;

import com.tq.requisition.presentation.dto.sysMgt.AccountSafeDto;


/**
 * �û���ز�����Լ�ӿ�
 * @author jjh
 * @time 2015-12-21 21:50
 */
public interface IUserService {
	/**
	 * �û���½
	 * @param account
	 * 		��½�˻�
	 * @param pwd
	 * 		�û�����
	 * @return boolean
	 * 		��½�Ƿ�ɹ���־
	 */
	boolean login(String account,String pwd);
	
	/**
	 * ��½
	 * @param account
	 * 		�˻�
	 * @param pwd
	 * 		����
	 * @return
	 * 		��½ʵ��
	 */
	AccountSafeDto login4session(String account,String pwd);
	
	/**
	 * ����id��ȡ�û�����
	 * @param id
	 * 		id
	 * @return
	 * 		AccountDto
	 */
	AccountSafeDto getUserById(UUID id);
		
	/**
	 * �޸�����
	 * @param uId
	 * 		���޸�������˺�
	 * @param DomainException
	 * 		�����쳣ʵ��
	 * @param oldPwd
	 * 		������
	 * @param newPwd
	 * 		������
	 */
	String changePwd(UUID uId,String oldPwd,String newPwd);
	
}
