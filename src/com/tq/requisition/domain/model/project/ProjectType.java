package com.tq.requisition.domain.model.project;

/**
 * ��Ŀ����
 * 
 * @author jjh
 * @time 2015-12-18 12:40
 */
public enum ProjectType {
	/** �ص���Ŀ */
	INFRASTRUCTURE(1, "������ʩ"),
	/** һ����Ŀ */
	OTHER(2, "����");

	/* private fields */
	private int value;
	private String strValue;

	/* contructors */
	private ProjectType(int v, String strValue) {
		this.value = v;
		this.strValue = strValue;
	}

	/**
	 * ����ö�ٵ�intֵ
	 * 
	 * @return
	 */
	public int toValue() {
		return this.value;
	}

	/**
	 * ͨ��intֵ��ȡö������
	 * 
	 * @param v
	 *            int����
	 * @return ö��
	 */
	public ProjectType obtainByInt(int v) {

		switch (v) {
		case 1:
			return INFRASTRUCTURE;
		case 2:
			return OTHER;
		default:
			throw new IllegalArgumentException("ö��int�������󣬳���ö���޶�");
		}
	}

	public String toStr() {
		return strValue;
	}

	public String toStr(int v) {
		switch (v) {
		case 1:
			return "������ʩ";
		case 2:
			return "����";
		default:
			throw new IllegalArgumentException("ö��int�������󣬳���ö���޶�");
		}

	}
}
