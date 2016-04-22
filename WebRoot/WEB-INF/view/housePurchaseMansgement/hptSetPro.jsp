<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<style>
	.modal {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: 1050;
    display: none;
    overflow: auto;
    -webkit-overflow-scrolling: touch;
    outline: 0;
}
</style>
<form class="panel" onsubmit="return false;">
	<div class="panel-heading bk-bg-primary">
		<h6>查询购房券</h6>
		<div class="panel-actions">
			<a href="javascript:;" class="btn-minimize"><i
				class="fa fa-chevron-up"></i></a>
		</div>
	</div>
	<div class="panel-body">
		<div class="row">
				<div class="col-md-3">
					<div class="form-group downImput">
						<label>项目名称</label>
						<input type="text" id="queryPrName" maxlength="20" class="form-control" placeholder="请输入要查询的项目名称" autocomplete="OFF" />
						<ul class="dropdown-menu" id="queryPrDown">
						</ul>
					</div>
				</div>
			<div class="col-md-12">
				<button type="submit" class="btn btn-primary" onclick="tableData.goPage(1); ">查询</button>
				<button type="button" class="btn btn-default"
					onclick="$('#selectProInfoModal').modal('show');">选择项目</button>
			</div>
		</div>
	</div>
</form>

<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<div class="row">
			<div class="col-xs-5 text-left bk-vcenter">
				<h6>项目台账</h6>
			</div>
			<div class="col-xs-7 bk-vcenter text-right">
				每页显示<select class="select_top" id="dataPageCount">
					<option value="10">10</option>
					<option value="20">20</option>
					<option selected value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
				</select>条数据,总共有<span id="countArea">0</span>个项目。
			</div>
		</div>
	</div>
	<div class="panel-body">
		<div class="table-responsive">
			<table
				class="table table-bordered table-striped table-condensed table-hover">
				<thead>
					<tr>
						<th></th>
						<th>姓名</th>
						<th>身份证件</th>
						<th>补贴金额（万元）</th>
						<th>购房券券号</th>
						<th>购房券状态</th>
					</tr>
				</thead>
				<tbody id="dataTbody">
				</tbody>
				<tfoot>
					<tr>
						<td colspan="8">
							<button type="button" id="faFangSelectData"
								class="bk-margin-5 btn btn-success">
								<i class="fa fa-rmb"></i> 发放选中购房券
							</button>
							<div class="bk-margin-5 btn-group pull-right" id="pageArea">
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</div>

<form class="modal fade" id="lingQuModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title bk-fg-primary">购房券领取</h4>
			</div>
			<div class="modal-body" id="lingQuArea"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="submit" class="btn btn-primary">保存</button>
			</div>
		</div>
	</div>
</form>

<div class="modal fade" id="phonePaiZhaoModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title">拍摄照片</h4>
			</div>
			<div class="modal-body" id="phonePaiZhaoBody"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="selectProInfoModal">
  <div class="modal-dialog">
    <div class="modal-content">
    </div>
  </div>
</div>

<script id="queryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{proName}}</a></li>
</script>
<script id="logItemTemplate" type="text/x-handlebars-template">
<style type="text/css">
.autoTbale td,.autoTbale th {
	white-space: nowrap;
}
</style>
<div style="overflow-x:auto;width: 100%;">
	<table class="table table-hover table-bordered autoTbale">
		<thead>
			<tr>
				<td>购房券所属人姓名</td>
				<td>购房券所属人身份证件</td>
				<td>购房券券号</td>
				<td>补贴金额（万元）</td>
				<td>制券时间</td>
				<td>领用人姓名</td>
				<td>领用人身份证件</td>
				<td>领用时间</td>
				<td>领用凭证</td>
				<td>领取备注</td>
			</tr>
		</thead>
		<tbody>
			{{#each this}}
			<tr>
				<td>{{resideName}}</td>
				<td>{{resideIdNumber}}</td>
				<td>{{resideTicketNumber}}</td>
				<td>{{resideBonus}}</td>
				<td>{{resideMakeTime}}</td>
				<td>{{name}}</td>
				<td>{{idNumber}}</td>
				<td>{{gettingDate}}</td>
				<td>{{evidenceOfGetting}}</td>
				<td>{{remark}}</td>
			</tr>
			{{/each}}
		</tbody>
	</table>
</div>
</script>
<script id="entrytemplate" type="text/x-handlebars-template">
<tr>
	<td>
		<div class="checkbox-custom">
			<input type="checkbox" name="check"> <label></label>
		</div>
	</td>
	<td>{{name}}</td>
	<td>{{idNumber}}</td>
	<td>{{bonus}}</td>
	<td>{{ticketNumber}}</td>
	<td>正常</td>
</tr>
</script>
<script id="lingQuTemplate" type="text/x-handlebars-template">
<div class="panel-body">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h6 class="panel-title">已选人员</h6>
		</div>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>姓名</th>
					<th>身份证件</th>
					<th>补贴金额（万元）</th>
					<th>购房券券号</th>
					<th>制券时间</th>
				</tr>
			</thead>
			<tbody>
				{{#each item}}
				<tr>
					<td>{{name}}</td>
					<td>{{idNumber}}</td>
					<td>{{bonus}}</td>
					<td>{{ticketNumber}}</td>
					<td>{{makeTime}}</td>
				</tr>
				{{/each}}
			</tbody>
		</table>
		<div class="panel-footer">
			<span>总共领取金额（万元）：</span>
			<strong>{{money}}</strong>
		</div>
</div>
<div class="row">
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">领用人姓名</label>
			<input type="text" name="name" class="form-control" placeholder="请输入领取人姓名" maxlength="15" />
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">领用人身份证件</label>
			<input type="text" name="idNumber" class="form-control" placeholder="请输入领用人身份证件" maxlength="20" />
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">领用时间</label>
			<input type="text" name="time" class="form-control" placeholder="____/__/__" data-plugin-datepicker data-plugin-masked-input data-input-mask="9999/99/99" />
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">领用凭证</label>
			<div class="form-control-static"">
				<input type="file" id="upFile" style="display:none;" accept="image/*" />
				<a class="label label-primary" id="upBtn" onclick="upFileZhaoPian();">上传</a>
				<a class="label label-primary" id="zhaoBtn" onclick="paiZhao();">拍照</a>
				<a class="label label-success" id="yuLanBtn" style="display: none">预览</a>
				<span class="label">
					<i class="fa fa-check text-success" id="paiZhaoFileCheckState" style="display: none"></i>
					<img src="assets/img/login.gif" id="paiZhaoFileLoginState" style="display: none">
				</span>
			</div>
		</div>
	</div>
	<div class="col-md-12">
		<div class="form-group">
			<label class="control-label">领取备注</label>
			<textarea name="remark" maxlength="50" class="form-control" rows="3" placeholder="请输入领取备注"></textarea>
		</div>
	</div>
</div>
</script>
<script src="assets/pageJs/housePurchaseMansgement/hptSetPro.js"></script>