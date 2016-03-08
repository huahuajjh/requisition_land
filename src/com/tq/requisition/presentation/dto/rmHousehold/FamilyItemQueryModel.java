package com.tq.requisition.presentation.dto.rmHousehold;

import java.util.UUID;

import com.tq.requisition.infrastructure.utils.ThreeState;

/**
 * ģ����ѯ��Ǩ��Աmodel
 * @author jjh
 * @time 2015-12-29 15��39
 *
 */
public class FamilyItemQueryModel {
		/*private fields*/
		/**���֤*/
		private String idNumber;
		/**��Ŀ����*/
		private String proName;
		/**�Ƿ��Ƕ�����Ůö��*/
		private ThreeState isOnlyChild;
		/**�Ƿ��ǰ�߻�*/
		private ThreeState half;
		/**the street address id*/
		private UUID streetId;
		/**the community address id*/
		private UUID communityId;
		/**�Ƿ�ת��ö��*/
		private ThreeState isTransfer;
		/**�Ƿ��籣ö��*/
		private ThreeState isSSecurity;
		/**���ַid*/
		private UUID groupId;
		/**����*/
		private String name;
		/**��������*/
		private String headName;
		/**�����˵�ID*/
		private String createUId;
		
		public String getIdNumber() {
			return idNumber;
		}
		public void setIdNumber(String idNumber) {
			this.idNumber = idNumber;
		}
		public String getProName() {
			return proName;
		}
		public void setProName(String proName) {
			this.proName = proName;
		}
		public ThreeState getIsOnlyChild() {
			return isOnlyChild;
		}
		public void setIsOnlyChild(ThreeState isOnlyChild) {
			this.isOnlyChild = isOnlyChild;
		}
		public ThreeState isHalf() {
			return half;
		}
		public void setHalf(ThreeState half) {
			this.half = half;
		}
		public UUID getStreetId() {
			return streetId;
		}
		public void setStreetId(UUID streetId) {
			this.streetId = streetId;
		}
		public UUID getCommunityId() {
			return communityId;
		}
		public void setCommunityId(UUID communityId) {
			this.communityId = communityId;
		}
		public ThreeState getIsTransfer() {
			return isTransfer;
		}
		public void setIsTransfer(ThreeState isTransfer) {
			this.isTransfer = isTransfer;
		}
		public ThreeState getIsSSecurity() {
			return isSSecurity;
		}
		public void setIsSSecurity(ThreeState isSSecurity) {
			this.isSSecurity = isSSecurity;
		}
		public UUID getGroupId() {
			return groupId;
		}
		public void setGroupId(UUID groupId) {
			this.groupId = groupId;
		}
		public ThreeState getHalf() {
			return half;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getHeadName() {
			return headName;
		}
		public void setHeadName(String headName) {
			this.headName = headName;
		}
		public String getCreateUId() {
			return createUId;
		}
		public void setCreateUId(String createUId) {
			this.createUId = createUId;
		}
		
}
