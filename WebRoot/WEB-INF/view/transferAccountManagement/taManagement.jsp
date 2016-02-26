<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<style type="text/css">
.autoTbale td,.autoTbale th {
	white-space: nowrap;
}
.errorBorder{
    border: 1px solid red !important;
}
</style>

<!--查询条件组件-->
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6>
			<i class="fa fa-table"></i>查询条件
		</h6>
	</div>
	<div class="panel-body">
		<div class="row">
			<div class="col-xs-3">
				<div class="form-group downImput">
					<label>项目名称</label> <input type="text" id="queryPrName" maxlength="20" class="form-control" placeholder="请输入要查询的项目名称">
					<ul class="dropdown-menu" id="queryPrDown" style="display: none;"></ul>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label for="nf-password">街道</label>
					<select id="street" name="select" class="form-control" size="1">
						<option value="">所有街道</option>
					</select>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label for="nf-password">社区</label>
					<select id="street" name="select" class="form-control" size="1">
						<option value="">所有社区</option>
					</select>
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label for="nf-password">是否转户</label>
					<select id="street" name="select" class="form-control" size="1">
						<option value="">所有类型</option>
						<option value="">否</option>
						<option value="">是</option>
					</select>
				</div>
			</div>
		</div>
		<div class="row" style="margin-top:15px;text-align:right">
			<div class="col-xs-12">
				<div class="huge blue ui buttons">
					<button class="btn btn-bg btn-primary">查询</button>
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
				</select>条数据,总共有<span id="countArea">502</span>个项目。
			</div>
		</div>
	</div>
	<div class="panel-body">
	<div style="overflow-x:auto;width: 100%;">
				<table
				class="table table-striped table-bordered bootstrap-datatable datatable autoTbale">
				<thead>
					<tr>
						<th>
							<div class="checkbox-custom">
								<input type="checkbox"> <label> 全选</label>
							</div>
						</th>
						<th>姓名</th>
						<th>身份证</th>
						<th>所属拆迁项目</th>
						<th>地址</th>
						<th>原户口类型</th>
						<th>
							是否需要转户
							<div class="form-control-static">
								<div class="row" style="width: 170px;">
										<div class="col-md-6">
											<div class="radio-custom radio-inline">
												<input type="radio" id="inline-radio1" name="inline-radios"
													value="option1"> <label for="inline-radio1">
													全部是</label>
											</div>
										</div>
										<div class="col-md-6">
											<div class="radio-custom radio-inline">
												<input type="radio" id="inline-radio1" name="inline-radios"
													value="option1"> <label for="inline-radio1">
													全部否</label>
											</div>
										</div>
									</div>
							</div>
						</th>
						<th>
							转户时间
							<div style="width: 140px;">
								<input type="text" class="form-control"  data-plugin-datepicker data-plugin-masked-input data-input-mask="9999/99/99" placeholder="____/__/__">
							</div>
						</th>
						<th>
							转户地址
							<div class="input-daterange input-group" style="width: 370px;">
								<span class="input-group-addon">街道</span>
								<select name="streetId" class="form-control" size="1" id="street">
									<option value="">请选择</option>
								</select>
								<span class="input-group-addon">社区</span>
								<select name="communityId" class="form-control" size="1" id="community">
									<option value="">请选择</option>
								</select>
							</div>
						</th>
						<th>
							转户类型
							<select id="select" name="select" class="form-control" size="1" style="width: 140px;" >
								<option value="">请选择类型</option>
								<option value="1">类型1</option>
								<option value="2">Option #2</option>
								<option value="3">Option #3</option>
							</select>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<div class="form-control-static">
								<div class="checkbox-custom">
									<input type="checkbox"> <label></label>
								</div>
							</div>
						</td>
						<td>
							<div class="form-control-static">小明</div>
						</td>
						<td>
							<div class="form-control-static">555555555555555555</div>
						</td>
						<td><div class="form-control-static">项目A</div></td>
						<td><div class="form-control-static">设施设施</div></td>
						<td><div class="form-control-static">小明纯纯粹粹</div></td>
						<td>
							<div class="form-control-static">
								<div class="row">
									<div class="col-md-6">
										<div class="radio-custom radio-inline">
											<input type="radio" id="inline-radio1" name="inline-radios"
												value="option1"> <label for="inline-radio1">
												是</label>
										</div>
									</div>
									<div class="col-md-6">
										<div class="radio-custom radio-inline">
											<input type="radio" id="inline-radio1" name="inline-radios"
												value="option1"> <label for="inline-radio1">
												否</label>
										</div>
									</div>
								</div>
							</div>
						</td>
						<td><input type="text" class="form-control"  data-plugin-datepicker data-plugin-masked-input data-input-mask="9999/99/99" placeholder="____/__/__"></td>
						<td>
							<div class="input-daterange input-group" style="width: 100%;">
								<span class="input-group-addon">街道</span>
								<select name="streetId" class="form-control" size="1" id="street">
									<option value="">请选择</option>
								</select>
								<span class="input-group-addon">社区</span>
								<select name="communityId" class="form-control" size="1" id="community">
									<option value="">请选择</option>
								</select>
							</div>
						</td>
						<td>
							<select id="select" name="select" class="form-control" size="1" style="width: 140px;" >
								<option value="">请选择类型</option>
								<option value="1">类型1</option>
								<option value="2">Option #2</option>
								<option value="3">Option #3</option>
							</select>
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="10">
							<div class="row"></div>
							<div class="pull-left">
								<button type="button" class="bk-margin-5 btn btn-primary btn-sm">批量处理选中的信息</button>

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
