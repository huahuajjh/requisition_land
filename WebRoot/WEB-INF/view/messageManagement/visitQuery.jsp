<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6>查询上访人员数据</h6>
		<div class="panel-actions">
			<a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
		</div>
	</div>
	<div class="panel-body">
		<div class="row">
			<div class="col-md-4">
				<div class="form-group">
					<label>手机号码</label>
					<input type="text" id="queryPhone" class="form-control" placeholder="请输入需要搜索的手机号码" maxlength="15" />
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group">
					<label>上访人姓名</label>
					<input type="text" id="queryName" class="form-control" placeholder="请输入上访人姓名" maxlength="5" />
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group downImput">
					<label>项目</label>
					<div class="input-group" style="width: 100%;">
						<input type="text" id="queryPrName" maxlength="20" class="form-control" placeholder="请输入要查询的项目名称" autocomplete="OFF">
						<span class="input-group-btn" style="width:81px;"><button class="btn btn-default" type="button" onclick="$('#selectProInfoModal').modal('show');">选择项目</button></span>
					 </div>
					<ul class="dropdown-menu" id="queryPrDown" style="display: none;">
					</ul>
				</div>
			</div>
			<div class="col-md-12 text-right">
				<hr>
				<div class="btn-group">
					<button type="button" class="btn btn-primary pull-right" onclick="tableData.goPage(1); ">查询</button>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<div class="row">
			<div class="col-xs-5 text-left bk-vcenter">
				<h6>上访台账</h6>
			</div>
			<div class="col-xs-7 bk-vcenter text-right">
				每页显示<select class="select_top" id="dataPageCount">
					<option value="10">10</option>
					<option value="20">20</option>
					<option selected value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
				</select>条数据,总共有<span id="countArea">0</span>个迁户人员。
			</div>
		</div>
	</div>
	<div class="panel-body">
		<div class="table-responsive">
			<table
				class="table table-striped table-bordered bootstrap-datatable datatable">
				<thead>
					<tr>
						<th>上访者姓名</th>
						<th>上访者电话</th>
						<th>上访项目</th>
						<th>上访时间</th>
						<th>上访人住址</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="dataTbody">
				</tbody>
				<tfoot>
					<tr>
						<td colspan="7">
							<div class="bk-margin-5 btn-group pull-right" id="pageArea">
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</div>

<form class="modal fade" id="editInfoModal" data-backdrop="static" onsubmit="return false;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title bk-fg-primary">修改上访信息</h4>
			</div>
			<div class="modal-body" id="infoDataBody">
				
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="submit" class="btn btn-primary">保存</button>
			</div>
		</div>
	</div>
</form>

<div class="modal fade" id="infoModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">查看上访人员信息</h4>
      </div>
      <div class="modal-body" id="infoBody">
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

<div class="modal fade" id="selectProInfoModal">
  <div class="modal-dialog">
    <div class="modal-content">
    </div>
  </div>
</div>

<script id="entrytemplate" type="text/x-handlebars-template">
<tr>
	<td><a href="javascript:;" class="bk-fg-primary" onclick="showInfo(this);">{{visitorName}}</a></td>
	<td>{{visitorTel}}</td>
	<td>{{proName}}</td>
	<td>{{visitTime}}</td>
	<td>{{visitorAddr}}</td>
	<td>
		<a class="label label-dark" onclick="showInfo(this);">查看</a>
		<a class="label label-info" onclick="editInfo(this);">编辑</a>
	</td>
