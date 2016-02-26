package com.tq.requisition.infrastructure.utils;

/**
 * ״̬ö��ֵ��yes,no,all����״̬
 * @author jjh
 * @time 2015-12-30 15:30
 */
public enum ThreeState {
	NO(0,"��"),
	YES(1,"��"),
	ALL(2,"ȫ��");
	
	/*private fields*/
	private int value;
	private String strValue;
	
	/*contructors*/
	private ThreeState(int v,String strValue)
	{
		this.value = v;
		this.strValue = strValue;
	}
		
	/**
	 * ����ö�ٵ�intֵ
	 * @return
	 */
	public int toValue()
	{
		return this.value;
	}
	
	/**
	 * ͨ��intֵ��ȡö������
	 * @param v
	 * 		int����
	 * @return
	 * 		ö��
	 */
	public ThreeState obtainByInt(int v) {
		
		switch (v) {
		case 0:
			return NO;
		case 1:
			return YES;
		case 2:
			return ALL;
		default:
			throw new IllegalArgumentException("ö��int�������󣬳���ö���޶�");
		}
	}

	public String toStr() {
		return strValue;
	}
}
