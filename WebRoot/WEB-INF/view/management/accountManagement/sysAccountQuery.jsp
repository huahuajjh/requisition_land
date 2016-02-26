<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
.select_top {
	width: 30px;
	background: transparent !important;
	border: 0px !important;
	-webkit-box-shadow: none !important;
	box-shadow: none !important;
}
</style>
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6>
			<i class="glyphicon glyphicon-search"></i> 查询人员
		</h6>
		<div class="panel-actions">
			<a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
		</div>
	</div>
	<div class="panel-body">
		<form onsubmit="return false;">
			<div class="row">
				<div class="col-md-3">
					<div class="form-group">
						<label>账号</label>
						<input type="text" id="username" class="form-control" placeholder="请输入要查询的账号" maxlength="15" />
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label>姓名</label>
						<input type="text" id="name" class="form-control" placeholder="请输入要查询的账号" maxlength="5" />
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label>组织</label>
						<select class="form-control" id="organization">
							<option value="">全部组织</option>
							<s:iterator id="dto" value="orgDtoList">
								<option value="<s:property value='#dto.getId()' />">
									<s:property value='#dto.getName()' />
								</option>
							</s:iterator>
						</select>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label>部门</label>
						<select class="form-control" id="department">
							<option value="">所有部门</option>
						</select>
					</div>
				</div>
				<div class="col-md-12">
				<hr>
				<div class="btn-group pull-right"">
				<button type="button"  class="btn btn-bg btn-primary" onclick="tableData.goPage(1);">查询</button>
			</div>
				</div>
			</div>
		</form>
	</div>
</div>

<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<div class="row">
			<div class="col-xs-5 text-left bk-vcenter">
				<h6>
					<i class="fa fa-table red"></i><span class="break"></span>人员列表
				</h6>
			</div>
			<div class="col-xs-7 bk-vcenter text-right">
				每页显示<select class="select_top" id="dataPageCount">
					<option value="10">10</option>
					<option value="20">20</option>
					<option selected value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
				</select>条数据,总共有<span id="accountCount">0</span>个账号。
			</div>
		</div>
	</div>
	<div class="panel-body">
		<div class="table-responsive">
			<table
				class="table table-striped table-bordered bootstrap-datatable datatable">
				<thead>
					<tr>
						<th>账号</th>
						<th>姓名</th>
						<th>组织</th>
						<th>部门</th>
						<th>角色</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="dataTbody">
				</tbody>
				<tfoot>
					<tr>
						<td colspan="7">
							<div class="bk-margin-5 btn-group pull-right" id="pageArea">
								<button type="button" class="btn btn-primary btn-sm">1</button>
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</div>

<form class="modal fade form-horizontal" id="editAccountModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title bk-fg-primary">修改人员信息</h4>
			</div>
			<input type="hidden" name="id" id="editId" />
			<div class="modal-body">
				<div class="form-group">
					<label class="col-md-3 control-label" for="text-input">账号<span class="text-danger">*</span></label>
					<div class="col-md-9">
						<div class="form-control" id="editAccount">xiaomin</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="text-input">姓名<span class="text-danger">*</span></label>
					<div class="col-md-9">
						<input type="text" class="form-control" placeholder="请输入姓名"
						name="name" id="editName" value="小敏" maxlength="5" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="text-input">所属组织<span class="text-danger">*</span></label>
					<div class="col-md-9">
						<select class="form-control" name="orgId" id="editOrgId">
							<option value="" >全部组织</option>
							<s:iterator id="dto" value="orgDtoList">
								<option value="<s:property value='#dto.getId()' />"><s:property value='#dto.getName()' /></option>
							</s:iterator>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="text-input">部门</label>
					<div class="col-md-9">
						<select class="form-control" name="deptId" id="editDeptId">
							<option value="">所有部门</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="text-input">角色<span class="text-danger">*</span></label>
					<div class="col-md-9">
						<select class="form-control" name="roleId" id="editRoleId">
							<option value="">请选择所属角色</option>
							<s:iterator id="dto" value="roleDtoList">
							<option value="<s:property value='#dto.getId()' />"><s:property value='#dto.getName()' /></option>
							</s:iterator>
						</select>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="submit" class="btn btn-primary">保存</button>
			</div>
		</div>
	</div>
</form>

<script id="entrytemplate" type="text/x-handlebars-template">
<tr dataId="{{id}}" 
	  dataAccount="{{account}}"
	  dataName="{{name}}" 
	  dataDeptId="{{deptId}}"
	  dataOrgId="{{orgId}}"
	  dataRoleId="{{roleId}}">
	<td>{{account}}</td>
	<td>{{name}}</td>
	<td>{{orgName}}</td>
	<td>{{depName}}</td>
	<td>{{roleName}}</td>
	<td>{{stateStr}}</td>
	<td>
		<a class="label label-info" onclick="reset('{{id}}')">重置密码</a> 
		<a class="label label-primary" onclick="editAccount(this);">编辑人员信息</a> 
		<a class="label label-default" onclick="disable('{{id}}')">冻结账号</a>
	</td>
</tr>
</script>
<script type="text/javascript" src="assets/pageJs/management/sysAccountQuery.js"></script>