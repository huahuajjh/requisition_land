<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<style type="text/css">
.select_top {
	width: 30px;
	background: transparent !important;
	border: 0px !important;
	-webkit-box-shadow: none !important;
	box-shadow: none !important;
}

.downImput {
	position: relative;
}

.downImput ul.dropdown-menu {
	width: 100%;
}

.downImput input:focus ~ ul.dropdown-menu {
	display: block;
	width: 100%;
}
</style>
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6>
			<i class="fa fa-signal red"></i>查询项目
		</h6>
		<div class="panel-actions">
			<a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
		</div>
	</div>
	<div class="panel-body">
		<form action="" method="post">
			<div class="row">
				<div class="col-md-4">
					<div class="form-group downImput">
						<label for="nf-email">项目名称</label> <input type="text"
							class="form-control" placeholder="请输入要查询的项目名称" />
						<ul class="dropdown-menu">
							<li><a href="#">石头社区项目</a></li>
							<li><a href="#">福寿社区项目</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="nf-password">项目类型</label> <select id="select"
							name="select" class="form-control" size="1">
							<option value="">请选择项目类型</option>
							<option value="1">重点项目</option>
							<option value="2">一般项目</option>
							<option value="3">先期项目</option>
						</select>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label for="nf-password">项目进度</label> <select id="select"
							name="select" class="form-control" size="1">
							<option value="">请选择项目所处公告</option>
							<option value="1">一公告</option>
							<option value="2">二公告</option>
							<option value="3">三公共</option>
						</select>
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
				<div class="col-md-12">
					<input type="button" class="btn btn-danger button-next pull-right"
						value="搜索">
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
					<i class="fa fa-table red"></i><span class="break"></span>项目台账
				</h6>
			</div>
			<div class="col-xs-7 bk-vcenter text-right">
				每页显示<select class="select_top">
					<option value="0">10</option>
					<option value="1">20</option>
					<option selected value="2">30</option>
					<option value="3">40</option>
					<option value="3">50</option>
				</select>条数据,总共有2000个项目，其中100已启动。
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
						<th>项目名称</th>
						<th>项目类型</th>
						<th>项目进度</th>
						<th>应征面积</th>
						<th>应拆栋数</th>
						<th>已拆户数</th>
						<th>项目地址</th>
						<th>是否已启动</th>
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
							onclick="$('#myModal').modal('show');">石马区项目</a></td>
						<td>重点项目</td>
						<td>一公告</td>
						<td>10,000</td>
						<td>10,000</td>
						<td>10,000</td>
						<td>长沙市雨花区雨花街道石马社区</td>
						<td><i class="fa fa-check bk-fg-success"></i></td>
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
							onclick="$('#myModal').modal('show');">石马区项目</a></td>
						<td>重点项目</td>
						<td>一公告</td>
						<td>10,000</td>
						<td>10,000</td>
						<td>10,000</td>
						<td>长沙市雨花区雨花街道石马社区</td>
						<td><i class="fa fa-check bk-fg-success"></i></td>
						<td><a class="label label-dark"
							onclick="$('#myModal').modal('show');">查看</a></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="10">
							<div class="row"></div>
							<div class="pull-left">
								<button type="button" class="bk-margin-5 btn btn-default btn-sm">导出选中的项目台账</button>
								|
								<button type="button" class="bk-margin-5 btn btn-default btn-sm">打印选中的项目台账</button>

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
	<div class="modal-dialog" style="width:1200px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title bk-fg-primary">项目详细信息</h4>
			</div>
			<div class="modal-body">
				<h4 class="ui header text-center text-primary">
					<strong>城南名著项目</strong>
				</h4>
				<table class="table table-striped">
					<tbody>
						<tr>
							<td class="active text-right"><strong>审批号：</strong></td>
							<td>11254114545</td>
							<td class="active text-right"><strong>项目地址：</strong></td>
							<td>长沙市雨花区裕华路石马社区</td>
							<td class="active text-right"><strong>项目类型：</strong></td>
							<td>重点项目</td>
						</tr>
						<tr>
							<td class="active text-right"><strong>项目启动时间：</strong></td>
							<td>2011/11/11</td>
							<td class="active text-right"><strong>征地面积：</strong></td>
							<td>100</td>
							<td class="active text-right"><strong>应拆栋数：</strong></td>
							<td>555</td>
						</tr>
						<tr>
							<td class="active text-right"><strong>应拆户数：</strong></td>
							<td>100</td>
							<td class="active text-right"><strong>应拆面积（合法）：</strong></td>
							<td>112</td>
							<td class="active text-right"><strong>应拆面积（违章）：</strong></td>
							<td>110</td>
						</tr>
						<tr>
							<td class="active text-right"><strong>应动迁人口：</strong></td>
							<td>1000</td>
							<td class="active text-right"><strong>应付补偿款(元)：</strong></td>
							<td>1000</td>
							<td class="active text-right"><strong>是否已启动：</strong></td>
							<td><i class="fa fa-check text-success"></i></td>
						</tr>
					</tbody>
				</table>
				<div class="table-responsive" style="margin:40px 30px;">
					<table
						class="table table-striped table-bordered bootstrap-datatable datatable">
						<thead>
							<tr>
								<th>公告类型</th>
								<th>公告文号</th>
								<th>公告时间</th>
								<th>公告批文</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>一公告</td>
								<td>515451564515</td>
								<td>2011/11/11</td>
								<td><a class="label label-primary">点击下载</a></td>
							</tr>
							<tr>
								<td>二公告</td>
								<td>515451564515</td>
								<td>2011/11/11</td>
								<td><a class="label label-primary">点击下载</a></td>
							</tr>
							<tr>
								<td>三公告</td>
								<td>515451564515</td>
								<td>2011/11/11</td>
								<td><a class="label label-primary">点击下载</a></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h6>项目每月台账详细信息</h6>
					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table
								class="table table-striped table-bordered bootstrap-datatable datatable">
								<thead>
									<tr>
										<th>月份</th>
										<th>拆除栋数</th>
										<th>腾地数</th>
										<th>拆除面积（合法）</th>
										<th>拆除面积（违章）</th>
										<th>动迁人口数</th>
										<th>所付补偿款（元）</th>
										<th>下达期限腾地决定书</th>
										<th>申请法院执行</th>
										<th>已发实施强制户数</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>2015年2月</td>
										<td>100</td>
										<td>100</td>
										<td>100</td>
										<td>100</td>
										<td>100</td>
										<td>100</td>
										<td>100</td>
										<td>100</td>
										<td>100</td>
									</tr>
									<tr>
										<td>2015年3月</td>
										<td>100</td>
										<td>100</td>
										<td>100</td>
										<td>100</td>
										<td>100</td>
										<td>100</td>
										<td>100</td>
										<td>100</td>
										<td>100</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="row">
							<div
								class="col-lg-4 col-lg-offset-4 col-sm-5 col-sm-offset-2 recap pull-right">
								<table class="table table-clear">
									<tbody>
										<tr>
											<td class="left"><strong>总拆除栋数</strong></td>
											<td class="right">12,343,232</td>
										</tr>
										<tr>
											<td class="left"><strong>总腾地数</strong></td>
											<td class="right">100</td>
										</tr>
										<tr>
											<td class="left"><strong>总拆除面积（合法）</strong></td>
											<td class="right">100</td>
										</tr>
										<tr>
											<td class="left"><strong>总拆除面积（违章）</strong></td>
											<td class="right">222</td>
										</tr>
										<tr>
											<td class="left"><strong>总动迁人口数</strong></td>
											<td class="right">333</td>
										</tr>
										<tr>
											<td class="left"><strong>总所付补偿款（元）</strong></td>
											<td class="right">444</td>
										</tr>
										<tr>
											<td class="left"><strong>总下达期限腾地决定书</strong></td>
											<td class="right">555</td>
										</tr>
										<tr>
											<td class="left"><strong>总申请法院执行</strong></td>
											<td class="right">666</td>
										</tr>
										<tr>
											<td class="left"><strong>总已发实施强制户数</strong></td>
											<td class="right">777</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>
