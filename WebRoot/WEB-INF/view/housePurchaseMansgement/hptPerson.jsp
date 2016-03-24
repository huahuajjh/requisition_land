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
			<i class="fa fa-signal red"></i>查询购房券信息
		</h6>
		<div class="panel-actions">
			<a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
		</div>
	</div>
	<div class="panel-body">
		<form action="" method="post">
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label for="nf-email">身份证件</label> <input type="text"
							class="form-control" placeholder="请输入户主身份证件" />
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group downImput">
						<label for="nf-password">项目</label> <input type="text"
							class="form-control" placeholder="请输入要查询的项目名称" />
						<ul class="dropdown-menu">
							<li><a href="#">石头社区项目</a></li>
							<li><a href="#">福寿社区项目</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="nf-email">购房券券号</label> <input type="text"
							class="form-control" placeholder="请输入购房券券号" />
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="nf-email">购房券制券时间</label> <input type="text"
							class="form-control" placeholder="请输入购房券制券时间"
							data-plugin-datepicker />
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label>是否半边户</label> <select class="form-control">
							<option value="0">全部</option>
							<option value="1">是</option>
							<option value="2">否</option>
						</select>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="nf-email">是否独生子女</label> <select class="form-control">
							<option value="0">全部</option>
							<option value="1">是</option>
							<option value="2">否</option>
						</select>
					</div>
				</div>
				<div class="col-md-12">
					<div class="btn-group pull-right">
						<button class="btn btn-bg btn-success">导出购房券台账</button>
						<input type="button" class="btn btn-primary pull-right" value="查询">
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
				<h6>
					<i class="fa fa-table red"></i><span class="break"></span>购房券台账
				</h6>
			</div>
			<div class="col-xs-7 bk-vcenter text-right">
				每页显示<select class="select_top">
					<option value="0">10</option>
					<option value="1">20</option>
					<option selected value="2">30</option>
					<option value="3">40</option>
					<option value="3">50</option>
				</select>条数据,总共有20000张购房券，已领取了2000张购房券。
			</div>
		</div>
	</div>
	<div class="panel-body">
		<div class="table-responsive">
			<table
				class="table table-striped table-bordered bootstrap-datatable datatable">
				<thead>
					<tr>
						<th>
							<div class="checkbox-custom">
								<input type="checkbox"> <label> 全选</label>
							</div>
						</th>
						<th>持有人姓名</th>
						<th>户主</th>
						<th>与户主关系</th>
						<th>是否独生子女</th>
						<th>是否半边户</th>
						<th>所属项目</th>
						<th>补贴金额（万元）</th>
						<th>券号</th>
						<th>制券时间</th>
						<th>领取状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<div class="checkbox-custom">
								<input type="checkbox"> <label></label>
							</div>
						</td>
						<td><a href="#" class="bk-fg-primary"
							onclick="$('#myModal').modal('show');">小明</a></td>
						<td>小明</td>
						<td>户主</td>
						<td><i class="fa fa-check text-success"></i></td>
						<td><i class="fa fa-times text-danger"></i></td>
						<td>市本项目</td>
						<td>500,000</td>
						<td>515215155</td>
						<td>2011/11/11</td>
						<td class="text-danger">未领取</td>
						<td><a class="label label-dark"
							onclick="$('#myModal').modal('show');">查看</a></td>
					</tr>
					<tr>
						<td>
							<div class="checkbox-custom">
								<input type="checkbox"> <label></label>
							</div>
						</td>
						<td><a href="#" class="bk-fg-primary"
							onclick="$('#myModal').modal('show');">小明</a></td>
						<td>小明</td>
						<td>户主</td>
						<td><i class="fa fa-check text-success"></i></td>
						<td><i class="fa fa-times text-danger"></i></td>
						<td>市本项目</td>
						<td>500,000</td>
						<td>515215155</td>
						<td>2011/11/11</td>
						<td class="text-success">已领取</td>
						<td><a class="label label-dark"
							onclick="$('#myModal').modal('show');">查看</a></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="12">
							<div class="row"></div>
							<div class="pull-left">
								<button type="button" class="bk-margin-5 btn btn-default btn-sm">打印选中的购房券台账</button>

							</div>
							<div class="bk-margin-5 btn-group pull-right">
								<button type="button" class="btn btn-primary btn-sm">1</button>
								<button type="button" class="btn btn-default btn-sm">2</button>
								<button type="button" class="btn btn-default btn-sm">3</button>
								<button type="button" class="btn btn-default btn-sm">4</button>
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</div>

