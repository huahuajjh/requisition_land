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
					<input type="text" id="name" class="form-control" placeholder="请输入姓名" />
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group">
					<label>身份证号:</label>
					<input type="text" id="idNumber" class="form-control" placeholder="请输入身份证号" />
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group downImput">
					<label for="nf-email">项目名称</label>
					<div class="input-group">
						<input type="text" class="form-control" id="queryProName" placeholder="请输入要查询的项目名称" maxlength="20" />
						<span class="input-group-btn" style="width: 100px;"><button class="btn btn-default" type="button" onclick="$('#selectProInfoModal').modal('show');">选择项目</button></span>
					  </div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group">
					<label for="nf-password">镇(街道)</label> <select id="select"
						name="select" class="form-control" size="1">
						<option value="">所有地区</option>
					</select>
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group">
					<label for="nf-password">村（社区）</label> <select id="select"
						name="select" class="form-control" size="1">
						<option value="">所有街道</option>
					</select>
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group">
					<label for="nf-password">组</label> <select id="select"
						name="select" class="form-control" size="1">
						<option value="">所有社区</option>
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
		<table class="table table-bordered">
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
					<td><a class="text-primary" data-toggle="modal" data-target="#myModal" href="#"><u>北站路征地项目</u></a></td>
					<td>张三</td>
					<td>5115151515151515</td>
					<td>在籍农业人口</td>
				</tr>
				<tr>
					<td>2</td>
					<td><a class="text-primary" data-toggle="modal" data-target="#myModal" href="#"><u>北站路征地项目</u></a></td>
					<td>张三</td>
					<td>5115151515151515</td>
					<td>在籍农业人口</td>
				</tr>
				<tr>
					<td>3</td>
					<td><a class="text-primary" data-toggle="modal" data-target="#myModal" href="#"><u>北站路征地项目</u></a></td>
					<td>张三</td>
					<td>5115151515151515</td>
					<td>在籍农业人口</td>
				</tr>
			</tbody>

			<tfoot>
				<tr>
					<th colspan="5" >
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
<script type="text/javascript" src="assets/js/showProListModal.js"></script>
<script type="text/javascript" src="assets/pageJs/management/registedAgrcInfoQuery.js"></script>