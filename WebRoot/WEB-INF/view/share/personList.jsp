<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal-header">
  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <h4 class="modal-title">选择人员</h4>
</div>
<div class="panel-body">
		<div class="row">
			<div class="col-md-6">
				<div class="form-group downImput">
					<label>项目名称</label>
					<input type="text" id="selectPerson_proName" maxlength="20" class="form-control" placeholder="请输入要查询的项目名称">
					<ul class="dropdown-menu" id="selectPerson_proNameDown">
					</ul>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group downImput">
					<label>人员名称</label>
					<input type="text" id="selectPerson_name" maxlength="15" class="form-control" placeholder="请输入要查询的人员名称">
					<ul class="dropdown-menu" id="selectPerson_nameQueryPrDown"></ul>
				</div>
			</div>
			<div class="col-md-8">
				<div class="form-group downImput">
					<label>地址</label>
					<input type="text" id="selectPerson_address" maxlength="60" class="form-control" placeholder="请输入要查询的地址">
					<ul class="dropdown-menu" id="selectPerson_queryAddressDown"></ul>
				</div>
			</div>
			<div class="col-md-4">
				<input type="button" class="btn btn-primary" value="查询" onclick="selectPerson_tableData.goPage(1); " style="margin-top: 20px;">
			</div>
		</div>
		<hr>
		<table class="table table-striped table-bordered bootstrap-datatable datatable">
			<thead>
				<tr>
					<th>人员姓名</th>
					<th>所属项目</th>
					<th>身份证件</th>
					<th>地址</th>
					<th>操作</th>
				</tr>
			</thead>   
			<tbody id="selectPerson_dataTbody">
			</tbody>
			<tfoot>
					<tr>
						<td colspan="5">
							<div class="bk-margin-5 btn-group pull-right" id="selectPerson_pageArea"></div>
						</td>
					</tr>
			</tfoot>
		</table>
	</div>
<div class="modal-footer">
  <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
</div>
<script id="selectPerson_queryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{proName}}</a></li>
</script>
<script id="selectPerson_nameQueryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{idNumber}}-{{name}}</a></li>
</script>
<script id="selectPerson_queryAddressDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{this}}</a></li>
</script>
<script id="selectPerson_entrytemplate" type="text/x-handlebars-template">
<tr>
	<td>{{name}}</td>
	<td>{{proName}}</td>
	<td>{{idNumber}}</td>
	<td>{{address}}</td>
	<td><a class="label label-primary" onclick="selectPerson_selectInfo(this);">选择</a></td>
</tr>
</script>
<script type="text/javascript">
$.dropDownInput({
	inputId : "#selectPerson_address",
	dropDownId : "#selectPerson_queryAddressDown",
	url : sendUrl.addrProvider_getAddr,
	templateId : "#selectPerson_queryAddressDownTemplate",
	valName:"fuzzy",
	selectVal:"this",
	urlType:"get",
	firstFn:function(data){
		data.code = 3
	},
	lastFn:function(data){
		return actionFormate(data,false);
	}
});
$.dropDownInput({
	inputId : "#selectPerson_name",
	dropDownId : "#selectPerson_nameQueryPrDown",
	url : sendUrl.onekeyQuery_getFuzzy,
	urlType:"get",
	valName:"fuzzy",
	selectVal:"name",
	templateId : "#selectPerson_nameQueryPrDownTemplate",
	lastFn:function(data){
		return actionFormate(data,false);
	}
});
$.dropDownInput({
	inputId : "#selectPerson_proName",
	dropDownId : "#selectPerson_proNameDown",
	url : "projectManagement/pmProgressNames",
	templateId : "#selectPerson_queryPrDownTemplate",
	lastFn : function(data) {
		return actionFormate(data, false);
	},itemClick:function(data){
		$("#selectPerson_proName").data("data",data);
	}
});
var selectPerson_tableData = $.generateData({
	pageArea : "#selectPerson_pageArea",
	dataAreaId : "#selectPerson_entrytemplate",
	dataArea : "#selectPerson_dataTbody",
	url : "projectManagement/listRemovedList",
	firstFn : function(data) {
		data.pageNum = 10;
		var queryPrName =  $("#selectPerson_proName").val();
		if(queryPrName){
			data.queryProName = queryPrName;
		}
		data.name = $("#selectPerson_name").val();
		data.address = $("#selectPerson_address").val();
	}, lastFn : function(data) {
		return actionFormate(data, false) || {datas:[],totalCount:0};
	}
});
function selectPerson_selectInfo(dom){
	var tr = $(dom).closest("tr");
	var data = tr.data("data");
	var modal = tr.closest(".modal.fade");
	modal.data("selectData",data);
	modal.modal("hide");
}
</script>