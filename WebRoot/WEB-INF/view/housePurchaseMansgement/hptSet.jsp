<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<form class="panel" id="queryForm">
	<div class="panel-heading bk-bg-primary">
		<h6>查询购房券</h6>
		<div class="panel-actions">
			<a href="javascript:;" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
		</div>
	</div>
	<div class="panel-body">
		<div class="row">
			<div class="col-md-6">
				<div class="form-group downImput">
					<label>户主身份证</label>
					<input type="text" name="idNumber" id="idNumber" class="form-control" placeholder="请输入要查询的户主身份证" maxlength="20" autocomplete="OFF" />
					<ul class="dropdown-menu" id="idNumberQueryPrDown">
					</ul>
				</div>
			</div>
			<div class="col-md-12">
			<button type="submit" class="btn btn-primary" id="queryBtn">查询</button>
			<button type="button" class="btn btn-default" onclick="$('#selectHuPerson').modal('show');">选择户</button>
			</div>
		</div>
	</div>
</form>

<div id="qDataArea">
</div>

<form class="modal fade" id="lingQuModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title bk-fg-primary">购房券领取</h4>
			</div>
			<div class="modal-body" id="lingQuArea">
			</div>
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
      <div class="modal-body" id="phonePaiZhaoBody">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" >关闭</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="selectHuPerson">
  <div class="modal-dialog">
    <div class="modal-content">
    </div>
  </div>
</div>

<script id="idNumberQueryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{idNumber}}-{{name}}</a></li>
</script>
<script id="entrytemplate" type="text/x-handlebars-template">
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6>购房券户发放</h6>
	</div>
	<div class="panel-body">
		<div class="table-responsive">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th></th>
						<th>姓名</th>
						<th>身份证</th>
						<th>与户主关系</th>
						<th>补贴金额（万元）</th>
						<th>购房券券号</th>
						<th>购房券状态</th>
					</tr>
				</thead>
				<tbody id="famItems">
				</tbody>
				<tfoot>
					<tr>
						<td colspan="8">
							<button type="button" id="faFangSelectData" class="bk-margin-5 btn btn-success">
								<i class="fa fa-rmb"></i> 发放选中购房券
							</button>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</div>
</script>
<script id="famItemTemplate" type="text/x-handlebars-template">
<tr>
	<td>
		<div class="checkbox-custom">
			{{#if isCheck}}
			<input type="checkbox" name="check"> <label></label>
			{{else}}
			<input type="checkbox" disabled> <label></label>
			{{/if}}
		</div>
	</td>
	<td>{{name}}</td>
	<td>{{idNumber}}</td>
	<td>{{relationship}}{{#if otherRelationship}}-{{otherRelationship}}{{/if}}</td>
	<td>{{bonus}}</td>
	<td>{{ticketNumber}}</td>
	<td>{{ticketName}}</td>
</tr>
</script>
<script id="lingQuTemplate" type="text/x-handlebars-template">
<div class="panel-body">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h6 class="panel-title">已选家庭人员</h6>
		</div>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>姓名</th>
					<th>身份证</th>
					<th>与户主关系</th>
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
					<td>{{relationship}}</td>
					<td>{{bonus}}</td>
					<td>{{ticketNumber}}</td>
					<td>{{makeTime}}</td>
				</tr>
				{{/each}}
			</tbody>
		</table>
		<div class="panel-footer">
			<span>户主:</span>
			<strong>{{huZhuName}}</strong>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span>总共领取金额（万元）：</span>
			<strong>{{money}}</strong>
		</div>
</div>
<div class="row">
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">领用人姓名</label>
			<input type="text" name="name" class="form-control" placeholder="请输入领取人姓名" maxlength="5" />
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">领用人身份证</label>
			<input type="text" name="idNumber" class="form-control" placeholder="请输入领用人身份证" maxlength="20" />
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
</div>
</script>
<script type="text/javascript" src="assets/pageJs/housePurchaseMansgement/hptSet.js"></script>