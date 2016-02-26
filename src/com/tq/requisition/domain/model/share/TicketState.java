package com.tq.requisition.domain.model.share;

/**
 * ����ȯ״̬ö��
 * @author jjh
 * @time 2015-12-18 18:44
 */
public enum TicketState {
	/**��ʧ*/
	LOSSOFREPORT(1,"��ʧ"),
	/**�ѻ�ȯ*/
	EXCHANGEED(2,"�ѻ�ȯ"),
	/**�Ѳ�ȯ*/
	MENDED(3,"�Ѳ�ȯ"),
	/**�Ѷһ�*/
	USED(4,"�Ѷһ�"),
	/**����ȡ*/
	RECEIVED(5,"����ȡ"),
	/**�Ѷ���*/
	CASHED(6,"�Ѷ���"),
	/**����*/
	NORMAL(7,"����");
	
	/*private fields*/
	private String strV;
	private int v;
	
	/*constructors*/
	private TicketState(int v,String strV)
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
	public TicketState obtainByInt(int v) {
		switch (v) {
		case 1:
			return LOSSOFREPORT;
		case 2:
			return EXCHANGEED;
		case 3:
			return MENDED;
		case 4:
			return USED;
		case 5:
			return RECEIVED;
		case 6:
			return CASHED;
		case 7:
			return NORMAL;
		default:
			throw new IllegalArgumentException("ö��int�������󣬳���ö���޶�,��СֵΪ1�����ֵΪ7");
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
