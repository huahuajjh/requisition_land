package com.tq.requisition.domain.model.share;

/**
 * �˺�״̬
 * @author jjh
 * @time 2015-12-18 19:24 
 */
public enum AccountState {
	/**����*/
	LOCKED(1,"������"),
	/**����*/
	DISABLE(2,"�ѽ���"),
	/**����*/
	ENABLE(3,"����");
	
	/*private fields*/
	private int value;
	private String strValue;
	
	/*contructors*/
	private AccountState(int v,String strValue)
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
	public AccountState obtainByInt(int v) {
		
		switch (v) {
		case 1:
			return LOCKED;
		case 2:
			return DISABLE;
		case 3:
			return ENABLE;
		default:
			throw new IllegalArgumentException("ö��int�������󣬳���ö���޶�����СֵΪ1�����ֵΪ3");
		}
	}

	public String toStr(int v) {
		switch (v) {
		case 1:
			return "������";
		case 2:
			return "�ѽ���";
		case 3:
			return "����";
		default:
			throw new IllegalArgumentException("ö��int�������󣬳���ö���޶�����СֵΪ1�����ֵΪ3");
		}
	}
	
	public String toStr() {
		return strValue;
	}
}
