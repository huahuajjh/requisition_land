package com.tq.requisition.presentation.dto.project;

import java.util.UUID;

/**
 * ��Ŀ������ģ����ѯģ��
 * 
 * @author jjh
 * @time 2015-12-27 20:47
 */
public class ProQueryModel {
	/* private fields */
	/** ��Ŀ���� */
	private String proName;
	/** ��Ŀ����id */
	private int type = 0;
	/** �������У���1��ʼ������˳�� */
	private int annouceQueue = 0;
	/** �ֵ�id */
	private UUID streetId;
	/** ����id */
	private UUID communityId;
	
	/**�����˵�ID*/
	private String createUId;

	/* constructors */
	public ProQueryModel() {
	}

	public ProQueryModel(String proName, int typeId, int annouceQueue,
			UUID streetId, UUID communityId) {
		this.proName = proName;
		this.type = typeId;
		this.annouceQueue = annouceQueue;
		this.streetId = streetId;
		this.communityId = communityId;
	}

	/* getters and setters */

	public int getTypeId() {
		return type;
	}

	public int getAnnouceQueue() {
		return annouceQueue;
	}

	public UUID getStreetId() {
		return streetId;
	}

	public UUID getCommunityId() {
		return communityId;
	}

	public void setTypeId(int typeId) {
		if (typeId < 0)
			return;
		this.type = typeId;
	}

	public void setAnnouceQueue(int annouceQueue) {
		if(annouceQueue <0) return;
		this.annouceQueue = annouceQueue;
	}

	public void setStreetId(UUID streetId) {
		this.streetId = streetId;
	}

	public void setCommunityId(UUID communityId) {
		this.communityId = communityId;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getCreateUId() {
		return createUId;
	}

	public void setCreateUId(String createUId) {
		this.createUId = createUId;
	}

}
