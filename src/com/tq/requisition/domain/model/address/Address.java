package com.tq.requisition.domain.model.address;

import java.util.UUID;

import com.tq.requisition.domain.share.AggregateRoot;
import com.tq.requisition.exception.DomainException;

/**
 * ��ַ�ۺϸ�
 * @author jjh
 * @time 2015-12-18 16:37
 */
public class Address extends AggregateRoot{
	/**��ַ����*/
	private String title;
	/**��ַ��·��*/
	private UUID pid;
		
	/*override*/
	@Override
	public String toString() {
		return "Address [title=" + title + ", pid=" + pid + ", id=" + id + "]";
	}
	
	/*getters and setters*/
	public UUID getPid() {
		return pid;
	}

	public void setPid(UUID pid) {
		this.pid = pid;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTitle() {
		return title;
	}
	public void setId(UUID id) {
		this.id = id;
	}
	public UUID getId() {
		return this.id;
	}
	
	/*constructors*/
	public Address(){}	
	public Address(UUID id,String title, UUID pid) {
		super();
		this.id = id;
		this.title = title;
		this.pid = pid;
	}
	
	/*public methods*/
	public static Address obtain(String title,UUID pid) {
		if(title == null)
		{
			throw new NullPointerException("��ַ����Ϊnull");
		}
		return new Address(UUID.randomUUID(), title, pid);		
	}
	
	public void validate() throws DomainException {
		check(title, "��ַ���Ʋ���Ϊ��");
	}
	
}
