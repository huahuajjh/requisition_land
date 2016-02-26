<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--查询条件组件-->
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6>查询条件</h6>
	</div>
	<div class="panel-body">
		<div class="row">
				<div class="col-xs-3">
					<div class="form-group downImput">
						<label>项目名称</label>
						<div class="input-group" style="width: 100%;">
							<input type="text" id="queryPrName" maxlength="20" class="form-control" placeholder="请输入要查询的项目名称" autocomplete="OFF" />
							<span class="input-group-btn" style="width:81px;"><button class="btn btn-default" type="button" onclick="$('#selectProInfoModal').modal('show');">选择项目</button></span>
						 </div>
						<ul class="dropdown-menu" id="queryPrDown" style="display: none;"></ul>
					</div>
				</div>
				<div class="col-xs-3">
					<div class="form-group downImput">
						<label>身份证</label>
						<input type="text"  id="idNumber" maxlength="20" class="form-control" placeholder="请输入要查询的身份证" autocomplete="OFF">
						<ul class="dropdown-menu" id="idNumberQueryPrDown">
						</ul>
					</div>
				</div>
				<div class="col-md-2">
					<div class="form-group">
						<label>街道</label>
						<select id="street"  class="form-control" size="1">
							<option value="">所有街道</option>
							<s:iterator id="dto" value="addressDtos">
								<option value="<s:property value='#dto.getId()' />"><s:property value='#dto.getName()' /></option>
							</s:iterator>
						</select>
					</div>
				</div>
				<div class="col-md-2">
					<div class="form-group">
						<label>社区</label>
						<select id="community"  class="form-control" size="1">
							<option value="">所有社区</option>
						</select>
					</div>
				</div>
				<div class="col-xs-2">
					<div class="form-group">
						<label>组</label>
						<select id="zu" class="form-control" size="1">
							<option value="">所有组</option>
						</select>
					</div>
				</div>
			</div>
			<hr>
		<div class="row" style="margin-top:15px;text-align:right">
			<div class="col-xs-12">
				<div class="btn-group">
					<button class="btn btn-bg btn-primary" onclick="tableData.goPage(1); ">查询</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!--查询条件组件-->

<!--查询结果组件-->
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<div class="row">
			<div class="col-xs-5 text-left bk-vcenter">
				<h6>查询结果</h6>
			</div>
			<div class="col-xs-7 bk-vcenter text-right">
					每页显示<select class="select_top" id="dataPageCount">
					<option value="10">10</option>
					<option value="20">20</option>
					<option selected="" value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
				</select>条数据,总共有<span id="countArea">0</span>个拆迁户。
			</div>
		</div>
	</div>
	<div class="panel-body">
		<div class="table-responsive">
			<table
				class="table table-bordered table-striped table-condensed table-hover">
				<thead>
					<tr>
						<th>所属项目</th>
						<th>姓名</th>
						<th>身份证号</th>
						<th>是否转户</th>
						<th>转后户口类型</th>
						<th>转户时间</th>
						<th>转户地址</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="dataTbody">
				</tbody>
				<tfoot>
					<tr>
						<td colspan="10">
							<div class="row"></div>
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
<form class="modal fade form-horizontal" id="editTransferModal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
		 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		 <h4 class="modal-title bk-fg-primary">编辑转户信息</h4>
	  </div>
      <div class="modal-body" id="editInfoArea">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn btn-primary">保存</button>
      </div>
    </div>
  </div>
</form>
<div class="modal fade" id="showProInfoModal">
  <div class="modal-dialog">
    <div class="modal-content" id="showProInfoArea">
    </div>
  </div>
</div>

<div class="modal fade" id="selectProInfoModal">
  <div class="modal-dialog">
    <div class="modal-content">
    </div>
  </div>
</div>