</tr>
</script>
<script id="infoModalTemplate" type="text/x-handlebars-template">
<div class="row">
	<div class="col-md-6">
		<div class="form-group">
			<label>上访者姓名</label>
			<div class="form-control">{{visitorName}}</div>
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label>上访者电话</label>
			<div class="form-control">{{visitorTel}}</div>
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label>上访者的住址</label>
			<div class="form-control">{{visitorAddr}}</div>
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label>上访项目</label>
			<div class="form-control">{{proName}}</div>
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label>上访时间</label>
			<div class="form-control">{{visitTime}}</div>
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label>上访凭证</label>
			<div class="form-control">
				<a href="javascript:;" class="text-primary" {{#if img}}onclick="$.initShowImage(['{{img}}']);"{{/if}}>点击查看</a>
			</div>
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label>相关资料</label>
			<div class="form-control" >
				<a target="_blank" {{#if fileValue}}href="{{fileValue}}"{{/if}} class="text-primary">{{fileName}}</a>
			</div>
		</div>
	</div>
	<div class="col-md-12">
		<div class="form-group">
			<label>上访者的其他信息</label>
			<div class="form-control" style="height: inherit;">{{otherMsg}}</div>
		</div>
	</div>
	<div class="col-md-12">
		<div class="form-group">
			<label>处理意见</label>
			<div class="form-control" style="height: inherit;">{{visitReason}}</div>
		</div>
	</div>
</div>
</script>
<script id="editModalTemplate" type="text/x-handlebars-template">
<div class="col-md-6">
	<div class="form-group">
		<label>上访项目</label>
		<div class="form-control-static">{{proName}}</div>
	</div>
</div>
<div class="col-md-6">
	<div class="form-group">
		<label>上访时间</label>
		<div class="form-control-static">{{visitTime}}</div>
	</div>
</div>
<div class="col-md-6">
	<div class="form-group">
		<label>上访者姓名<span class="text-danger">*</span></label>
		<input type="text" name="name" value="{{visitorName}}" class="form-control" placeholder="请输入上访者姓名" maxlength="5">
	</div>
</div>
<div class="col-md-6">
	<div class="form-group">
		<label>上访者电话<span class="text-danger">*</span></label>
		<input type="text" name="phone" value="{{visitorTel}}" class="form-control" placeholder="请输入上访者电话" maxlength="15">
	</div>
</div>
<div class="col-md-6">
	<div class="form-group">
		<label>上访者的住址<span class="text-danger">*</span></label>
		<input type="text" name="address" value="{{visitorAddr}}" class="form-control" placeholder="请输入上访者的住址" maxlength="20">
	</div>
</div>
<div class="col-md-6">
	<div class="form-group" style="height: 72px;">
		<label>上访凭证</label>
		<div class="form-control-static"">
			<input type="file" id="upFile" style="display:none;" accept="image/*" />
			<a class="label label-primary" id="upBtn" onclick="upFileZhaoPian();">上传</a>
			<a class="label label-primary" id="zhaoBtn" onclick="paiZhao();">拍照</a>
			<a class="label label-success" id="yuLanBtn" {{#if img}}{{else}}style="display: none"{{/if}}>预览</a>
			<span class="label">
				<i class="fa fa-check text-success" id="paiZhaoFileCheckState" style="display: none"></i>
				<img src="assets/img/login.gif" id="paiZhaoFileLoginState" style="display: none">
			</span>
		</div>
	</div>
</div>
<div class="form-group">
	<label>上访者的其他信息</label>
	<textarea class="form-control" name="otherMsg" rows="3" maxlength="140" placeholder="请输入上访者的其他信息">{{otherMsg}}</textarea>
</div>
<div class="form-group">
	<label>相关资料</label>
	<div class="controls">
		<div class="input-group upLoadFile" id="upLoadFile" style="width:100%;">
			<input type="hidden" class="upFileHideVal" name="fileVal" value="{{visitMaterialPath}}">
			<input class="form-control showUpFileName" type="text" disabled="" placeholder="请上传相关资料" value="{{visitMaterialPathName}}">
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
<div class="form-group">
	<label>处理意见</label>
	<textarea class="form-control" name="reasonMsg" placeholder="请输入处理意见" rows="5" maxlength="140">{{visitReason}}</textarea>
</div>
</script>
<script id="queryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{proName}}</a></li>
</script>
<script type="text/javascript" src="assets/pageJs/messageManagement/visitQuery.js"></script>