package com.tq.requisition.domain.model.address;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.domain.IRepository.IRepository;
import com.tq.requisition.exception.DomainException;

/**
 * �B�ӵ�ַ�}�����
 * @author jjh
 * @time 2015-12-27 23��20
 */
public interface IAddressRepository extends IRepository<Address>{
	/**
	 * ���ݸ�id��ȡ�ӽڵ��ַ����
	 * @param pid
	 * 		��id
	 * @return List<Address>
	 * 		�ӽڵ㼯��
	 */
	List<Address> getChildrenAddressByPid(UUID pid);
	
	/**
	 * ��ȡ���ж�����ַ�ڵ�
	 * @return List<Address>
	 * 		������ַ�ڵ㼯������
	 */
	List<Address> getTopAddresses();
	
	/**
	 * ɾ��ָ��id�ĵ�ַ
	 * @param id
	 * 		��ַid
	 */
	void deleteAddressById(UUID... ids);
	
	/**
	 * �޸ĵ�ַ
	 * @param address
	 * 		��ַʵ��
	 */
	void editAddress(Address address);
	
	/**
	 * ������ַ��Ϣ
	 * @param address
	 * 		�������ĵ�ַ��Ϣʵ��
	 * @return Address
	 * 		����������ĵ�ַ��Ϣʵ��
	 */
	Address addAddress(Address address) throws DomainException;	
	
	/**
	 * ��ȡ���е�ַ�б�
	 * @return List<Address>
	 * 		��ַ����
	 */
	List<Address> getAllAddresses();
}
