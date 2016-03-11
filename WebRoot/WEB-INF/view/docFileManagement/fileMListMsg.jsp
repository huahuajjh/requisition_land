<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<style type="text/css">
.btn-select{
	width: 100%;
	text-align: left;
}
.btn-select > i{
	float: right;
}
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
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6>
			<i class="fa fa-signal red"></i>查询档案文件
		</h6>
		<div class="panel-actions">
			<a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
		</div>
	</div>
	<div class="panel-body">
		<form action="" method="post">
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label for="nf-email">档案文件标题</label>
						<input type="text" id="queryTitle" class="form-control" placeholder="请输入要查询的档案文件标题" />
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label>档案文件类型</label>
						<div id="querySelectType">
                			<button type="button" class="btn btn-default btn-select" id="querySelectBtn"><span>请选择</span> <i class="fa fa-angle-down"></i></button>
                		</div>
					</div>
				</div>
				<div class="col-md-12">
					<input type="button" class="btn btn-default pull-right" value="重置" onclick="queryRest();">
					<input type="button" class="btn btn-primary pull-right" value="查询" onclick="tableData.goPage(1); ">
				</div>
			</div>
		</form>
	</div>
</div>

<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<div class="row">
			<div class="col-xs-5 text-left bk-vcenter">
				<h6>
					<i class="fa fa-table red"></i><span class="break"></span>档案文件
				</h6>
			</div>
			<div class="col-xs-7 bk-vcenter text-right">
				每页显示<select class="select_top" id="dataPageCount">
					<option value="10">10</option>
					<option value="20">20</option>
					<option selected value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
				</select>条数据,总共有<span id="countArea">0</span>个档案。
			</div>
		</div>


	</div>
	<div class="panel-body">
		<div class="table-responsive">
			<table
				class="table table-striped table-bordered bootstrap-datatable datatable">
				<thead>
					<tr>
						<th>档案文件标题</th>
						<th>档案文件创建时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="dataTbody">
				</tbody>
				<tfoot>
					<tr>
						<td colspan="10">
							<div class="bk-margin-5 btn-group pull-right" id="pageArea">
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</div>

<form class="modal fade form-horizontal" id="editInfoModal" data-backdrop="static" onsubmit="return false;">
	<div class="modal-dialog" style="width:900px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">修改档案信息</h4>
			</div>
			<div class="modal-body" id="editInfoArea">
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

<div id="test123"></div>

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
<script id="entrytemplate" type="text/x-handlebars-template">
<tr>
	<td>{{title}}</td>
	<td>{{createDate}}</td>
	<td>
		<a class="label label-info" onclick="editInfo(this);">编辑</a>
		<a class="label label-default" onclick="deleteInfo(this);">删除</a></td>
</tr>
</script>
<script id="editInfoTemplate" type="text/x-handlebars-template">
<div class="form-group">
    <label class="col-md-3 control-label">档案文件标题：</label>
    <div class="col-md-5">
        <input type="text" id="title" class="form-control" placeholder="请输入档案文件标题" value="{{title}}">
    </div>
</div>
<div class="form-group">
    <label class="col-md-3 control-label">档案文件类型：</label>
    <div class="col-md-5">
    	<div id="selectType">
    		<button type="button" class="btn btn-default btn-select" id="selectBtn"><span>{{typeStr}}</span> <i class="fa fa-angle-down"></i></button>
    	</div>
    </div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label">图片凭证</label>
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
    <label class="col-md-3 control-label">附件：（<a href="javascript:;" class="text-primary" onclick="$('#upLoadeFileModal').modal('show');">添加附件</a>）</label>
    <div class="col-md-5" id="fileItems">
    </div>
</div>
<div class="summernote" data-plugin-summernote data-plugin-options='{ "height": 230}'>{{{article}}}</div>
</script>
<script id="fileItemTemplate" type="text/x-handlebars-template">
<div class="form-control-static">
	<div class="row">
		<div class="col-md-7" style="overflow: hidden;">{{fileName}}</div>
		<div class="col-md-5"><a href="javascript:;" class="text-primary" onclick="removeFile(this);"><i class="fa fa-times text-danger"></i>删除</a></div>
	</div>
</div>
</script>
<script type="text/javascript" src="assets/pageJs/docFileManagement/fileMListMsg.js"></script>