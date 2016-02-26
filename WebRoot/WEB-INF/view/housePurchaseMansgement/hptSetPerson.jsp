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
				<div class="form-group">
					<label for="nf-email">持有人身份证</label>
					<input type="text" name="idNumber" id="idNumber" class="form-control" placeholder="请输入要查询的持有人身份证"  maxlength="20" />
				</div>
			</div>
			<div class="col-md-12">
				<button type="submit" class="btn btn-primary" id="queryBtn">查询</button>
				<button type="button" class="btn btn-default" onclick="$('#selectPerson').modal('show');">选择人员</button>
			</div>
		</div>
	</div>
</form>

<form id="showQueryDataArea">
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
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>

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

<script id="entrytemplate" type="text/x-handlebars-template">
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6>购房券个人发放</h6>
	</div>
	<div class="panel-body">
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
			<div class="col-md-4 col-md-offset-2">
				<div class="form-group">
					<label class="control-label">领用人姓名</label>
					<input type="text" name="name" class="form-control" placeholder="请输入领取人姓名" maxlength="5" />
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group">
					<label class="control-label">领用人身份证</label>
					<input type="text" name="idNumber" class="form-control" placeholder="请输入领用人身份证" maxlength="18" />
				</div>
			</div>
			<div class="col-md-4 col-md-offset-2">
				<div class="form-group">
					<label class="control-label">领用时间</label>
					<input type="text" name="time" class="form-control" placeholder="____/__/__" data-plugin-datepicker data-plugin-masked-input data-input-mask="9999/99/99">
				</div>
			</div>
			<div class="col-md-4">
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
			<div class="col-md-8 col-md-offset-2">
				<div class="form-group">
					<label class="control-label">领取备注</label>
					<textarea name="beiZhu" maxlength="140" class="form-control" rows="3" placeholder="请输入领取备注"></textarea>
				</div>
			</div>
			<div class="col-md-12">
				<hr>
			</div>
			<div class="col-md-8 col-md-offset-2">
				<button type="submit" class="btn btn-primary button-next pull-right">保存</button>
			</div>
		</div>
	</div>
</div>
</script>
<script type="text/javascript" src="assets/pageJs/housePurchaseMansgement/hptSetPerson.js"></script>