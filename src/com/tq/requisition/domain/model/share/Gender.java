package com.tq.requisition.domain.model.share;

/**
 * �Ա�ö��
 * @author jjh
 * @time 2015-12-18 18:44
 */
public enum Gender {
	/**��*/
	MALE(0,"��"),
	/**Ů*/
	FEMALE(1,"Ů");
	
	/*private fields*/
	private String strV;
	private int v;
	
	/*constructors*/
	private Gender(int v,String strV)
	{
		this.v = v;
		this.strV = strV;
	}
	
	public int toValue() {
		return v;
	}
	
	/**
	 * ͨ��intֵ��ȡö��
	 * @param v
	 * @return
	 */
	public Gender obtainByInt(int v) {
		switch (v) {
		case 0:
			return Gender.MALE;
		case 1:
			return Gender.FEMALE;
		default:
			throw new IllegalArgumentException("ö��int�������󣬳���ö���޶�,��СֵΪ0�����ֵΪ1");
		}
	}
	
	public Gender obtainByStr(String s) {
		switch (s) {
		case "��":
			return MALE;

		default:
			return FEMALE;
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
