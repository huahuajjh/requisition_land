<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<style type="text/css">
.jHead {
	display: block;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.jBody {
	overflow: hidden;
	height: 15px;
	display: block;
}

#dataTbody td {
	height: 35px;
}
</style>
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6>查询购房券</h6>
		<div class="panel-actions">
			<a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
		</div>
	</div>
	<div class="panel-body">
		<form action="" method="post">
			<div class="row">
				<div class="col-md-3">
					<div class="form-group downImput">
						<label>项目名称</label>
						<div class="input-group" style="width: 100%;">
							<input type="text" id="queryPrName" maxlength="20"
								class="form-control" placeholder="请输入要查询的项目名称"
								autocomplete="OFF"> <span class="input-group-btn"
								style="width:81px;"><button class="btn btn-default"
									type="button" onclick="$('#selectProInfoModal').modal('show');">选择项目</button></span>
						</div>
						<ul class="dropdown-menu" id="queryPrDown"></ul>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label>券号</label> <input id="queryQuanNum" maxlength="20"
							type="text" class="form-control" placeholder="输入券号进行搜索" />
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group downImput">
						<label>身份证件</label> <input id="queryIdNumber" type="text"
							maxlength="20" class="form-control" placeholder="输入身份证件进行搜索"
							autocomplete="OFF" />
						<ul class="dropdown-menu" id="idNumberQueryPrDown">
						</ul>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group downImput">
						<label>姓名</label> <input id="queryName" type="text" maxlength="15"
							class="form-control" placeholder="输入姓名进行搜索" autocomplete="OFF" />
						<ul class="dropdown-menu" id="nameQueryPrDown">
						</ul>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group downImput">
						<label>户主身份证件</label> <input type="text" name="huIdNumber"
							id="huIdNumber" class="form-control" placeholder="请输入要查询的户主身份证件"
							maxlength="20" autocomplete="OFF" />
						<ul class="dropdown-menu" id="huIdNumberQueryPrDown">
						</ul>
					</div>
				</div>
				<div class="col-md-12 text-right">
					<hr>
					<div class="btn-group">
						<button type="reset" class="bk-margin-5 btn btn-link">重置</button>
						<input type="button" class="btn btn-primary" value="查询"
							onclick="tableData.goPage(1); ">
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
				<h6>购房券的兑付台账</h6>
			</div>
			<div class="col-xs-7 bk-vcenter text-right">
				每页显示<select class="select_top" id="dataPageCount">
					<option value="10">10</option>
					<option value="20">20</option>
					<option selected value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
				</select>条数据,总共有<span id="countArea">0</span>张购房券。
			</div>
		</div>
	</div>
	<div class="panel-body">
		<div class="table-responsive">
			<table
				class="table table-striped table-bordered bootstrap-datatable datatable jTable">
				<thead>
					<tr>
						<th><span class="jHead">姓名</span></th>
						<th><span class="jHead">身份证件</span></th>
						<th><span class="jHead">所属项目</span></th>
						<th><span class="jHead">券号</span></th>
						<th><span class="jHead">面额</span></th>
						<th><span class="jHead">制券时间</span></th>
						<th><span class="jHead">使用时间</span></th>
						<th><span class="jHead">使用类型</span></th>
						<th><span class="jHead">使用去向</span></th>
						<th><span class="jHead">情况说明</span></th>
					</tr>
				</thead>
				<tbody id="dataTbody">
				</tbody>
				<tfoot>
					<tr>
						<td colspan="12">
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
<div class="modal fade" id="showProInfoModal">
	<div class="modal-dialog">
		<div class="modal-content" id="showProInfoArea"></div>
	</div>
</div>
<div class="modal fade" id="selectProInfoModal">
	<div class="modal-dialog">
		<div class="modal-content"></div>
	</div>
</div>

<script id="idNumberQueryPrDownTemplate"
	type="text/x-handlebars-template">
    <li><a href="javascript:;">{{idNumber}}-{{name}}</a></li>
</script>
<script id="nameQueryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{idNumber}}-{{name}}</a></li>
</script>
<script id="entrytemplate" type="text/x-handlebars-template">
<tr>
	<td>
		<span class="jBody"  data-toggle="tooltip" data-placement="top" title="{{name}}">{{name}}</span>
	</td>
	<td>
		<span class="jBody" data-toggle="tooltip" data-placement="top" title="{{idNumber}}">{{idNumber}}</span>
	</td>
	<td>
		<span class="jBody" data-toggle="tooltip" data-placement="top" title="{{proName}}"><a href="javascript:;" class="text-primary" onclick="showProInfo('{{proId}}')">{{proName}}</a></span>
	</td>
	<td>
		<span class="jBody" data-toggle="tooltip" data-placement="top" title="{{ticketNumber}}">{{ticketNumber}}</span>
	</td>
	<td><span class="jBody" data-toggle="tooltip" data-placement="top" title="{{bous}}">{{bous}}</span></td>
	<td><span class="jBody" data-toggle="tooltip" data-placement="top" title="{{makeDate}}">{{makeDate}}</span></td>
	<td><span class="jBody" data-toggle="tooltip" data-placement="top" title="{{useTime}}">{{useTime}}</span></td>
	<td><span class="jBody" data-toggle="tooltip" data-placement="top" title="{{useType}}">{{useType}}</span></td>
	<td><span class="jBody" data-toggle="tooltip" data-placement="top" title="{{useToWhere}}">{{useToWhere}}</span></td>
	<td><span class="jBody" data-toggle="tooltip" data-placement="top" title="{{situation}}">{{situation}}</span></td>
</tr>
</script>
<script id="queryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{proName}}</a></li>
</script>
<script type="text/javascript"
	src="assets/pageJs/housePurchaseMansgement/hptExchangeBill.js"></script>