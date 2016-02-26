package com.tq.requisition.domain.model.share;

public enum RelationshipType {
	/**����*/
	SON(0,"����"),
	/**Ů��*/
	DAUGHTER(1,"Ů��"),
	/**����*/
	WIFE(2,"����"),
	/**�ɷ�*/
	HUSBAND(3,"�ɷ�");
	
	
	/*private fields*/
	private String strV;
	private int v;
	
	/*constructors*/
	private RelationshipType(int v,String strV)
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
	public RelationshipType obtainByInt(int v) {
		switch (v) {
		case 0:
			return RelationshipType.SON;
		case 1:
			return RelationshipType.DAUGHTER;
		case 2:
			return RelationshipType.WIFE;
		case 3:
			return RelationshipType.HUSBAND;
		default:
			throw new IllegalArgumentException("ö��int�������󣬳���ö���޶�,��СֵΪ0�����ֵΪ3");
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