<div class="modal fade" id="myModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title bk-fg-primary">查看拆迁户详情</h4>
			</div>
			<div class="modal-body">
				<h4 class="ui header text-center text-primary">
					<strong>城南名著项目</strong>
				</h4>
				<div class="row text-center">
					<div class="col-xs-3 bk-bg-white bk-bg-lighten bk-padding-top-20 bk-padding-bottom-20">
						<small>审批号</small>
						<h5 class="bk-margin-off-bottom">
							<strong id="proInfoNum">ap455</strong>
						</h5>
					</div>
					<div class="col-xs-3 bk-bg-white bk-bg-lighten bk-padding-top-20 bk-padding-bottom-20">
						<small>项目地址</small>
						<h5 class="bk-margin-off-bottom">
							<strong id="proInfoAddress">address</strong>
						</h5>
					</div>
					<div class="col-xs-3 bk-bg-white bk-bg-lighten bk-padding-top-20 bk-padding-bottom-20">
						<small>项目类型</small>
						<h5 class="bk-margin-off-bottom">
							<strong id="proInfoType">2</strong>
						</h5>
					</div>
					<div class="col-xs-3 bk-bg-white bk-bg-lighten bk-padding-top-20 bk-padding-bottom-20">
						<small>项目进度</small>
						<h5 class="bk-margin-off-bottom">
							<strong id="announceName"></strong>
						</h5>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h6>个人信息理</h6>
					</div>
						<table class="table table-striped table-bordered bootstrap-datatable datatable">
							<tbody>
								<tr>
									<td class="active text-right"><strong>姓名：</strong></td>
									<td>小明</td>
									<td class="active text-right"><strong>与户主关系：</strong></td>
									<td>户主</td>
									<td class="active text-right"><strong>身份证件号码：</strong></td>
									<td>748523666999888888</td>
								</tr>
								<tr>
									<td class="active text-right"><strong>出生日期：</strong></td>
									<td>2011/11/11</td>
									<td class="active text-right"><strong>性别：</strong></td>
									<td>男</td>
									<td class="active text-right"><strong>户口性质：</strong></td>
									<td>农业户口</td>
								</tr>
								<tr>
									<td class="active text-right"><strong>独生子女证件号：</strong></td>
									<td>854184158</td>
									<td class="active text-right"><strong>是否半边户：</strong></td>
									<td><i class="fa fa-check text-success"></i></td>
									<td class="active text-right"><strong>补贴金额（万元）：</strong></td>
									<td>100</td>
								</tr>
								<tr>
									<td class="active text-right"><strong>所持购房券券号：</strong></td>
									<td>1511510</td>
									<td class="active text-right"><strong>购房券制券时间：</strong></td>
									<td>2011/11/11</td>
									<td class="active text-right"><strong>购房券状态：</strong></td>
									<td>已使用</td>
								</tr>
							</tbody>
						</table>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-12 text-left bk-vcenter">
								<h6 class="bk-margin-off">户口详细信息</h6>
							</div>
						</div>
					</div>
					<div class="panel-body">
						<table class="table table-striped">
							<tbody>
								<tr>
									<td class="active text-right"><strong>户主姓名：</strong></td>
									<td>小明</td>
									<td class="active text-right"><strong>房子合法面积：</strong></td>
									<td>1000</td>
									<td class="active text-right"><strong>房子照片：</strong></td>
									<td><a href="#" class="text-primary">点击查看</a></td>
								</tr>
								<tr>
									<td class="active text-right"><strong>地址：</strong></td>
									<td colspan="5">长沙...</td>
								</tr>
								<tr>
									<td colspan="6">
										<div class="form-group">
											<label for="nf-password">批证及其他情况说明</label>
											<div class="form-control">说明....</div>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="6">
										<div class="form-group">
											<label for="nf-password">拟定处理方案</label>
											<div class="form-control">方案....</div>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="6">
										<div class="form-group">
											<label for="nf-password">联合会审意见</label>
											<div class="form-control">意见...</div>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="6">
										<div class="form-group">
											<label for="nf-password">备注</label>
											<div class="form-control">备注...</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>

