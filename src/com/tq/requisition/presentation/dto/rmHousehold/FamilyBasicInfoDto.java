package com.tq.requisition.presentation.dto.rmHousehold;

/**
 * ���ڲ�ѯ��������Ϣ
 * @author jjh
 * 	@time 2016-01-21 18:06
 *
 */
public class FamilyBasicInfoDto {
	/**��������*/
	private String name;
	
	/**�������֤*/
	private String idNumber;
	
	/**������Ŀ*/
	private String proName;
	
	/**��ַ*/
	private String address;
	
	/*constructors*/
	public FamilyBasicInfoDto(String name, String idNumber, String proName,
			String address) {
		super();
		this.name = name;
		this.idNumber = idNumber;
		this.proName = proName;
		this.address = address;
	}
	
	/*getters and setter*/
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
}
