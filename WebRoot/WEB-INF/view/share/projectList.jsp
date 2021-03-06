<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <div class="modal-header">
  	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	<h4 class="modal-title" id="myModalLabel">选择项目</h4>
</div>
<div class="panel-body">
	<div class="row">
		<div class="col-md-4">
			<div class="form-group downImput">
				<label>项目名称</label>
				<input type="text" id="selectQueryPro_name" maxlength="20" class="form-control" placeholder="请输入要查询的项目名称">
				<ul class="dropdown-menu" id="selectQueryPro_nameDown">
				</ul>
			</div>
		</div>
		<div class="col-md-4">
			<div class="form-group">
				<label>项目类型</label>
				<select id="selectQueryPro_type" class="form-control" size="1">
					<option value="0">所有项目类型</option>
					<s:iterator id="dto" value="proTypeDtos">
						<option value="<s:property value='#dto.getCode()' />">
						<s:property value='#dto.getName()' />
						</option>
					</s:iterator>
				</select>
			</div>
		</div>
		<div class="col-md-4">
			<div class="form-group">
				<label>项目进度</label>
				<select id="selectQueryPro_jd" class="form-control" size="1">
					<option value="0">所有进度</option>
					<option value="1">一公告</option>
					<option value="2">二公告</option>
					<option value="3">三公告</option>
				</select>
			</div>
		</div>
		<div class="col-md-8">
			<div class="form-group downImput">
				<label>地址</label>
				<input type="text" id="selectQueryPro_queryAddressName" maxlength="60" class="form-control" placeholder="请输入要查询的地址" autocomplete="OFF"  />
				<ul class="dropdown-menu" id="selectQueryPro_queryAddressDown">
				</ul>
			</div>
		</div>
		<div class="col-md-4">
			<input type="button" class="btn btn-primary" value="查询" onclick="selectQueryPro_tableData.goPage(1); " style="margin-top: 20px;">
		</div>
	</div>
</div>
<hr>
<table class="table table-striped table-bordered bootstrap-datatable datatable">
	<thead>
		<tr>
			<th>项目名称</th>
			<th>项目类型</th>
			<th>项目进度</th>
			<th>项目地址</th>
			<th>操作</th>
		</tr>
	</thead>   
	<tbody id="selectQueryPro_dataTbody">
	</tbody>
	<tfoot>
			<tr>
				<td colspan="5">
					<div class="bk-margin-5 btn-group pull-right" id="selectQueryPro_pageArea">
					</div>
				</td>
			</tr>
	</tfoot>
</table>
<div class="modal-footer">
	<button type="button" class="btn btn-default" data-dismiss="modal">关闭
	</button>
</div>
<script id="selectQueryPro_queryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{proName}}</a></li>
</script>
<script id="selectQueryPro_queryAddressDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{this}}</a></li>
</script>
<script id="selectQueryPro_entrytemplate" type="text/x-handlebars-template">
<tr>
	<td>{{proName}}</td>
	<td>{{proTypeStr}}</td>
	<td>{{sequenceStr}}</td>
	<td>{{totalAddress}}</td>
	<td><a class="label label-primary" onclick="selectQueryPro_selectProInfo(this);">选择</a></td>
</tr>
</script>
<script type="text/javascript">
$.dropDownInput({
	inputId : "#selectQueryPro_name",
	dropDownId : "#selectQueryPro_nameDown",
	url : "projectManagement/pmProgressNames.do",
	templateId : "#selectQueryPro_queryPrDownTemplate",
	lastFn : function(data) {
		return actionFormate(data, false);
	},itemClick:function(data){
		$("#selectQueryPro_name").data("data",data);
	}
});
$.dropDownInput({
	inputId : "#selectQueryPro_queryAddressName",
	dropDownId : "#selectQueryPro_queryAddressDown",
	url : sendUrl.addrProvider_getAddr,
	templateId : "#selectQueryPro_queryAddressDownTemplate",
	valName:"fuzzy",
	selectVal:"this",
	urlType:"get",
	firstFn:function(data){
		data.code = 1
	},
	lastFn:function(data){
		return actionFormate(data,false);
	}
});
var selectQueryPro_tableData = null;
setTimeout(function(){
	selectQueryPro_tableData = $.generateData({
		pageArea : "#selectQueryPro_pageArea",
		dataAreaId : "#selectQueryPro_entrytemplate",
		dataArea : "#selectQueryPro_dataTbody",
		url : "projectManagement/pmQueryProList.do",
		firstFn : function(data) {
			data.pageNum = 10;
			var queryPrName =  $("#selectQueryPro_name").val();
			if(queryPrName){
				data.queryProName = queryPrName;
			}
			data.annouceQueue = $("#selectQueryPro_jd").val();
			data.typeId = $("#selectQueryPro_type").val();
			data.address = $("#selectQueryPro_queryAddressName").val();
		}, lastFn : function(data) {
			return actionFormate(data, false) || {datas:[],totalCount:0};
		}
	});
}, 500);
function selectQueryPro_selectProInfo(dom){
	var tr = $(dom).closest("tr");
	var data = tr.data("data");
	var modal = tr.closest(".modal.fade");
	modal.data("selectData",data);
	modal.modal("hide");
}
</script>