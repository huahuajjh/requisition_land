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
			<i class="glyphicon glyphicon-search"></i> 查询权限
		</h6>
		<div class="panel-actions">
			<a href="javascript:;" class="btn-minimize"><i
				class="fa fa-chevron-up"></i></a>
		</div>
	</div>
	<div class="panel-body">
		<form method="post" onsubmit="return false;">
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label for="nf-password">角色</label> <select class="form-control"
							id="role">
							<option value="">全部角色</option>
							<s:iterator id="dto" value="roleDtos">
								<option value="<s:property value='#dto.getName()' />"><s:property
										value='#dto.getName()' /></option>
							</s:iterator>
						</select>
					</div>
				</div>
				<div class="col-md-12">
					<hr>
					<div class="btn-group"">
						<button type="reset" class="btn btn-bg btn-default">重置</button>
						<button class="btn btn-bg btn-primary"
							onclick="tableData.goPage(1);">查询</button>
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
					<span class="break"></span>角色权限列表
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
<div class="modal fade" id="pmsModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title bk-fg-primary">权限分配</h4>
			</div>
			<input type="hidden" id="hiddenId" />
			<div class="modal-body">
				<div class="panel-group form-horizontal" id="accordionDefault">
					<div class="panel panel-accordion">
						<div class="panel-heading bk-bg-default">
							<h4 class="panel-title">
								<a class="accordion-toggle" data-toggle="collapse"
									data-parent="#accordionDefault" href="#collapseDefaultOne">
									购房卷权限 </a>
							</h4>
						</div>
						<div id="collapseDefaultOne" class="accordion-body collapse">
							<div class="panel bk-widget bk-border-off bk-noradius">
								<div
									class="panel-body bk-bg-very-light-gray bk-bg-lighten bk-padding-off-top bk-padding-off-bottom">
									<div class="form-group">
										<label class="control-label text-left"> <i
											class="fa fa-arrow-right"></i> <strong>购房卷导入</strong>
										</label>
									</div>
								</div>
								<hr class="bk-margin-off">
								<a
									class="panel-body bk-bg-very-light-gray bk-bg-lighten bk-padding-off-top bk-padding-off-bottom">
									<div class="form-group">
										<label class="col-md-3 control-label">购房卷导入</label>
										<div class="col-md-9 text-right">
											<div class="checkbox-custom checkbox-inline">
												<input type="checkbox"> <label> 导入</label>
											</div>
										</div>
									</div>
								</a>
								<hr class="bk-margin-off">
								<a
									class="panel-body bk-bg-very-light-gray bk-bg-lighten bk-padding-off-top bk-padding-off-bottom">
									<div class="form-group">
										<label class="col-md-3 control-label">购房卷列表</label>
										<div class="col-md-9 text-right">
											<div class="checkbox-custom checkbox-inline">
												<input type="checkbox"> <label> 获取</label>
											</div>
											<div class="checkbox-custom checkbox-inline">
												<input type="checkbox"> <label> 查询</label>
											</div>
											<div class="checkbox-custom checkbox-inline">
												<input type="checkbox"> <label> 修改</label>
											</div>
											<div class="checkbox-custom checkbox-inline">
												<input type="checkbox"> <label> 删除</label>
											</div>
										</div>
									</div>
								</a>
							</div>
						</div>
					</div>
					<div class="panel panel-accordion">
						<div class="panel-heading bk-bg-default">
							<h4 class="panel-title">
								<a class="accordion-toggle" data-toggle="collapse"
									data-parent="#accordionDefault" href="#collapseDefaultTwo">
									项目管理权限 </a>
							</h4>
						</div>
						<div id="collapseDefaultTwo" class="accordion-body collapse">
							<div class="panel bk-widget bk-border-off bk-noradius">
								<a
									class="panel-body bk-bg-very-light-gray bk-bg-lighten bk-padding-off-top bk-padding-off-bottom">
									<div class="form-group">
										<label class="col-md-3 control-label">项目导入</label>
										<div class="col-md-9 text-right">
											<div class="checkbox-custom checkbox-inline">
												<input type="checkbox"> <label> 导入</label>
											</div>
										</div>
									</div>
								</a>
								<hr class="bk-margin-off">
								<a
									class="panel-body bk-bg-very-light-gray bk-bg-lighten bk-padding-off-top bk-padding-off-bottom">
									<div class="form-group">
										<label class="col-md-3 control-label">项目列表</label>
										<div class="col-md-9 text-right">
											<div class="checkbox-custom checkbox-inline">
												<input type="checkbox"> <label> 获取</label>
											</div>
											<div class="checkbox-custom checkbox-inline">
												<input type="checkbox"> <label> 查询</label>
											</div>
											<div class="checkbox-custom checkbox-inline">
												<input type="checkbox"> <label> 修改</label>
											</div>
											<div class="checkbox-custom checkbox-inline">
												<input type="checkbox"> <label> 删除</label>
											</div>
										</div>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary"
					onclick="submitData();">保存</button>
			</div>
		</div>
	</div>
