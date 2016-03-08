package com.tq.requisition.presentation.actions.management;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import com.tq.requisition.infrastructure.utils.Formater.OperationResult;
import com.tq.requisition.infrastructure.utils.Serialization;
import com.tq.requisition.presentation.actions.BaseAction;
import com.tq.requisition.presentation.dto.sysMgt.AccountDto;
import com.tq.requisition.presentation.dto.sysMgt.OrgDto;
import com.tq.requisition.presentation.dto.sysMgt.RoleDto;
import com.tq.requisition.presentation.serviceContract.sysManagement.IAccountService;
import com.tq.requisition.presentation.serviceContract.sysManagement.IOrgMgtService;
import com.tq.requisition.presentation.serviceContract.sysManagement.IRoleService;

@SuppressWarnings("serial")
public class AccountManagement extends BaseAction {

	public AccountManagement() {
		this.orgService = getService("orgMgtService", IOrgMgtService.class);
		this.roleService = getService("roleService", IRoleService.class);
		this.accountService = getService("accountService",
				IAccountService.class);
	}

	// ���ݻ�ȡ/��������
	private IOrgMgtService orgService;
	private IRoleService roleService;
	private IAccountService accountService;

	// Jspҳ���ȡ����
	private List<OrgDto> orgDtoList;
	private List<RoleDto> roleDtoList;

	// ǰ�δ�������
	private String account = "";
	private String name = "";
	private String orgId = "";
	private String deptId = "";
	private String Id = "";
	private int pageNum = 30;
	private int pageIndex = 1;
	
	private String dataJson;

	public void setDataJson(String dataJson) {
		this.dataJson = dataJson;
	}

	public void setAccount(String account) {
		if (account == null)
			return;
		this.account = account;
	}

	public void setName(String name) {
		if (name == null)
			return;
		this.name = name;
	}

	public void setOrgId(String orgId) {
		if (orgId == null)
			return;
		this.orgId = orgId;
	}

	public void setDeptId(String deptId) {
		if (deptId == null)
			return;
		this.deptId = deptId;
	}

	public void setId(String id) {
		if (id == null)
			return;
		Id = id;
	}

	public void setPageNum(int pageNum) {
		if (pageNum < 1)
			return;
		this.pageNum = pageNum;
	}

	public void setPageIndex(int pageIndex) {
		if (pageIndex < 1)
			return;
		this.pageIndex = pageIndex;
	}

	public List<OrgDto> getOrgDtoList() {
		return orgDtoList;
	}

	public List<RoleDto> getRoleDtoList() {
		return roleDtoList;
	}

	public String sysAccountQuery() {
		orgDtoList = orgService.getOrgList();
		roleDtoList = roleService.getRoleList();
		return SUCCESS;
	}

	public String sysCreateAccount() {
		orgDtoList = orgService.getOrgList();
		roleDtoList = roleService.getRoleList();
		return SUCCESS;
	}

	// ��ȡ�û��б�
	public String list() throws IOException {
		UUID orgKeyId = orgId.equals("") ? null : UUID.fromString(orgId);
		UUID depKeyId = deptId.equals("") ? null : UUID.fromString(deptId);
		String listData = this.accountService.getAccountList(account, name, orgKeyId, depKeyId, pageIndex, pageNum);
		response().getWriter().write(listData);
		return null;
	}

	// �����û�
	public String add() throws IOException {
		AccountDto dto = Serialization.toObject(dataJson, AccountDto.class);
		String optState = this.accountService.createAccount(dto);
		response().getWriter().write(optState);
		return null;
	}
	
	//�޸��û���ϸ��Ϣ
	public String edit() throws IOException{
		AccountDto dto = Serialization.toObject(dataJson, AccountDto.class);
		String optState = this.accountService.updateAccount(dto);
		response().getWriter().write(optState);
		return null;
	}
	
	//�����û�����
	public String reset() throws IOException{
		String optState = this.accountService.resetAccountPassword(UUID.fromString(Id));
		response().getWriter().write(optState);
		return null;
	}
	
	//�����˻�
	public String disable(){
		String optState = this.accountService.disableAccount(UUID.fromString(Id));
		return null;
	}
	
	//����˺��Ƿ����
	public String existsAccount() throws IOException{
		String stateJsonString = "";
		if(account == null || account.equals("") || accountService.checkAccountExists(account)){
			stateJsonString = toForMaterJson(OperationResult.ERROR,"�˻���["+account+"]�Ѵ���");
		} else {
			stateJsonString = toForMaterJson(OperationResult.SUCCESS,"�û���������");
		}
		response().getWriter().write(stateJsonString);
		return null;
	}
}
