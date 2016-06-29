<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
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
				<h6 class="bk-margin-off">导入已迁户人员信息</h6>
			</div>
		</div>
	</div>
	<div class="panel-body">
<div class="input-group" style="width:100%;">
			<div class="form-control" id="fileName"></div>
			<div class="input-group-btn" style=" width: 300px;">
				<input type="file" id="filePath" style="display:none;">
				<button type="button" class="btn btn-default btn-primary fileBtn" id="upFileExl">
					<i class="fa fa-folder-open"></i> 浏览
				</button>
				<button type="button" class="btn btn-default btn-success" id="upLoadeFile">
					<i class="fa fa-upload"></i> <span>上传</span>
				</button>
				<a href="template/removedInfo.xlsx" target="_blank"  class="btn btn-default btn-info">
					<i class="fa fa-download"></i> 下载模板
				</a>
				<button type="button" class="btn btn-default btn-link bk-fg-danger" data-toggle="tooltip" title="上传失败" onclick="$('#showErrorModal').modal('show');" id="errorBtn">
					<i class="fa fa-times"></i> <span>0</span>
				</button>
			</div>
		</div>
	</div>
</div>

<form class="panel form-horizontal" id="addRemoveInfo">
	<div class="panel-heading bk-bg-primary">
		<h6>手工添加已迁户信息</h6>
	</div>
	<div class="panel-body">
	    <div class="form-group">
	    	<label class="col-md-3 control-label">迁户人姓名<span class="text-danger">*</span></label>
	    	<div class="col-md-5">
	    		<input type="text" name="name" maxlength="15" class="form-control" placeholder="请输入迁户人姓名">
	    	</div>
	    </div>
	    <div class="form-group">
	    	<label class="col-md-3 control-label">迁户人身份证<span class="text-danger">*</span></label>
	    	<div class="col-md-5">
	    		<input type="text" name="idNumber" maxlength="20" class="form-control" placeholder="请输入迁户人身份证">
	    	</div>
	    </div>
	    <div class="form-group">
	    	<label class="col-md-3 control-label">出生日期<span class="text-danger">*</span></label>
	    	<div class="col-md-5">
	    		<input type="text" name="birthday" class="form-control" placeholder="____/__/__" data-plugin-datepicker="" data-plugin-datepicker-nottoday="" data-plugin-masked-input="" data-input-mask="9999/99/99">
	    	</div>
	    </div>
	   	<div class="form-group">
	    	<label class="col-md-3 control-label">拆迁日期<span class="text-danger">*</span></label>
	    	<div class="col-md-5">
	    		<input type="text" name="removeDate" class="form-control" placeholder="____/__/__" data-plugin-datepicker="" data-plugin-datepicker-nottoday="" data-plugin-masked-input="" data-input-mask="9999/99/99">
	    	</div>
	    </div>
	    <div class="form-group">
	    	<label class="col-md-3 control-label">地址<span class="text-danger">*</span></label>
	    	<div class="col-md-5">
	    		<input type="text" name="address" maxlength="60" class="form-control" placeholder="请输入地址">
	    	</div>
	    </div>
	   	<div class="form-group">
	    	<label class="col-md-3 control-label">适用政策</label>
	    	<div class="col-md-5">
	    		<input type="text" name="fitPolicy" maxlength="15" class="form-control" placeholder="请输入适用政策">
	    	</div>
	    </div>
	    <div class="form-group">
	    	<div class="col-md-8">
	    		<br>
	    		<button type="submit" class="btn btn-primary button-next pull-right">保存</button>
	    	</div>
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

<script id="logImportItemTemplate" type="text/x-handlebars-template">
<style type="text/css">
.autoTbale td,.autoTbale th {
	white-space: nowrap;
}
</style>
<div style="overflow-x:auto;width: 100%;">
	<table class="table table-hover table-bordered autoTbale">
		<thead>
			<tr>
				<td>迁户人姓名</td>
				<td>适用政策</td>
				<td>迁户人身份证</td>
				<td>出生日期</td>
				<td>拆迁日期</td>
				<td>迁户人地址</td>
			</tr>
		</thead>
		<tbody>
			{{#each this}}
			<tr>
				<td>{{name}}</td>
				<td>{{fitPolicy}}</td>
				<td>{{idNumber}}</td>
				<td>{{birthDay}}</td>
				<td>{{removeDate}}</td>
				<td>{{address}}</td>
			</tr>
			{{/each}}
		</tbody>
	</table>
</div>
</script>
<script id="logItemTemplate" type="text/x-handlebars-template">
<table>
	<tr>
		<td class="text-right">迁户人姓名：</td>
		<td>{{name}}</td>
	</tr>
	<tr>
		<td class="text-right">迁户人身份证：</td>
		<td>{{idNumber}}</td>
	</tr>
	<tr>
		<td class="text-right">出生日期：</td>
		<td>{{birthday}}</td>
	</tr>
	<tr>
		<td class="text-right">拆迁日期：</td>
		<td>{{removeDate}}</td>
	</tr>
	<tr>
		<td class="text-right">迁户人地址：</td>
		<td>{{address}}</td>
	</tr>
	<tr>
		<td class="text-right">适用政策：</td>
		<td>{{fitPolicy}}</td>
	</tr>
</table>
</script>
<script id="errorItemTemplate" type="text/x-handlebars-template">
{{#each this}}
<li class="red">
	<span class="title">错误描述：{{msg}}</span>
	<span class="description truncate">错误行数：在文件的 {{rowIndex}} 行,第 {{colVal}} 列</span>
</li>
{{/each}}
</script>
<script type="text/javascript" src="assets/pageJs/removedDocManagement/removedInfoAdd.js"></script>