</div>
<script id="entrytemplate" type="text/x-handlebars-template">
<tr>
	<td>{{name}}</td>
	<td><a class="label label-info" onclick="initPermission('{{id}}')">权限分配</a></td>
</tr>
 </script>
<script id="permissionTemplate" type="text/x-handlebars-template">
{{#each this}}
<div class="panel panel-accordion">
	<div class="panel-heading bk-bg-default">
		<h4 class="panel-title">
			<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordionDefault" href="#collapseDefault{{@index}}">{{name}}</a>
		</h4>
	</div>
	<div id="collapseDefault{{@index}}" class="accordion-body collapse">
		<div class="panel bk-widget bk-border-off bk-noradius">
			{{#each this.child}}
			<a class="panel-body bk-bg-very-light-gray bk-bg-lighten bk-padding-off-top bk-padding-off-bottom" thisId="{{this.id}}" perId="{{../id}}"">
				<div class="form-group">
					<label class="col-md-5 control-label" style="text-align: left;padding-left: 0;">
						<div class="checkbox-custom checkbox-inline">
							<input type="checkbox" value="{{id}}" {{#if isPermission}}checked{{/if}}> <label> {{this.name}}</label>
						</div>
					</label>
				</div>
			</a>
			{{/each}}
		</div>
	</div>
</div>
{{/each}}
 </script>
<script type="text/javascript">
	var tableData = $.generateData({
		pageArea : "#pageArea",
		dataAreaId : "#entrytemplate",
		dataArea : "#dataTbody",
		url : "management/sysPermissionList.do",
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
	$('#pmsModal').modal({
		backdrop : "static",
		keyboard : false,
		show : false
	});
	$("#dataPageCount").change(function() {
		tableData.setPageNum(parseInt($(this).val()));
		tableData.refreshData();
	});

	function submitData() {
		var id = $("#hiddenId").val();
		var checkQXIds = [], newArr = [], obj = {};
		$("input:checked", "#accordionDefault").each(function() {
			var thisId = $(this).val();
			var parA = $(this).closest("a");
			var parIdOne = parA.attr("thisId");
			var parIdTwo = parA.attr("perId");
			checkQXIds.push(thisId);
			checkQXIds.push(parIdOne);
			checkQXIds.push(parIdTwo);
		});
		for (var i = 0, len = checkQXIds.length; i < len; i++) {
			if (!obj[checkQXIds[i]]) {
				newArr.push(checkQXIds[i]);
				obj[checkQXIds[i]] = true;
			}
		}
		$.post("management/sysPermissionPMS.do",{
			id : id,
			pmsIds:newArr.toString()
		},function(data){
			actionFormate(data, true,function(){
				$('#pmsModal').modal('hide');
			});
		},"json");
	}
	
	function initPermission(id) {
		$.post("management/sysPermissionGetPMS.do", {
			id : id
		}, function(data) {
			 $("#hiddenId").val(id);
			actionFormate(data, false,function(type,msg,datas){
				var models = [];
				initPermissionData(null, datas, models);
				models.sort(by("order"));
				for ( var i in models) {
					orderData(models[i]);
				}
				var modeHtml = $("#permissionTemplate").html();
				var template = Handlebars.compile(modeHtml);
				var html = template(models);
				$("#accordionDefault").html(html);
				$('#pmsModal').modal('show');
			});
		}, "json");
	}

	function initPermissionData(id, datas, dataTemp) {
		for ( var key in datas) {
			var data = datas[key];
			if (!id && !data.pid) {
				dataTemp.push(data);
				initPermissionData(data.id, datas, data);
			} else if (id == data.pid) {
				if (!dataTemp.child)
					dataTemp.child = [];
				dataTemp.child.push(data);
				initPermissionData(data.id, datas, data);
			}
		}
	}
</script>