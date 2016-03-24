<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
.autoTbale td,.autoTbale th {
	white-space: nowrap;
}
</style>
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6 class="bk-margin-off">查询统计</h6>
	</div>
	<form class="panel-body form-horizontal">
		<div class="form-group">
			<label class="col-md-3 control-label" for="text-input">时间段：</label>
			<div class="col-md-9">
				<div class="input-daterange input-group" data-plugin-datepicker="">
					<span class="input-group-addon">
						<i class="fa fa-calendar"></i>
					</span>
					<input type="text" class="form-control" id="startDate" placeholder="____-__-__" data-plugin-masked-input data-input-mask="9999-99-99">
					<span class="input-group-addon">到</span>
					<input type="text" class="form-control" id="endDate" placeholder="____-__-__" data-plugin-masked-input data-input-mask="9999-99-99">
					<span class="input-group-btn" style="width: 80px;">
						<button type="button" class="btn btn-primary" style="width: 100%;" onclick="tableData.goPage(1); ">查询</button>
					</span>
					<span class="input-group-btn" style="width: 80px;">
						<button type="button" class="btn btn-success"  style="width: 100%;" onclick="$('#selectExportModal').modal('show');">导出</button>
					</span>
				</div>
			</div>
		</div>
	</form>
	<hr>
	<div class="panel-body">
		<div style="overflow-x:auto;width: 100%;">
			<table class="table table-striped table-bordered bootstrap-datatable datatable autoTbale">
				<thead>
					<tr>
						<th rowspan="2">项目</th>
						<th colspan="3">合计</th>
						<th colspan="3">已领凭证</th>
						<th colspan="3">未领凭证</th>
						<th colspan="4">资金来源</th>
					</tr>
					<tr>
						<th>户数</th>
						<th>人数</th>
						<th>金额</th>
						<th>户数</th>
						<th>人数</th>
						<th>金额</th>
						<th>户数</th>
						<th>人数</th>
						<th>金额</th>
						<th>资金来源</th>
						<th>国土局出资单位计算规则</th>
						<th>其他出资单位名称</th>
						<th>其他出资单位计算规则</th>
					</tr>
				</thead>
				<tbody id="dataTbody"></tbody>
				<tfoot>
					<tr>
						<td colspan="14">
							<div class="bk-margin-5 btn-group pull-right" id="pageArea"><button type="button" class="btn btn-default disabled" jp-role="prev" jp-data="0"><i class="fa fa-angle-double-left"></i></button><button type="button" class="btn btn-default active" jp-role="page" jp-data="1">1</button><button type="button" class="btn btn-default disabled" jp-role="next" jp-data="2"><i class="fa fa-angle-double-right"></i></button></div>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</div>

<div class="modal fade" id="selectExportModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">导出需要的数据</h4>
      </div>
      <div class="modal-body">
      	<iframe src="exportHTML/statistics.html" style="border: 0;width: 100%;height: 380px;" scrolling="no"></iframe>
      </div>
    </div>
  </div>
</div>

<script id="entrytemplate" type="text/x-handlebars-template">
<tr>
	<td>{{proName}}</td>
	<td>{{totalFmlCount}}</td>
	<td>{{totalFmlItems}}</td>
	<td>{{totalAmount}}</td>
	<td>{{rcdFmlCount}}</td>
	<td>{{rcdFmlItems}}</td>
	<td>{{rcdAmount}}</td>
	<td>{{nrcdFmlCount}}</td>
	<td>{{nrcdFmlItems}}</td>
	<td>{{nrcdAmount}}</td>
	<td>{{moneyUnit}}</td>
	<td>{{{moneyUnitMsg}}}</td>
	<td>{{otherMoneyUnit}}</td>
	<td>{{{otherMoneyUnitMsg}}}</td>
</tr>
</script>
<script id="algorithmTemplate" type="text/x-handlebars-template">
{{name}}&nbsp;{{num}}&nbsp;人&nbsp;&nbsp;×&nbsp;&nbsp;{{money}}&nbsp;万元/人&nbsp;&nbsp;=&nbsp;&nbsp;{{countMoney}}&nbsp;万元<br>
</script>
<script type="text/javascript" src="assets/pageJs/statistics/statistics.js"></script>