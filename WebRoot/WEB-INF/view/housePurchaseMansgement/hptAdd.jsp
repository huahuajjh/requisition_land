<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<style type="text/css">
.fileBtn{
	position: relative;	
}
.fileBtn input{
	position: absolute;
	top:0;
	right: 0;
	width: 100%;
	height: 100%;
	display: block;
	cursor:pointer;
	filter:alpha(opacity=0); /*IE滤镜，透明度50%*/
	-moz-opacity:0; /*Firefox私有，透明度50%*/
	opacity:0;/*其他，透明度50%*/
}
</style>
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<div class="row">
			<div class="col-xs-12 text-left bk-vcenter">
				<h6 class="bk-margin-off">导入购房券信息</h6>
			</div>
		</div>
	</div>
	<div class="panel-body">
		<div class="input-group" style="width:100%;">
			<div class="form-control" id="fileName"></div>
			<div class="input-group-btn" style=" width: 300px;">
				<button type="button" class="btn btn-default btn-primary fileBtn">
					<input type="file" id="filePath">
					<i class="fa fa-folder-open"></i> 浏览
				</button>
				<button type="button" class="btn btn-default btn-success" id="upLoadeFile">
					<i class="fa fa-upload"></i> <span>上传</span>
				</button>
				<a href="template/housePurchaseTemplate.xlsx" target="_blank" class="btn btn-default btn-info">
					<i class="fa fa-download"></i> 下载模板
				</a>
				<button type="button" class="btn btn-default btn-link bk-fg-danger" data-toggle="tooltip" title="上传失败" onclick="$('#showErrorModal').modal('show');" id="errorBtn">
					<i class="fa fa-times"></i> <span>0</span>
				</button>
			</div>
		</div>
	</div>
</div>

<form class="panel form-horizontal" id="addHPT">
	<div class="panel-heading bk-bg-primary">
		<h6>手工添加购房券信息</h6>
	</div>
	<div class="panel-body">
			<div class="form-group">
	        	<label class="col-md-3 control-label">身份证</label>
	         	<div class="col-md-5">
	             	<input type="text" id="idNumber"  class="form-control"  maxlength="20" placeholder="请输入需要录入人的身份证" />
	        	</div>
	      	</div>
	      	<div class="form-group">
	        	<label class="col-md-3 control-label">姓名</label>
	         	<div class="col-md-5">
	         	<input type="text" id="name" class="form-control"  maxlength="5" placeholder="身份证所属人姓名" />
	        	</div>
	      	</div>
	      	<div class="form-group">
	        	<label class="col-md-3 control-label"></label>
	         	<div class="col-md-5">
	         	<button class="btn btn-primary" id="idNumberBtn" type="button"><i class="fa fa-search"></i> 获取</button>
	         	<button type="button" class="btn btn-default" onclick="$('#selectPerson').modal('show');">选择人员</button>
	        	</div>
	      	</div>
	      	<hr>
	      	<div id="showinfo">
			</div>
	</div>
</form>

<div class="modal fade" id="showErrorModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title bk-fg-primary">上传数据错误列表</h4>
			</div>
			<div class="modal-body">
				<ul class="bulletList" id="bulletList">
				</ul>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="selectPerson">
  <div class="modal-dialog">
    <div class="modal-content">
    </div>
  </div>
</div>
<div class="modal fade" id="showProInfoModal">
  <div class="modal-dialog">
    <div class="modal-content" id="showProInfoArea">
    </div>
  </div>
</div>
<script id="errorItemTemplate" type="text/x-handlebars-template">
{{#each this}}
<li class="red">
	<span class="title">错误描述：{{msg}}</span>
	<span class="description truncate">错误行数：在文件的 {{rowIndex}} 行,第 {{colVal}} 列</span>
</li>
{{/each}}
</script>
<script id="showInfoTemplate" type="text/x-handlebars-template">
<div class="form-group">
	<label class="col-md-3 control-label">姓名</label>
	<div class="col-md-5">
		<div class="form-control-static" >{{name}}</div>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label">所属项目</label>
	<div class="col-md-5">
		<div class="form-control-static" >
			<a href="javascript:;" class="text-primary" onclick="showProInfo('{{proId}}')">{{proName}}</a>
		</div>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label">身份证</label>
	<div class="col-md-5">
		<div class="form-control-static" >{{idNumber}}</div>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label">与户主关系</label>
	<div class="col-md-5">
		<div class="form-control-static" >{{relationshipStr}}</div>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label">是否独生子女</label>
	<div class="col-md-5">
		<div class="form-control-static">
			{{#if onlyChildNumber}}
			<i class="fa fa-check text-success"></i>
			{{else}}
			<i class="fa fa-times text-danger"></i>
			{{/if}}
		</div>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="textarea-input">是否半边户</label>
	<div class="col-md-5">
		<div class="form-control-static">
			{{#if half}}
				<i class="fa fa-check text-success"></i>
			{{else}}
				<i class="fa fa-times text-danger"></i>
			{{/if}}
		</div>
	</div>
</div>

<div class="form-group">
	<label class="col-md-3 control-label">购房券金额（万元）<span class="text-danger">*</span></label>
	<div class="col-md-5">
		<input type="text" name="money" class="form-control" id="money" placeholder="请输入购房券金额（万元）" maxlength="15">
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="select">购房券券号<span class="text-danger">*</span></label>
	<div class="col-md-5">
		<input type="text" name="quanNumber"  class="form-control" id="quanNumber" placeholder="请输入购房券券号" maxlength="30">
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="select">制券时间<span class="text-danger">*</span></label>
	<div class="col-md-5">
		<input type="text" name="time" class="form-control" id="quanTime" placeholder="____/__/__"
			data-plugin-datepicker data-plugin-masked-input data-input-mask="9999/99/99">
	</div>
</div>
<hr>
<div class="form-group">
	<div class="col-md-8">
		<Button type="submit" class="btn btn-primary button-next pull-right" id="subDataBtn" >保存</Button>
	</div>
</div>
 
</script>
<script type="text/javascript" src="assets/pageJs/housePurchaseMansgement/hptAdd.js"></script>