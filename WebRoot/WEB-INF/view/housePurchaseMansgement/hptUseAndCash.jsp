<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<form class="panel" id="queryData">
	<div class="panel-heading bk-bg-primary">
		<h6>查询购房券</h6>
		<div class="panel-actions">
			<a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
		</div>
	</div>
	<div class="panel-body">
		<div class="row">
			<div class="col-md-6">
				<div class="form-group downImput">
					<label>持有人身份证</label>
					<input type="text" name="idNumber" id="idNumber" class="form-control" placeholder="请输入要查询的持有人身份证"  maxlength="20" autocomplete="OFF" />
					<ul class="dropdown-menu" id="idNumberQueryPrDown">
					</ul>
				</div>
			</div>
			<div class="col-md-12">
				<button type="submit" class="btn btn-primary" id="queryBtn">查询</button>
				<button type="button" class="btn btn-default" onclick="$('#selectPerson').modal('show');">选择人员</button>
			</div>
		</div>
	</div>
</form>

<form id="goufangQuanShiYong">
</form>

<form class="modal fade" id="useModal" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">购房券使用与兑现</h4>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn btn-primary">保存</button>
      </div>
    </div>
  </div>
</form>

<div class="modal fade" id="showProInfoModal">
  <div class="modal-dialog">
    <div class="modal-content" id="showProInfoArea">
    </div>
  </div>
</div>

<div class="modal fade" id="selectPerson">
  <div class="modal-dialog">
    <div class="modal-content">
    </div>
  </div>
</div>

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
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>

<script id="modalDatatemplate" type="text/x-handlebars-template">
<div class="panel panel-default">
	<div class="panel-heading">购房券信息</div>				
	<table class="table table-bordered">
		<tbody>
			<tr>
				<td class="active">姓名</td>
				<td>{{name}}</td>
				<td class="active">身份证号</td>
				<td>{{idNumber}}</td>
			</tr>
			<tr>
				<td class="active">券号</td>
				<td>{{ticketNumber}}</td>
				<td class="active">补贴金额（万元）</td>
				<td>{{bonus}}</td>
			</tr>
			<tr>
				<td class="active">制券时间</td>
				<td>{{makeTime}}</td>
				<td class="active">购房券状态</td>
				<td>{{ticketName}}</td>
			</tr>
			<tr>
				<td class="active">所属项目</td>
				<td colspan="3"><a href="javascript:;" class="text-primary" onclick="showProInfo('{{proId}}')">{{proName}}</a></td>
			</tr>
		</tbody>
	</table>
</div>
<div class="row">
    <div class="col-md-6">
    	<div class="form-group">
    		<label class="control-label">使用时间</label>
    		<input type="text" name="time" class="form-control" placeholder="____/__/__" data-plugin-datepicker data-plugin-masked-input data-input-mask="9999/99/99">
    	</div>
    </div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">使用类型</label>
			<select class="form-control" size="1" name="type">
				<option value="">请选择使用类型</option>
				<option value="0">使用</option>
				<option value="1">兑现</option>
			</select>
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">使用去向</label>
			<textarea class="form-control" name="quXiang" rows="3" placeholder="请输入使用去向" maxlength="140"></textarea>
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">情况说明</label>
			<textarea class="form-control" name="shuoMing" rows="3" placeholder="请输入情况说明	" maxlength="140"></textarea>
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">相关凭证</label>
			<div class="controls">
					<div class="input-group upLoadFile" id="upLoadFile" style="width:100%;">
						<input type="hidden" class="upFileHideVal" name="evidencePath" />
						<input class="form-control showUpFileName" type="text" readonly placeholder="请上传相关凭证">
						<span class="input-group-btn upFileOperation" style="width:210px;">
							<button class="btn btn-default upFileSelectBtn" type="button" id="xzWJ">选择文件</button>
							<input type="file" class="upFileVal" style="display:none;" />
							<button class="btn btn-default upFileUpBtn" type="button" id="scWJ">上传文件</button>
							<span class="btn btn-link upFileLogin" style="display:none;cursor: auto;">
								<img src="assets/img/login.gif" />
							</span>
							<span class="btn btn-link upFileSuccess" style="display:none;cursor: auto;">
								<i class="fa fa-check text-success"></i>
							</span>
							<span class="btn btn-link upFileError" style="display:none;cursor: auto;">
								<i class="fa fa-times text-danger"></i></span>
						</span>
					</div>
				</div>
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">图片凭证</label>
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

<script id="logItemTemplate" type="text/x-handlebars-template">
<table>
	<tr>
		<td class="text-right">姓名：</td>
		<td>{{resideName}}</td>
	</tr>
	<tr>
		<td class="text-right">身份证号：</td>
		<td>{{resideIdNumber}}</td>
	</tr>
	<tr>
		<td class="text-right">券号：</td>
		<td>{{ticketNumber}}</td>
	</tr>
	<tr>
		<td class="text-right">补贴金额（万元）：</td>
		<td>{{bonus}}</td>
	</tr>
	<tr>
		<td class="text-right">制券时间：</td>
		<td>{{makeTime}}</td>
	</tr>
	<tr>
		<td class="text-right">使用时间：</td>
		<td>{{usingDate}}</td>
	</tr>
	<tr>
		<td class="text-right">使用类型：</td>
		<td>{{usingType}}</td>
	</tr>
	<tr>
		<td class="text-right">使用去向：</td>
		<td>{{usingToWhere}}</td>
	</tr>
	<tr>
		<td class="text-right">情况说明：</td>
		<td>{{situationExplain}}</td>
	</tr>
	<tr>
		<td class="text-right">相关凭证：</td>
		<td>{{evidencePath}}</td>
	</tr>
	<tr>
		<td class="text-right">图片凭证：</td>
		<td>{{image}}</td>
	</tr>
</table>
</script>
<script id="idNumberQueryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{idNumber}}-{{name}}</a></li>
</script>
<script id="entrytemplate" type="text/x-handlebars-template">
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6>购房券使用和兑现</h6>
	</div>
	<div class="panel-body">
		<div class="table-responsive">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>姓名</th>
						<th>身份证</th>
						<th>补贴金额（万元）</th>
						<th>购房券券号</th>
						<th>购房券状态</th>
						<th>购房券操作</th>
					</tr>
				</thead>
				<tbody id="dataItems">
				</tbody>
			</table>
		</div>
	</div>
</div>
</script>
<script id="dataItemTemplate" type="text/x-handlebars-template">
<tr>
	<td>{{name}}</td>
	<td>{{idNumber}}</td>
	<td>{{bonus}}</td>
	<td>{{ticketNumber}}</td>
	<td>{{ticketName}}</td>
	<td>
		{{#if isCheck}}
			<a href="javascript:;" class="label label-primary" onclick="showUseModal(this);">使用与兑现</a>
		{{/if}}
	</td>
</tr>
</script>
<script type="text/javascript" src="assets/pageJs/housePurchaseMansgement/hptUseAndCash.js"></script>