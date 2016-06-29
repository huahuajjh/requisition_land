<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<form class="panel form-horizontal" id="addVisitForm" onsubmit="return false;">
	<div class="panel-heading bk-bg-primary">
		<h6>添加上访上信息</h6>
	</div>
	<div class="panel-body">
	    <div class="form-group">
	    	<label class="col-md-4 control-label">上访者姓名<span class="text-danger">*</span></label>
	    	<div class="col-md-5">
	    		<input type="text" name="name" class="form-control" placeholder="请输入上访者姓名" maxlength="15" />
	    	</div>
	    </div>
	    <div class="form-group">
	    	<label class="col-md-4 control-label">上访者电话<span class="text-danger">*</span></label>
	    	<div class="col-md-5">
	    		<input type="text" name="phone" class="form-control" placeholder="请输入上访者电话" maxlength="15" />
	    	</div>
	    </div>
	    <div class="form-group">
	    	<label class="col-md-4 control-label">上访者的住址<span class="text-danger">*</span></label>
	    	<div class="col-md-5">
	    		<input type="text" name="address" class="form-control" placeholder="请输入上访者的住址" maxlength="20" />
	    	</div>
	    </div>
		<div class="form-group">
			<label class="col-md-4 control-label">选择上访项目<span class="text-danger">*</span></label>
			<div class="col-md-5">
				<div class="input-group" style="width: 100%;" id="proData">
					<input type="text" class="form-control" id="proName"/>
					<span class="input-group-btn" style="width:86px;">
						<button type="button" class="btn btn-default" onclick="$('#showProInfoModal').modal('show');">选择项目</button>
					</span>
				</div>
			</div>
		</div>
	    <div class="form-group">
	    	<label class="col-md-4 control-label" for="disabled-input">上访时间<span class="text-danger">*</span></label>
	    	<div class="col-md-5">
	    		<input type="text" class="form-control" name="time" placeholder="____/__/__" data-plugin-datepicker="" data-plugin-masked-input="" data-input-mask="9999/99/99">
	    	</div>
	    </div>
	   	<div class="form-group">
	    	<label class="col-md-4 control-label">信访途径</label>
	    	<div class="col-md-5">
	    		<input type="text" name="source" class="form-control" placeholder="请输入信访途径" maxlength="20" />
	    	</div>
	    </div>
	    <div class="form-group">
	    	<label class="col-md-4 control-label">上访者的其他信息</label>
	    	<div class="col-md-5">
	    		<textarea class="form-control" name="otherMsg" rows="3"  maxlength="140" placeholder="请输入上访者的其他信息"></textarea>
	    	</div>
	    </div>
		<div class="form-group">
			<label class="col-md-4 control-label">上访凭证</label>
			<div class="col-md-5">
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
	    <div class="form-group">
	    	<label class="col-md-4 control-label" for="textarea-input">相关资料</label>
	    	<div class="col-md-5">
	    		<div class="controls">
	    			<div class="input-group upLoadFile" id="upLoadFile" style="width:100%;">
	    				<input type="hidden" class="upFileHideVal" name="fileVal">
	    				<input class="form-control showUpFileName" type="text" disabled="" placeholder="请上传相关资料">
	    				<span class="input-group-btn upFileOperation" style="width:210px;">
	    					<button class="btn btn-default upFileSelectBtn" type="button" id="xzWJ">选择文件</button>
	    					<input type="file" class="upFileVal" style="display:none;">
	    					<button class="btn btn-default upFileUpBtn" type="button" id="scWJ">上传文件</button>
	    					<span class="btn btn-link upFileLogin" style="display:none;cursor: auto;"><img src="assets/img/login.gif"></span>
	    					<span class="btn btn-link upFileSuccess" style="display:none;cursor: auto;"><i class="fa fa-check text-success"></i></span>
	    					<span class="btn btn-link upFileError" style="display:none;cursor: auto;"><i class="fa fa-times text-danger"></i></span>
	    				</span>
	    			</div>
	    		</div>
	    	</div>
	    </div>
	    <div class="form-group">
	    	<label class="col-md-4 control-label">处理意见</label>
	    	<div class="col-md-5">
	    		<textarea class="form-control" name="reasonMsg" placeholder="请输入处理意见" rows="5" maxlength="140"></textarea>
	    	</div>
	    </div>
	    <div class="form-group">
	    	<div class="col-md-9">
	    		<br>
	    		<button type="submit" class="btn btn-primary button-next pull-right">保存</button>
	    	</div>
	    </div>
	</div>
</form>

<div class="modal fade" id="showProInfoModal">
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

<script id="logItemTemplate" type="text/x-handlebars-template">
<table>
	<tr>
		<td class="text-right">上访者姓名：</td>
		<td>{{visitorName}}</td>
	</tr>
	<tr>
		<td class="text-right">上访者电话：</td>
		<td>{{visitorTel}}</td>
	</tr>
	<tr>
		<td class="text-right">上访者的住址：</td>
		<td>{{visitorAddr}}</td>
	</tr>
	<tr>
		<td class="text-right">选择上访项目：</td>
		<td>{{proName}}</td>
	</tr>
	<tr>
		<td class="text-right">上访时间：</td>
		<td>{{visitTime}}</td>
	</tr>
	<tr>
		<td class="text-right">信访途径：</td>
		<td>{{visitsWay}}</td>
	</tr>
	<tr>
		<td class="text-right">上访者的其他信息：</td>
		<td>{{otherMsg}}</td>
	</tr>
	<tr>
		<td class="text-right">上访凭证：</td>
		<td>{{img}}</td>
	</tr>
	<tr>
		<td class="text-right">相关资料：</td>
		<td>{{visitMaterialPath}}</td>
	</tr>
	<tr>
		<td class="text-right">处理意见：</td>
		<td>{{visitReason}}</td>
	</tr>
</table>
</script>
<script id="entrytemplate" type="text/x-handlebars-template">
<tr>
	<td>{{proName}}</td>
	<td>{{proTypeStr}}</td>
	<td>{{sequenceStr}}</td>
	<td>{{totalAddress}}</td>
	<td><a class="label label-primary" onclick="selectProInfo(this);">选择</a></td>
</tr>
</script>
<script id="queryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{proName}}</a></li>
</script>
<script type="text/javascript" src="assets/pageJs/messageManagement/visitAdd.js"></script>