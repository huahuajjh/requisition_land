package com.tq.requisition.presentation.serviceContract.share;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.presentation.dto.share.AddressDto;

public interface IAddressServiceContract {
	/**
	 * �B�ӫ@ȡ��ַ��Ϣ�����nodeId��null����ʾ�@ȡ���и����c
	 * json{}
	 * @param nodeId
	 * 		���cid
	 * @return
	 */
	String getAddress(UUID nodeId);
	
	/**
	 * �@ȡ��ַ������Ϣ
	 * @return
	 */
	List<AddressDto> getAddress();
	
	/**
	 * ������ַ�ڵ�
	 * @param ads
	 * 		��ַ�ڵ�ʵ��
	 * @return
	 */
	String addNewAddress(AddressDto ads);
	
	/**
	 * �༭��ַ��Ϣ
	 * @param ads
	 * 		�����µĵ�ַdto����
	 * @return
	 */
	String editAddress(AddressDto ads);
	
	/**
	 * ����idɾ����ַ�ڵ�����
	 * @param id
	 * 		��ɾ����ַ�ڵ��id
	 * @return
	 */
	String deleteAddress(UUID... id);
	
	/**
	 * ��ȡ���е�ַ��Ϣ
	 * @return AddressDto
	 * 		json
	 */
	String getAllAddresses();
}
