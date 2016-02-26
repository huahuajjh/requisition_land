<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!--查询条件-->
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6>
			<i class="glyphicon glyphicon-search"></i>查询条件
		</h6>
	</div>
	<div class="panel-body">
		<div class="row">
			<div class="col-md-4">
				<div class="form-group">
					<label>姓名:</label>
					<input type="text" class="form-control" placeholder="请输入姓名" />
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group">
					<label>身份证号:</label>
					<input type="text" class="form-control" placeholder="请输入身份证号" />
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group downImput">
					<label for="nf-email">项目名称</label>
					<input type="text" class="form-control" placeholder="请输入要查询的项目名称">
					<ul class="dropdown-menu">
						<li><a href="#">石头社区项目</a></li>
						<li><a href="#">福寿社区项目</a></li>
					</ul>
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group">
					<label for="nf-password">地区</label> <select id="select"
						name="select" class="form-control" size="1">
						<option value="0">所有地区</option>
						<option value="1">雨花区</option>
						<option value="2">天心区</option>
						<option value="3">望城区</option>
					</select>
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group">
					<label for="nf-password">街道</label> <select id="select"
						name="select" class="form-control" size="1">
						<option value="0">所有街道</option>
						<option value="1">雨花街道</option>
						<option value="2">洞景街道</option>
					</select>
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group">
					<label for="nf-password">社区</label> <select id="select"
						name="select" class="form-control" size="1">
						<option value="0">所有社区</option>
						<option value="1">石马社区</option>
						<option value="2">自然社区</option>
					</select>
				</div>
			</div>
		</div>
		<!--查询按钮-->
		<hr>
		<div style="margin-top:10px;text-align:right">
			<div class="btn-group">
				<button class="btn btn-bg btn-primary">查询</button>
			</div>
		</div>
	</div>
</div>
<!--查询条件-->

<!--结果视图-->
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
				</select>条数据,总共有<span id="countArea">0</span>个账号。
			</div>
		</div>
	</div>
	<div class="panel-body">
		<table class="table table-hover table-bordered">
			<thead>
				<tr>
					<th class="active">序号</th>
					<th class="active">所属项目</th>
					<th class="active">姓名</th>
					<th class="active">身份证号</th>
					<th class="active">所属模块</th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td>1</td>
					<td><a class="text-primary" data-toggle="modal"
						data-target="#myModal" href="#"><u>北站路征地项目</u></a></td>
					<td>张三</td>
					<td>5115151515151515</td>
					<td>已拆迁人员信息</td>
				</tr>
				<tr>
					<td>2</td>
					<td><a class="text-primary" data-toggle="modal"
						data-target="#myModal" href="#"><u>北站路征地项目</u></a></td>
					<td>张三</td>
					<td>5115151515151515</td>
					<td>已拆迁人员信息</td>
				</tr>
				<tr>
					<td>3</td>
					<td><a class="text-primary" data-toggle="modal"
						data-target="#myModal" href="#"><u>北站路征地项目</u></a></td>
					<td>张三</td>
					<td>5115151515151515</td>
					<td>已拆迁人员信息</td>
				</tr>
			</tbody>

			<tfoot>
				<tr>
					<th colspan="5">
						<div class="bk-margin-5 btn-group pull-right" id="pageArea">
							<button type="button" class="btn btn-primary btn-sm">1</button>
							<button type="button" class="btn btn-default btn-sm">2</button>
							<button type="button" class="btn btn-default btn-sm">3</button>
							<button type="button" class="btn btn-default btn-sm">4</button>
						</div>
					</th>
				</tr>
			</tfoot>
		</table>
	</div>
</div>
<!--结果视图-->
<!--项目信息弹出层-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">北站路扩征项目</h4>
			</div>
			<div class="modal-body">
				<h4 class="ui header text-center text-primary">
					<strong>城南名著项目</strong>
				</h4>
				<table class="table table-striped">
					<tbody>
						<tr>
							<td class="active text-right"><strong>项目地址：</strong></td>
							<td>长沙市雨花区裕华路石马社区</td>
							<td class="active text-right"><strong>项目类型：</strong></td>
							<td>重点项目</td>
							<td class="active text-right"><strong>项目启动时间：</strong></td>
							<td>2011/11/11</td>
						</tr>
						<tr>
							<td class="active text-right"><strong>应拆户数：</strong></td>
							<td>100</td>
							<td class="active text-right"><strong>应动迁人口：</strong></td>
							<td>1000</td>
							<td class="active text-right"><strong>应拆栋数：</strong></td>
							<td>555</td>
						</tr>
						<tr>
							<td class="active text-right"><strong>应付补偿款(元)：</strong></td>
							<td>1000</td>
							<td class="active text-right"><strong>应拆面积（合法）：</strong></td>
							<td>112</td>
							<td class="active text-right"><strong>应拆面积（违章）：</strong></td>
							<td>110</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">关闭
				</button>
			</div>
		</div>
	</div>
</div>
<!--项目信息弹出层-->