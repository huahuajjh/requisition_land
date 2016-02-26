package com.tq.requisition.presentation.serviceContract.sysManagement;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.presentation.dto.sysMgt.ResDto;

/**
 * �@ȡ��Դ����
 * 
 * @author Bless
 * @version 1.0
 * @time 2015/12/24 15:51
 */
public interface IGetResService {
	/**
	 * �����û���ʶ��ȡ�û��˵���Դ
	 * 
	 * @param uId
	 *            �û���ʶ
	 * @param hierarchy
	 *            �㼶
	 * @return �˵���Դ
	 */
//	List<ResDto> getMenuResByUserId(UUID uId, int hierarchy);
	
	/**
	 * �����û���ʶ��ȡ�û��˵���Դ
	 * 
	 * @param uId
	 *            �û���ʶ
	 * @param hierarchy
	 *            �㼶
	 * @return �˵���Դ
	 */
//	String getMenuResByUserIdJSON(UUID uId, int hierarchy);

	/**
	 * �����û�Id�͸��ڵ�Id��ȡ��Դ
	 * 
	 * @param uId
	 *            �û�Id
	 * @param type
	 *            ��Դ����
	 * @param hierarchy
	 *            �㼶
	 * @return ��Դ����
	 */
//	List<ResDto> getResByUserIdAndType(UUID uId, ResourceType type, int hierarchy);
	
	/**
	 * �����û�Id�͸��ڵ�Id��ȡ��Դ
	 * 
	 * @param uId
	 *            �û�Id
	 * @param type
	 *            ��Դ����
	 * @param hierarchy
	 *            �㼶
	 * @return ��Դ����
	 */
//	String getResByUserIdAndTypeJSON(UUID uId,ResourceType type, int hierarchy);
	
	/**
	 * �����û�id��ȡ��Դ����
	 * @param uid
	 * 		�û�id
	 * @return List<ResDto>
	 * 		��Դ����
	 */
	List<ResDto> getResByUserId(UUID uid);
	
	/**
	 * �����û�id��ȡ��Դ����
	 * @param uid
	 * @return
	 */
	String getResByUserIdJson(UUID uid);
}
