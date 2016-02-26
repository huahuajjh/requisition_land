package com.tq.requisition.infrastructure.utils;

import java.io.Serializable;

/**
 * ���ݴ����ʽ,���಻�ܱ��̳�
 * @author jjh
 * @time 2015-12-23 20:26
 */
@SuppressWarnings("serial")
public final class Formater implements Serializable{
	/*private fields*/
	private String msg;
	private Object data;
	private OperationResult type;
	
	/*getters*/
	public String getMsg() {
		return msg;
	}

	public Object getData() {
		return data;
	}

	public OperationResult getType() {
		return type;
	}

	/*constructors*/
	private Formater(String msg, Object data, OperationResult type) {
		this.msg = msg;
		this.data = data;
		this.type = type;
	}

	/*public methods*/
	public static Formater obtain(String msg,Object data,OperationResult type) {
		return new Formater(msg, data, type);
	}
	
	/**
	 * �����������
	 * @author jjh
	 *
	 */
	public static enum OperationResult
	{
		/**�ɹ�*/
		SUCCESS,
		/**����*/
		ERROR,
		/*ʧ��*/
		FAIL
	}
}
