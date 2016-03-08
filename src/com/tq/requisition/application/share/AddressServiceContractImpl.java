package com.tq.requisition.application.share;

import java.util.List;
import java.util.UUID;

import com.tq.requisition.application.BaseApplication;
import com.tq.requisition.autoMapper.AddressMapper;
import com.tq.requisition.domain.IRepository.IRepositoryContext;
import com.tq.requisition.domain.model.address.Address;
import com.tq.requisition.domain.model.address.IAddressRepository;
import com.tq.requisition.infrastructure.Specifications.address.AddressDelSpecification;
import com.tq.requisition.infrastructure.utils.Formater;
import com.tq.requisition.presentation.dto.share.AddressDto;
import com.tq.requisition.presentation.serviceContract.share.IAddressServiceContract;

public class AddressServiceContractImpl extends BaseApplication implements IAddressServiceContract{
	private IAddressRepository addressRepository;

	public AddressServiceContractImpl(//
			IRepositoryContext context,//
			IAddressRepository addressRepository) {
		super(context);
		this.addressRepository = addressRepository;
		this.addressRepository.setAggregatorRootClass(Address.class);
	}

	@Override
	public String getAddress(UUID nodeId) {
		try {
			List<Address> list = addressRepository.getChildrenAddressByPid(nodeId);
			List<AddressDto> dtos = AddressMapper.toDtoList(list);
			return toJson("��ȡ��ַ���ϳɹ�", dtos, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			return toJson("��ȡ��ַ����ʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
	}

	@Override
	public List<AddressDto> getAddress() {
			List<Address> list = addressRepository.getTopAddresses();
			List<AddressDto> dtos = AddressMapper.toDtoList(list);
			return dtos;
	}

	@Override
	public String addNewAddress(AddressDto ads) {
		context().beginTransaction();
		Address address = AddressMapper.toModel(ads);
		try {
			addressRepository.addAddress(address);
			context().commit();
			return toJson("������ַ�ɹ�", AddressMapper.toDto(address), Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			return toJson("������ַʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}finally{
		}
	}

	@Override
	public String editAddress(AddressDto ads) {
		Address address = AddressMapper.toModel(ads);	
		try {
			context().beginTransaction();
			address = addressRepository.getByKey(Address.class, ads.getId());
			address.setPid(ads.getPid());
			address.setTitle(ads.getName());
			addressRepository.update(address);
			context().commit();
			return toJson("�޸ĵ�ַ�ɹ�", null, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			return toJson("�޸ĵ�ַʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}
	}

	@Override
	public String deleteAddress(UUID... id) {
		try {
			context().beginTransaction();
			for (UUID uuid : id) {
				addressRepository.executeUpdate(new AddressDelSpecification(Address.class, uuid));
			}
			context().commit();
			return toJson("ɾ���ɹ�", null, Formater.OperationResult.SUCCESS);
		} catch (Exception e) {
			return toJson("ɾ��ʧ��-"+e.getMessage(), null, Formater.OperationResult.FAIL);
		}		
	}
	
	@Override
	public String getAllAddresses() {
		List<Address> list = addressRepository.getAllAddresses();
		if(null==list){
			return toJson("δ��ȡ����ַ�б�", null, Formater.OperationResult.FAIL);
		}
		return toJson("��ȡ��ַ�б�ɹ�", AddressMapper.toDtoList(list), Formater.OperationResult.SUCCESS);
	}

}
