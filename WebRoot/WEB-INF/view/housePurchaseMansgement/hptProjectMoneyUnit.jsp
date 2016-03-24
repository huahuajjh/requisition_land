<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="panel" id="queryData">
	<div class="panel-heading bk-bg-primary">
		<h6>查询项目</h6>
		<div class="panel-actions">
			<a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
		</div>
	</div>
	<div class="panel-body">
		<div class="row">
			<div class="col-md-4">
				<div class="form-group downImput">
					<label for="nf-email">项目名称</label>
					<input type="text" id="queryPrName" maxlength="20" class="form-control" placeholder="请输入要查询的项目名称" autocomplete="OFF" />
					<ul class="dropdown-menu" id="queryPrDown">
						</ul>
				</div>
			</div>
			<div class="col-md-12">
				<button type="submit" class="btn btn-primary" id="queryBtn">查询</button>
				<button type="button" class="btn btn-default" onclick="$('#selectProInfoModal').modal('show');">选择项目</button>
			</div>
		</div>
	</div>
</div>

<form id="dataArea">
</form>

<div class="modal fade" id="selectProInfoModal">
  <div class="modal-dialog">
    <div class="modal-content">
    </div>
  </div>
</div>

<script id="entrytemplate" type="text/x-handlebars-template">
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6>项目信息</h6>
	</div>
	<div class="panel-body">
		<div class="row">
			<div class="col-md-3 col-md-offset-1">
				<div class="form-group">
					<div class="form-control-static text-right">项目审批号:</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<div class="form-control-static">{{approvalNumber}}</div>
				</div>
			</div>
			<div class="col-md-3 col-md-offset-1">
				<div class="form-group">
					<div class="form-control-static text-right">项目名称:</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<div class="form-control-static">{{proName}}</div>
				</div>
			</div>
			<div class="col-md-3 col-md-offset-1">
				<div class="form-group">
					<div class="form-control-static text-right">项目分类:</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<div class="form-control-static">{{proTypeStr}}</div>
				</div>
			</div>
			<div class="col-md-3 col-md-offset-1">
				<div class="form-group">
					<div class="form-control-static text-right">项目类型:</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<div class="form-control-static">{{categoryStr}}</div>
				</div>
			</div>
			<div class="col-md-3 col-md-offset-1">
				<div class="form-group">
					<div class="form-control-static text-right">项目地址:</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<div class="form-control-static">{{address}}</div>
				</div>
			</div>
			<div class="col-md-12">
				<hr>
			</div>
			<div class="col-md-4 col-md-offset-3">
				<div class="form-group">
					<label class="control-label">国土局出资单位名称<span class="text-danger">*</span></label>
					<input type="text" name="moneyUnit" class="form-control" placeholder="请输入国土局出资单位名称" maxlength="15" value="{{moneyUnit}}" />
				</div>
			</div>
		 	<div class="col-md-4 col-md-offset-3">
				<div class="form-group">
					<label class="control-label">其他出资单位<span class="text-danger">*</span></label>
					<input type="text" name="otherMoneyUnit" class="form-control" placeholder="请输入其他出资单位" maxlength="15" value="{{otherMoneyUnit}}" />
				</div>
			</div>
			<div class="col-md-4 col-md-offset-3">
				<button type="submit" class="btn btn-primary button-next pull-right" id="subBtn">保存</button>
			</div>
		</div>
	</div>
</div>
</script>
<script id="logItemTemplate" type="text/x-handlebars-template">
<table>
	<tr>
		<td class="text-right">项目审批号：</td>
		<td>{{approvalNumber}}</td>
	</tr>
	<tr>
		<td class="text-right">项目名称：</td>
		<td>{{proName}}</td>
	</tr>
	<tr>
		<td class="text-right">项目分类：</td>
		<td>{{proCategory}}</td>
	</tr>
	<tr>
		<td class="text-right">项目地址：</td>
		<td>{{address}}</td>
	</tr>
	<tr>
		<td class="text-right">项目类型：</td>
		<td>{{proTypeStr}}</td>
	</tr>
	<tr>
		<td class="text-right">国土局出资单位名称：</td>
		<td>{{moneyUnit}}</td>
	</tr>
	<tr>
		<td class="text-right">其他出资单位名称：</td>
		<td>{{otherMoneyUnit}}</td>
	</tr>
</table>
</script>
<script id="queryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{proName}}</a></li>
</script>
<script type="text/javascript" src="assets/pageJs/housePurchaseMansgement/hptProjectMoneyUnit.js"></script>