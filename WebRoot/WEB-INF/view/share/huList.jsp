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
					<input type="text" id="selectHu_proName" maxlength="20" class="form-control" placeholder="请输入要查询的项目名称">
					<ul class="dropdown-menu" id="selectHu_proNameDown">
					</ul>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group downImput">
					<label for="nf-email">户主名称</label>
					<input type="text" id="selectHu_huZhuName" maxlength="15" class="form-control" placeholder="请输入要查询的户主名称">
					<ul class="dropdown-menu" id="selectHu_nameQueryPrDown"></ul>
				</div>
			</div>
			<div class="col-md-8">
				<div class="form-group downImput">
					<label>地址</label>
					<input type="text" id="selectHu_address" maxlength="60" class="form-control" placeholder="请输入要查询的地址">
					<ul class="dropdown-menu" id="selectHu_queryAddressDown"></ul>
				</div>
			</div>
			<div class="col-md-4">
				<input type="button" class="btn btn-primary" value="查询" onclick="selectHu_tableData.goPage(1); " style="margin-top: 20px;">
			</div>
		</div>
		<hr>
<table class="table table-striped table-bordered bootstrap-datatable datatable">
				<thead>
					<tr>
						<th>户主姓名</th>
						<th>所属项目</th>
						<th>身份证件</th>
						<th>地址</th>
						<th>操作</th>
					</tr>
				</thead>   
				<tbody id="selectHu_dataTbody">
				</tbody>
				<tfoot>
						<tr>
							<td colspan="5">
								<div class="bk-margin-5 btn-group pull-right" id="selectHu_pageArea"></div>
							</td>
						</tr>
				</tfoot>
			</table>
	</div>
<div class="modal-footer">
  <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
</div>
<script id="selectHu_queryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{proName}}</a></li>
</script>
<script id="selectHu_nameQueryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{idNumber}}-{{name}}</a></li>
</script>
<script id="selectHu_queryAddressDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{this}}</a></li>
</script>
<script id="selectHu_entrytemplate" type="text/x-handlebars-template">
<tr>
	<td>{{name}}</td>
	<td>{{proName}}</td>
	<td>{{idNumber}}</td>
	<td>{{address}}</td>
	<td><a class="label label-primary" onclick="selectHu_selectInfo(this);">选择</a></td>
</tr>
</script>
<script type="text/javascript">
$.dropDownInput({
	inputId : "#selectHu_proName",
	dropDownId : "#selectHu_proNameDown",
	url : "projectManagement/pmProgressNames.do",
	templateId : "#selectHu_queryPrDownTemplate",
	lastFn : function(data) {
		return actionFormate(data, false);
	},itemClick:function(data){
		$("#selectHu_proName").data("data",data);
	}
});
$.dropDownInput({
	inputId : "#selectHu_address",
	dropDownId : "#selectHu_queryAddressDown",
	url : sendUrl.addrProvider_getAddr,
	templateId : "#selectHu_queryAddressDownTemplate",
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
	inputId : "#selectHu_huZhuName",
	dropDownId : "#selectHu_nameQueryPrDown",
	url : sendUrl.onekeyQuery_getFuzzy,
	urlType:"get",
	valName:"fuzzy",
	selectVal:"name",
	templateId : "#selectHu_nameQueryPrDownTemplate",
	lastFn:function(data){
		return actionFormate(data,false);
	}
});
var selectHu_tableData = null;
setTimeout(function(){
	selectHu_tableData = $.generateData({
		pageArea : "#selectHu_pageArea",
		dataAreaId : "#selectHu_entrytemplate",
		dataArea : "#selectHu_dataTbody",
		url : "share/huListList.do",
		firstFn : function(data) {
			data.pageNum = 10;
			var queryPrName =  $("#selectHu_proName").val();
			if(queryPrName){
					data.queryProName = queryPrName;
			}
			data.huZhuName = $("#selectHu_huZhuName").val();
			data.address = $("#selectPerson_address").val();
		}, lastFn : function(data) {
			return actionFormate(data, false) || {datas:[],totalCount:0};
		}
	});
}, 500);
function selectHu_selectInfo(dom){
	var tr = $(dom).closest("tr");
	var data = tr.data("data");
	var modal = tr.closest(".modal.fade");
	modal.data("selectData",data);
	modal.modal("hide");
}
</script>