<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6> 查询人员</h6>
		<div class="panel-actions">
			<a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
		</div>
	</div>
	<div class="panel-body">
		<form onsubmit="return false;">
			<div class="row">
				<div class="col-md-3">
					<div class="form-group">
						<label>账号</label>
						<input type="text" id="username" class="form-control" placeholder="请输入要查询的账号" maxlength="15">
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label>姓名</label>
						<input type="text" id="name" class="form-control" placeholder="请输入要查询的账号" maxlength="5">
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label>单位</label>
						<select class="form-control" id="organization">
							<option value="">全部单位</option>
							<s:iterator id="dto" value="orgDtoList">
								<option value="<s:property value='#dto.getId()' />">
									<s:property value='#dto.getName()' />
								</option>
							</s:iterator>
						</select>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label>部门</label>
						<select class="form-control" id="department">
							<option value="">所有部门</option>
						</select>
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
				</select>条数据,总共有<span id="accountCount">0</span>个账号。
			</div>
		</div>
	</div>
	<div class="panel-body">
		<div class="table-responsive">
			<table class="table table-bordered table-striped table-condensed table-hover">
				<thead>
					<tr>
					<th>姓名</th>
					<th>用户名</th>
					<th>用户组</th>
					<th>办事地址</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
				</thead>
				<tbody id="dataTbody">
				</tbody>
				<tfoot>
					<tr>
						<td colspan="10">
							<div class="bk-margin-5 btn-group pull-right" id="pageArea">
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</div>
<script id="entrytemplate" type="text/x-handlebars-template">
<tr>
	<td>1</td>
	<td>lisi</td>
	<td>征地办公室</td>
	<td>xxx办事处</td>
	<td>已删除</td>
	<td>
		<a href="javascript:;" class="label label-primary" onclick="huiFu(this);">恢复</a>
	</td>
</tr>
</script>
<script type="text/javascript" src="assets/pageJs/management/accountQuery.js"></script>