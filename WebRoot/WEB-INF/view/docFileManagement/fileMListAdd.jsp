<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div class="panel bk-bg-white">
    <div class="panel-body">
        <form class="form-horizontal bk-margin-top-10" id="addZCFG" onsubmit="return false;">
            <div class="form-group">
                <label class="col-md-3 control-label" for="text-input">档案文件标题：</label>
                <div class="col-md-5">
                    <input type="text" id="title" name="text-input" class="form-control" placeholder="请输入档案文件标题">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label" for="text-input">档案文件类型：</label>
                <div class="col-md-5">
                	<div id="selectType">
                		<button type="button" class="btn btn-default btn-select" id="selectBtn"><span>请选择</span> <i class="fa fa-angle-down"></i></button>
                	</div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label" for="text-input">高拍仪拍照：</label>
                <div class="col-md-5">
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
            <div class="form-group">
                <label class="col-md-3 control-label" for="text-input">附件：（<a href="javascript:;" class="text-primary" onclick="$('#upLoadeFileModal').modal('show');">添加附件</a>）</label>
                <div class="col-md-5" id="fileItems">
                </div>
            </div>
            <div class="summernote" data-plugin-summernote data-plugin-options='{ "height": 230}'></div>
             <div class="form-group">
                <div class="col-md-2 col-md-offset-7">
                <div style="margin-top:10px;">
                	<button type="submit" class="btn btn-primary">保存</button>
            	</div>
                </div>
            </div>
        </form>
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

<div class="modal fade" id="upLoadeFileModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">上传附件</h4>
      </div>
      <div class="modal-body">
		<div class="controls">
			<div class="input-group upLoadFile" id="upLoadFile" style="width:100%;">
				<input type="hidden" class="upFileHideVal"> <input class="form-control showUpFileName" type="text" readonly="" placeholder="选择上传的文件"> <span class="input-group-btn upFileOperation" style="width:210px;">
					<button class="btn btn-default upFileSelectBtn" type="button" id="xzWJ">选择文件</button> <input type="file" class="upFileVal" style="display:none;">
					<button class="btn btn-default upFileUpBtn" type="button" id="scWJ">上传文件</button>
					<span class="btn btn-link upFileLogin" style="display:none;cursor: auto;">
					<img src="assets/img/login.gif"></span> <span class="btn btn-link upFileSuccess" style="display:none;cursor: auto;"><i class="fa fa-check text-success"></i></span> <span class="btn btn-link upFileError" style="display:none;cursor: auto;"><i class="fa fa-times text-danger"></i></span>
				</span>
			</div>
		</div>
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
		<td class="text-right">档案文件标题：</td>
		<td>{{title}}</td>
	</tr>
	<tr>
		<td class="text-right">档案文件类型：</td>
		<td>{{typeStr}}</td>
	</tr>
	<tr>
		<td class="text-right">高拍仪拍照：</td>
		<td>{{img}}</td>
	</tr>
	<tr>
		<td class="text-right">附件：</td>
		<td>{{filePath}}</td>
	</tr>
	<tr>
		<td class="text-right">内容：</td>
		<td>{{{article}}}</td>
	</tr>
</table>
</script>
<script id="fileItemTemplate" type="text/x-handlebars-template">
<div class="form-control-static">
	<div class="row">
		<div class="col-md-7" style="overflow: hidden;">{{fileName}}</div>
		<div class="col-md-5"><a href="javascript:;" class="text-primary" onclick="removeFile(this);"><i class="fa fa-times text-danger"></i>删除</a></div>
	</div>
</div>
</script>
<script type="text/javascript" src="assets/pageJs/docFileManagement/fileMListAdd.js"></script>