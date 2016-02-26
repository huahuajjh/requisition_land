package com.tq.requisition.domain.model.share;

public enum HouseholdType {
	/**ũҵ����*/
	FARMER(0,"ũҵ����"),
	/**���񻧿�*/
	CITY(1,"���񻧿�");
	
	/*private fields*/
	private String strV;
	private int v;
	
	/*constructors*/
	private HouseholdType(int v,String strV)
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
	public HouseholdType obtainByInt(int v) {
		switch (v) {
		case 0:
			return HouseholdType.FARMER;
		case 1:
			return HouseholdType.CITY;
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
