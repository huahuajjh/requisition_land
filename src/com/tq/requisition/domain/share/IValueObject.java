package com.tq.requisition.domain.share;

/**
 * ֵ����ӿ�
 * @author jjh
 * @time 2015-12-18 11:02
 */
public interface IValueObject<T> {
	boolean sameValueAs(T obj);
}
