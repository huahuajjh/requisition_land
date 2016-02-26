<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--新增单位-->
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6>
			<i class="fa fa-envelope"></i>单位管理
		</h6>
	</div>
	<div class="panel-body">
		<button class="btn btn-bg btn-primary" data-toggle="modal"
			data-target="#addOrgModal">
			<i class="fa fa-plus"></i>添加单位
		</button>
		<hr>
		<table class="table table-hover table-bordered">
			<thead>
				<tr>
					<th class="active">单位名称</th>
					<th class="active">单位编号</th>
					<th class="active col-md-3">操作</th>
				</tr>
			</thead>
			<tbody id="dataArea">
			</tbody>
		</table>
	</div>
</div>

<!--新增单位弹出层-->
<form class="modal fade" id="addOrgModal"
	action="management/sysOrgManagementAdd">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title bk-fg-primary">新增单位</h4>
			</div>
			<div class="modal-body">
				<table class="table table-hover table-bordered">
					<thead>
						<tr>
							<th class="active">单位名称<span class="text-danger">*</span></th>
							<th class="active">单位编号<span class="text-danger">*</span></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input class="form-control" placeholder="请输入单位名称"
								name="name" maxlength="20" type="text" /></td>
							<td><input class="form-control" placeholder="请输入单位编号"
								name="orgNumber" maxlength="20" type="text" /></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="submit" class="btn btn-primary">添加</button>
			</div>
		</div>
	</div>
</form>
<!--新增单位弹出层-->

<!--编辑单位弹出层-->
<form class="modal fade" id="editOrgModal" action="management/sysOrgManagementEdit">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title bk-fg-primary">修改单位</h4>
			</div>
			<div class="modal-body" id="editContext">
				<table class="table table-hover table-bordered">
					<thead>
						<tr>
							<th class="active">单位名称<span class="text-danger">*</span></th>
							<th class="active">单位编号<span class="text-danger">*</span></th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button type="submit" class="btn btn-primary">修改</button>
			</div>
		</div>
	</div>
</form>
<!--编辑单位弹出层-->

<!--添加部门弹出层-->
<div class="modal fade" id="deptModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title bk-fg-primary">新增部门</h4>
			</div>
			<div class="modal-body">
			<blockquote class="bk-margin-off-bottom" style="margin-bottom: 20px !important;">
				<form id="addDeptForm" onsubmit="return false;">
					<input type="hidden" name="orgId" id="addDeptOrgid">
					<div class="form-group" style="position: relative;height: 90px;">
						<label for="nf-password">部门名称</label>
						<input type="text" id="nf-password" name="name" class="form-control" placeholder="请输入部门名称" maxlength="10">
						<button type="submit" class="btn btn-primary" style="position: absolute;right: 10px;bottom: -10px;">保存</button>
					</div>
				</form>
			</blockquote>
				<table class="table table-hover table-bordered" id="addDeprt">
					<thead>
						<tr>
							<th class="active">部门名称</th>
							<th class="active">操作</th>
						</tr>
					</thead>
					<tbody id="departmentArea">
						<tr dataId="{{id}}" orgId="{{orgId}}">
							<td><input class="form-control input-sm"
								placeholder="请输入部门名称" name="name" maxlength="20" type="text"
								value="国土局" defauleVal="国土局" disabled /></td>
							<td>
								<button type="button" class="btn btn-sm btn-success"
									onclick="saveCurRow(this)" style="display:none;">
									<i class="fa fa-edit"></i>提交编辑
								</button> &nbsp;
								<button type="button" class="btn btn-sm btn-primary"
									onclick="editCurRow(this)">
									<i class="fa fa-edit"></i>编辑部门
								</button> &nbsp;
								<button type="button" class="btn btn-sm btn-warning"
									onclick="cancelCurRow(this)">
									<i class="glyphicon glyphicon-trash"></i>取消编辑
								</button> &nbsp;
								<button type="button" class="btn btn-sm btn-danger"
									onclick="delCurRow(this)">
									<i class="glyphicon glyphicon-trash"></i>删除部门
								</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>

<script id="entryOrgTemplate" type="text/x-handlebars-template">
{{#each this}}
<tr id="{{this.id}}">
	<td>{{this.name}}</td>
	<td>{{this.orgNumber}}</td>
	<td>
		<a class="label label-primary" onclick="initCurRow('{{this.id}}');">
			<i class="glyphicon glyphicon-plus"></i>添加部门
		</a> &nbsp;
		<a class="label label-success" onclick="editData(this);">
			<i class="glyphicon glyphicon-edit"></i>修改
		</a> &nbsp;
		<a class="label label-default" onclick="deleteData(this);">
				<i class="glyphicon glyphicon-trash"></i>删除
		</a>
	</td>
</tr>
{{/each}}
 </script>
<!--添加部门弹出层-->
<script id="entrytemplate" type="text/x-handlebars-template">
	<input type="hidden" name="id" value="{{id}}"/>
	<table class="table table-hover table-bordered">
		<thead>
			<tr>
				<th class="active">单位名称<span class="text-danger">*</span></th>
				<th class="active">单位编号<span class="text-danger">*</span></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input class="form-control" placeholder="请输入单位名称" type="text" maxlength="20" name="name" value="{{name}}" /></td>
				<td><input class="form-control" placeholder="请输入单位编号" type="text" maxlength="50" name="orgNumber" value="{{orgNumber}}" /></td>
			</tr>
		</tbody>
	</table>
 </script>
<script id="departmentTemp" type="text/x-handlebars-template">
<tr dataId="{{id}}" orgId="{{orgId}}">
	<td>
		<input class="form-control input-sm" placeholder="请输入部门名称" name="name" maxlength="20" type="text" value="{{name}}" defauleVal="{{name}}" disabled />
	</td>
	<td>
		<button type="button" class="btn btn-sm btn-success" onclick="saveCurRow(this)" style="display:none;">
			<i class="fa fa-edit"></i>提交编辑
		</button>
		<button type="button" class="btn btn-sm btn-primary" onclick="editCurRow(this)">
			<i class="fa fa-edit"></i>编辑部门
		</button>&nbsp;
		<button type="button" class="btn btn-sm btn-warning" onclick="cancelCurRow(this)">
			<i class="fa fa-eraser"></i>取消编辑
		</button>&nbsp;
		<button type="button" class="btn btn-sm btn-danger" onclick="delCurRow(this)">
			<i class="glyphicon glyphicon-trash"></i>删除部门
		</button>
	</td>
</tr>
 </script>
<script type="text/javascript" src="assets/pageJs/management/sysOrgManagement.js" charset="UTF-8"></script>