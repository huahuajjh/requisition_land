package com.tq.requisition.domain.model.removedInfo;

import java.util.Date;
import java.util.UUID;

import com.tq.requisition.domain.share.AggregateRoot;
import com.tq.requisition.exception.DomainException;

/**
 * ��Ǩ���ۺϸ�
 * @author jjh
 * @time 2015-12-18 19:05
 */
public class RemovedInfo extends AggregateRoot{
	/**����*/
	private String name;
	/**���֤��*/
	private String idNumber;
	/**��������*/
	private Date birthday;
	/**��ַ*/
	private String address;
	/**�ֵ���Ϣ��ַ*/
	private UUID streetId;
	/**�ֵ���Ϣ��ַ*/
	private UUID communityId;
	/**��Ǩ����*/
	private Date removeDate;
	/**�Ƿ�ɾ��*/
	private boolean del;
	
	public RemovedInfo(){
		this.id = UUID.randomUUID();
		this.del = false;
	}
	
	/*getters and setters*/
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
	public Date getBirthDay() {
		return birthday;
	}
	public void setBirthDay(Date birthDay) {
		this.birthday = birthDay;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public UUID getStreetId() {
		return streetId;
	}
	public void setStreetId(UUID streetId) {
		this.streetId = streetId;
	}
	public UUID getCommunityId() {
		return communityId;
	}
	public void setCommunityId(UUID communityId) {
		this.communityId = communityId;
	}
	public Date getRemoveDate() {
		return removeDate;
	}
	public void setRemoveDate(Date removeDate) {
		this.removeDate = removeDate;
	}
	public boolean getDel() {
		return del;
	}
	public void setDel(boolean del) {
		this.del = del;
	}
	public UUID getId() {
		return this.id;
	}
	public void setId(UUID id) {
		this.id = id;
	}
	
	/*public methods*/
	public void validate() throws DomainException {
		check(this.idNumber, "���֤����Ϊ��");
		check(this.name, "��������Ϊ��");
		check(this.birthday, "�������ڲ���Ϊ��");
		check(this.removeDate, "��Ǩ���ڲ���Ϊ��");
	}
	
	public void modify(RemovedInfo entity) {
		this.address = entity.getAddress();
		this.birthday = entity.getBirthDay();
		this.communityId = entity.getCommunityId();
		this.streetId = entity.getStreetId();
		this.idNumber = entity.getIdNumber();
		this.name = entity.getName();
		this.removeDate = entity.getRemoveDate();
	}
}