<script id="idNumberQueryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{idNumber}}</a></li>
</script>
<script id="entrytemplate" type="text/x-handlebars-template">
<tr>
	<td>
		<a href="javascript:;" class="text-primary" onclick="showProInfo('{{proId}}')">{{proName}}</a>
	</td>
	<td>{{name}}</td>
	<td>{{idNumber}}</td>
	<td><i class="fa fa-check text-success"></i></td>
	<td>{{houseHoldTypeStr}}</td>
	<td>{{transferDate}}</td>
	<td>{{address}}</td>
	<td>
		<a class="label label-primary" onclick="editData(this);">编辑</a>
	</td>
</tr>
</script>
<script id="queryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{proName}}</a></li>
</script>
<script id="editDataTemplate" type="text/x-handlebars-template">
<div class="form-group">
<label class="col-md-3 control-label">姓名</label>
<div class="col-md-9">
	<div class="form-control-static">{{name}}</div>
</div>
</div>
<div class="form-group">
<label class="col-md-3 control-label">身份证</label>
	<div class="col-md-9">
 	<div class="form-control-static">{{idNumber}}</div>
</div>
</div>
<div class="form-group">
<label class="col-md-3 control-label">所属拆迁项目</label>
	<div class="col-md-9">
 	<div class="form-control-static">{{proName}}</div>
</div>
</div>
<div class="form-group">
<label class="col-md-3 control-label">地址</label>
	<div class="col-md-9">
 	<div class="form-control-static">{{address}}</div>
</div>
</div>
<div class="form-group">
<label class="col-md-3 control-label">是否已转户</label>
	<div class="col-md-9">
 	<div class="form-control-static">
 		<i class="fa fa-check text-success"></i>
	</div>
</div>
</div>
<div class="form-group">
<label class="col-md-3 control-label">转户时间</label>
	<div class="col-md-9">
 	<div class="form-control-static">{{transferDate}}</div>
</div>
</div>
</div>
<div class="form-group">
<label class="col-md-3 control-label">户口类型</label>
	<div class="col-md-9">
 	<div class="form-control-static">{{houseHoldTypeStr}}</div>
</div>
</div>
<hr>
<div class="form-group">
<label class="col-md-3 control-label" for="text-input">转户时间<span class="text-danger">*</span></label>
	<div class="col-md-9">
 	<input type="text" id="editTime" class="form-control" value="{{transferDate}}" placeholder="____/__/__" data-plugin-datepicker-nottoday data-plugin-datepicker data-plugin-masked-input data-input-mask="9999/99/99">
</div>
</div>
<div class="form-group">
<label class="col-md-3 control-label" for="text-input">转户地址<span class="text-danger">*</span></label>
	<div class="col-md-9" id="editStreetAndCommunity">
 	<div class="input-daterange input-group">
     	<span class="input-group-addon">镇(街道)</span>
    	<select class="form-control" size="1" id="editStreet">
        	<option value="">请选择街道</option>
			<s:iterator id="dto" value="addressDtos">
				<option value="<s:property value='#dto.getId()' />"><s:property value='#dto.getName()' /></option>
			</s:iterator>
         </select>
         <span class="input-group-addon">村（社区）</span>
         <select class="form-control" size="1" id="editCommunity">
             <option value="">请选择社区</option>
          </select>
		<span class="input-group-addon">组</span>
         <select class="form-control" size="1" id="editZu">
             <option value="">请选择组</option>
          </select>
          <span class="input-group-addon">其他信息</span>
          <input type="text" class="form-control" maxlength="30" style="text-align: left;" id="editAddressOtherMsg" >
      </div>
</div>
</div>
<div class="form-group">
<label class="col-md-3 control-label" for="text-input">转户类型<span class="text-danger">*</span></label>
	<div class="col-md-9">
 	<select class="form-control" size="1" id="editHuType">
     	<option value="">请户口类型</option>
     	 <s:iterator id="dto" value="householdTypeDtos">
			<option value="<s:property value='#dto.getId()' />"><s:property value='#dto.getName()' /></option>
		</s:iterator>
    </select>
</div>
</div>
</script>
<script type="text/javascript" src="assets/pageJs/transferAccountManagement/taQuery.js"></script>