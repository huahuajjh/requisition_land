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
			<div class="col-md-4">
				<div class="form-group">
					<label>镇(街道)</label>
					<select id="selectHu_queryStreet" class="form-control" size="1">
						<option value="">所有街道</option>
						<s:iterator id="dto" value="addressDtos">
							<option value="<s:property value='#dto.getId()' />"><s:property value='#dto.getName()' /></option>
						</s:iterator>
					</select>
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group">
					<label>村（社区）</label>
					<select id="selectHu_queryCommunity" class="form-control" size="1">
						<option value="">所有社区</option>
					</select>
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group">
					<label>组</label>
					<select id="selectHu_queryZu" class="form-control" size="1">
						<option value="">所有组</option>
					</select>
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group downImput">
					<label>项目名称</label>
					<input type="text" id="selectHu_proName" maxlength="20" class="form-control" placeholder="请输入要查询的项目名称">
					<ul class="dropdown-menu" id="selectHu_proNameDown">
					</ul>
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group downImput">
					<label for="nf-email">户主名称</label>
					<input type="text" id="selectHu_huZhuName" maxlength="5" class="form-control" placeholder="请输入要查询的户主名称">
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
						<th>身份证</th>
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
	url : "projectManagement/pmProgressNames",
	templateId : "#selectHu_queryPrDownTemplate",
	lastFn : function(data) {
		return actionFormate(data, false);
	},itemClick:function(data){
		$("#selectHu_proName").data("data",data);
	}
});
new bindingSelect({
	masterSelect:"#selectHu_queryCommunity",
	childSelect:"#selectHu_queryZu",
	childDefalueVal:"所有组",
	url:"share/address",
	afterFn:function(data){
		return actionFormate(data, false);
	}
});
new bindingSelect({
	masterSelect:"#selectHu_queryStreet",
	childSelect:"#selectHu_queryCommunity",
	childDefalueVal:"所有社区",
	url:"share/address",
	afterFn:function(data){
		return actionFormate(data, false);
	}
});
var selectHu_tableData = $.generateData({
	pageArea : "#selectHu_pageArea",
	dataAreaId : "#selectHu_entrytemplate",
	dataArea : "#selectHu_dataTbody",
	url : "share/huListList",
	firstFn : function(data) {
		data.pageNum = 10;
		var queryPrName =  $("#selectHu_proName").val();
		if(queryPrName){
				data.queryProName = queryPrName;
		}
		data.huZhuName = $("#selectHu_huZhuName").val();
		data.streetId = $("#selectHu_queryStreet").val();
		data.communityId = $("#selectHu_queryCommunity").val();
		data.zuId = $("#selectHu_queryZu").val();
	}, lastFn : function(data) {
		return actionFormate(data, false) || {datas:[],totalCount:0};
	}
});
function selectHu_selectInfo(dom){
	var tr = $(dom).closest("tr");
	var data = tr.data("data");
	var modal = tr.closest(".modal.fade");
	modal.data("selectData",data);
	modal.modal("hide");
}
</script>