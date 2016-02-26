package com.tq.requisition.presentation.serviceContract.sysManagement;

import java.util.UUID;

import com.tq.requisition.presentation.dto.sysMgt.AccountDto;

/**
 * �˻���ز�����Լ�ӿ�
 * 
 * @author jjh
 * @time 2015-12-23 15:37
 */
public interface IAccountService {
	/**
	 * �����˻��ӿ�-
	 * 
	 * @param accountDto
	 * 		�˻�dto
	 * @return TODO
	 */
	String createAccount(AccountDto accountDto);
	
	/**
	 * ����˻��Ƿ����
	 * 
	 * @param account
	 *            �˻���
	 * @return boolean ����һ��booleanֵ����ָ����ָ���˻����Ƿ����
	 */
	boolean checkAccountExists(String account);

	/**
	 * �����˻��ӿ�-
	 * 
	 * @param id
	 * 		�˻�id
	 * @return TODO
	 */
	String disableAccount(UUID id);
	
	/**
	 * �����û�����Ϊ 1234567
	 * 
	 * @param uId
	 *            �û���ʶ
	 * @return
	 */
	String resetAccountPassword(UUID uId);
	
	/**
	 * ģ����ѯ�˺����ݣ���ע�⣺�������治�ܰ������������ 
	 * Json��[AccountDto...]
	 * 
	 * @param userName
	 *            �˺ţ�ע�⣺�� ��ʾ��ȡ������Ա��
	 * @param name
	 *            ������ע�⣺�� ��ʾ��ȡ������Ա��
	 * @param orgId
	 *            ������֯��ע�⣺null ��ʾ��ȡ������֯��Ա��
	 * @param deptId
	 *            �������ţ���Ҫ��null ��ʾ��ȡ���в�����Ա��
	 * @param pageIndex
	 *            ҳ�루Ĭ�ϴ�1��ʼ��
	 * @param pageNum
	 *            ÿҳ��ʾ������ Ĭ�ϴ�1 ��ʼ
	 * @return
	 */
	String getAccountList(String userName, String name, UUID orgId,
			UUID deptId, int pageIndex, int pageNum);
	
	/**
	 * �����˻��ӿ�
	 * 
	 * @param id
	 * 		�˻�id
	 * @return TODO
	 */
	String enableAccount(UUID id);

	/**
	 * �����˻���Ϣ
	 * @param dto
	 * 		�˻���Ϣdto
	 * @return
	 */
	String updateAccount(AccountDto dto);
		
	/**
	 * ɾ���˻�
	 * @param uid
	 * 		��ɾ���˻���id
	 * @return
	 */
	String removeAccount(UUID uid);
}
