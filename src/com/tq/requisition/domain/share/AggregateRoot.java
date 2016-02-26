package com.tq.requisition.domain.share;

import java.util.UUID;

import com.tq.requisition.exception.DomainException;

/**
 * �����ۺϸ����͵Ļ�����
 * 
 * @author jjh
 * @time 2015-12-14 13:30
 */
public abstract class AggregateRoot implements IAggregateRoot {
	/* domainʵ���Ψһ��ʶ */
	protected UUID id;

	// public methods
	@Override
	public boolean equals(Object obj) {
		// TODO
		return super.equals(obj);
	}

	@Override
	public int hashCode() {
		return this.id.hashCode();
	}

	@Override
	public UUID id() {
		return this.id;
	}

	@Override
	public void id(UUID _id) {
		this.id = _id;
	}

	public void check(Object str,String msg) throws DomainException {
		if (null == str || str.toString().trim().equals("")) {
			throw new DomainException(msg);
		}
	}
}
