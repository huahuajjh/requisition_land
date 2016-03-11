<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6>
			<i class="glyphicon glyphicon-search"></i> 查询人员
		</h6>
		<div class="panel-actions">
			<a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
		</div>
	</div>
	<div class="panel-body">
		<form onsubmit="return false;">
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label>模块</label>
						<select id="moKuaiSelect"  class="form-control" size="1">
							<option value="">请选择模块</option>
						</select>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label>操作的时间段</label>
						<div class="input-daterange input-group">
							<input type="text" class="form-control" id="starTime" data-plugin-masked-input data-input-mask="9999/99/99 99:99">
							<span class="input-group-addon">到</span>
							<input type="text" class="form-control" id="endTime" data-plugin-masked-input data-input-mask="9999/99/99 99:99">
						</div>
					</div>
				</div>
				<div class="col-md-12">
				<hr>
				<div class="btn-group pull-right">
				<button type="button" class="btn btn-bg btn-primary" onclick="tableData.goPage(1);">查询</button>
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
				<h6>系统日志</h6>
			</div>
			<div class="col-xs-7 bk-vcenter text-right">
				每页显示<select class="select_top" id="dataPageCount">
					<option value="10">10</option>
					<option value="20">20</option>
					<option selected="" value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
				</select>条数据,总共有<span id="countArea">0</span>个操作记录。
			</div>
		</div>
	</div>
	<div class="panel-body">
		<div class="table-responsive">
			<table class="table table-bordered table-striped table-condensed table-hover">
				<thead>
					<tr>
						<th>用户名</th>
						<th>登陆ip</th>
						<th>操作</th>
						<th>操作模块</th>
						<th>操作时间</th>
						<th>操作数据</th>
					</tr>
				</thead>
				<tbody id="dataTbody">
				</tbody>
				<tfoot>
					<tr>
						<td colspan="10">
							<div class="bk-margin-5 btn-group pull-right" id="pageArea"></div>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</div>

<div class="modal fade" id="showInfoModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title bk-fg-primary">查看详细操作</h4>
			</div>
			<div class="modal-body" id="logDataInfo">
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>

<script id="logEntrytemplate" type="text/x-handlebars-template">
{{{this}}}
</script>
<script id="entrytemplate" type="text/x-handlebars-template">
<tr>
	<td>{{name}}</td>
	<td>{{ip}}</td>
	<td>{{action}}</td>
	<td>{{moudle}}</td>
	<td>{{time}}</td>
	<td><a class="label label-dark" href="javascript:;" onclick="showLogInfo('{{id}}');">点击查看</a></td>
</tr>
</script>
<script id="optionItemTemplate" type="text/x-handlebars-template">
{{#each this}}
	<option value="{{id}}">{{title}}</option>
{{/each}}
</script>
<link href="assets/plugins/datetimepicker/jquery.datetimepicker.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="assets/plugins/datetimepicker/jquery.datetimepicker.js"></script> 
<script type="text/javascript" src="assets/pageJs/management/sysLog.js"></script>