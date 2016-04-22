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

.form-group {
	margin-top: 15px;
}
</style>
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6>
			<i class="glyphicon glyphicon-search"></i> 查询角色
		</h6>
		<div class="panel-actions">
			<a href="javascript:;" class="btn-minimize"><i
				class="fa fa-chevron-up"></i></a>
		</div>
	</div>
	<div class="panel-body">
		<form>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label>角色名称</label> <input type="text" id="role"
							class="form-control" placeholder="请输入查询角色的名称" maxlength="10" />
					</div>
				</div>
				<div class="col-md-12">
					<hr>
					<div class="btn-group">
						<button type="reset" class="btn btn-bg btn-default">重置</button>
						<button class="btn btn-bg btn-primary"
							onclick="tableData.goPage(1);">查询</button>
					</div>
					&nbsp;&nbsp;&nbsp;&nbsp; <input type="button"
						class="btn btn-success" value="新增角色"
						onclick="$('#addRoleModal').modal('show');">
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
					<span class="break"></span>角色列表
				</h6>
			</div>
			<div class="col-xs-7 bk-vcenter text-right">
				每页显示<select class="select_top" id="dataPageCount">
					<option value="10">10</option>
					<option value="20">20</option>
					<option selected value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
				</select>条数据,总共有<span id="roleCount">0</span>个角色。
			</div>
		</div>
	</div>
	<div class="panel-body">
		<div class="table-responsive">
			<table
				class="table table-striped table-bordered bootstrap-datatable datatable">
				<thead>
					<tr>
						<th>角色名称</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="dataTbody">
				</tbody>
				<tfoot>
					<tr>
						<td colspan="4">
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

<form class="modal fade form-horizontal" id="addRoleModal"
	action="management/sysRoleManageAdd">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title bk-fg-primary">新增角色信息</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label class="col-md-3 control-label" for="text-input">角色名称<span class="text-danger">*</span></label>
					<div class="col-md-9">
						<input type="text" class="form-control" placeholder="请输入角色名称"
							name="roleName" maxlength="10" />
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="submin" class="btn btn-primary">保存</button>
			</div>
		</div>
	</div>
</form>

<form class="modal fade form-horizontal" id="editRoleModal"
	action="management/sysRoleManageEdit">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title bk-fg-primary">编辑角色信息</h4>
			</div>
			<input type="hidden" name="id" id="roleId" />
			<div class="modal-body">
				<div class="form-group">
					<label class="col-md-3 control-label" for="text-input">角色名称<span class="text-danger">*</span></label>
					<div class="col-md-9">
						<input type="text" class="form-control" placeholder="请输入角色名称"
							value="" name="roleName" maxlength="10" id="roleName" />
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
<tr>
	<td>{{name}}</td>
	<td>
		<a class="label label-info" onclick="editRole(this,'{{id}}');">修改角色信息</a>
		<a class="label label-default" onclick="deleteRole(this,'{{id}}');">删除角色</a>
	</td>
</tr>
    </script>
<script type="text/javascript">
	var tableData = $.generateData({
		pageArea : "#pageArea",
		dataAreaId : "#entrytemplate",
		dataArea : "#dataTbody",
		url : "management/sysRoleManageList",
		firstFn : function(data) {
			data.pageNum = $("#dataPageCount").val();
			data.roleName = $("#role").val();
		},
		lastFn : function(data) {
			var tempData = actionFormate(data, false);
			$("#roleCount").html(tempData.totalCount);
			return tempData;
		}
	});
	$("#dataPageCount").change(function(){
		tableData.setPageNum(parseInt($(this).val()));
		tableData.refreshData();
	});
	$('#editRoleModal,#addRoleModal').modal({
		backdrop : "static",
		keyboard : false,
		show : false
	});
	$('#addRoleModal').on('hidden.bs.modal', function(e) {
		$('#addRoleModal')[0].reset();
	});

	function deleteRole(dom,id) {
		if (!confirm("确定要删除吗？"))
			return;
		$.post("management/sysRoleManageRemove", {
			id : id
		}, function(data) {
			actionFormate(data, true, function() {
				tableData.refreshData();
			});
		}, "json");
	}
	function editRole(dom, id) {
		var tr = $(dom).closest("tr");
		var roleNameVal = $("td", tr).first().html();
		$("#roleId").val(id);
		$("#roleName").val(roleNameVal);
		$("#editRoleModal").modal("show");
	}

	$("#editRoleModal,#addRoleModal").each(
			function() {
				$(this).validate(
						{
							rules : {
								roleName : {
									required : true,
									maxlength : 10
								}
							},
							messages : {
								roleName : {
									required : "角色名称不能为空",
									maxlength : "格式不正确"
								}
							},
							submitHandler : function(form) {
								$.post($(form).attr("action"), $(form)
										.serialize(), function(data) {
									var form = form
									actionFormate(data, true, function() {
										var formId = $(form).attr("id");
										$("#editRoleModal").modal("hide");
										$("#addRoleModal").modal("hide");
										tableData.refreshData();
									});
								}, "json");
							}
						});
			});

	
</script>