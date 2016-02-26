package com.tq.requisition.domain.model.share;

/**
 * ����ȯʹ������ö��
 * @author jjh
 * @time 2015-12-18 18:44
 */
public enum UseType {
	/**��ʹ��*/
	USED(0,"ʹ��"),
	/**�Ѷ���*/
	CASH(1,"����");
	
	/*private fields*/
	private String strV;
	private int v;
	
	/*constructors*/
	private UseType(int v,String strV)
	{
		this.v = v;
		this.strV = strV;
	}
	
	public UseType obtainByInt(int v) {
		switch (v) {
		case 0:
			return USED;
		case 1:
			return CASH;
		default:
			throw new IllegalArgumentException("ö��int�������󣬳���ö���޶�,��СֵΪ0�����ֵΪ1");
		}
	}
	
	/**
	 * ��ȡö��ֵ��String
	 * @return
	 */
	public String toStr() {
		return this.strV;
	}
	
}
