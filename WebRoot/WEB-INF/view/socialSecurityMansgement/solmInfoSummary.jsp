<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!--征地汇总表格-->
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6>
			<i class="fa fa-info"></i>社保汇总信息
		</h6>
	</div>
	<div class="panel-body">
		<table class="table table-bordered form-horizontal ">
			<thead>
				<tr>
					<th colspan="5" class="active">征地基本情况</th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td colspan="5">
					<div class="form-group">
											<label class="col-md-3 control-label">社保征收方式 ：</label>
											<div class="col-md-9">
												<div class="radio-custom radio-inline">
							<input type="radio" name="isTransfer"> <label>50元+30元/M2</label>
						</div>
						<div class="radio-custom radio-inline">
							<input type="radio" name="isTransfer"> <label>60元+20元/M2</label>
						</div>
											</div>
										</div>
						
					</td>
				</tr>
			</tbody>

			<thead>
				<tr>
					<th class="active">征地项目</th>
					<th class="active">征地面积</th>
					<th class="active">社会保障费(万元)</th>
					<th class="active">土地补偿和安置补助费(万元)</th>
					<th class="active">合计(万元)</th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td class="col-md-3">
						<div class="form-group downImput">
						<input type="text" id="queryPrName" maxlength="20" class="form-control" placeholder="请输入要查询的项目名称">
						<ul class="dropdown-menu" id="queryPrDown" style="display: none;"></ul>
					</div>
					</td>
					<td>
						<div class="form-control-static">100000</div>
					</td>
					<td><input type="text" class="form-control" placeholder="?" />
					</td>

					<td><input type="text" class="form-control" placeholder="?" />
					</td>

					<td><div class="form-control-static">100000</div></td>
				</tr>
			</tbody>
		</table>

		<!--被征地农民基本情况-->
		<table class="table table-bordered">
			<thead>
				<tr>
					<th colspan="6" class="active">被征地农民基本情况</th>
				</tr>
				<tr>
					<th class="active">年龄段</th>
					<th class="active">第一年龄段</th>
					<th class="active">第二年龄段</th>
					<th class="active">第三年龄段</th>
					<th class="active">第四年龄段</th>
					<th class="active">合计</th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td>人数</td>
					<td>100</td>
					<td>100</td>
					<td>100</td>
					<td>100</td>
					<td>400</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

