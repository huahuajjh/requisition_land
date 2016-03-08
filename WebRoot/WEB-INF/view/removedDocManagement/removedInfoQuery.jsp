<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6>查询已迁户人员</h6>
		<div class="panel-actions">
			<a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
		</div>
	</div>
	<div class="panel-body">
		<form action="" method="post">
			<div class="row">
				<div class="col-md-3">
					<div class="form-group downImput">
						<label>身份证</label>
						<input id="idNumber" type="text" class="form-control" placeholder="输入身份证进行搜索" autocomplete="OFF" />
						<ul class="dropdown-menu" id="idNumberQueryPrDown">
						</ul>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group downImput">
						<label>姓名</label>
						<input id="name" type="text" class="form-control" placeholder="输入身份证进行搜索" autocomplete="OFF" />
						<ul class="dropdown-menu" id="nameQueryPrDown">
						</ul>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label>镇(街道)</label>
						<select id="street" class="form-control" size="1">
							<option value="">所有街道</option>
							<s:iterator id="dto" value="addressDtos">
								<option value="<s:property value='#dto.getId()' />"><s:property value='#dto.getName()' /></option>
							</s:iterator>
						</select>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label>村（社区）</label>
						<select id="community" class="form-control" size="1">
							<option value="">所有社区</option>
						</select>
					</div>
				</div>
				<div class="col-md-2" style="display:none;">
					<div class="form-group">
						<label>组</label>
						<select id="zu" class="form-control" size="1">
							<option value="">所有组</option>
						</select>
					</div>
				</div>
				<div class="col-md-12 text-right">
				<hr>
					<div class="btn-group">
						<button type="button" class="btn btn-bg btn-success" onclick="$('#selectExportModal').modal('show');">导出已拆迁户台账</button>
						<input type="button" class="btn btn-primary pull-left" value="查询" onclick="tableData.goPage(1); ">
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<div class="row">
			<div class="col-xs-5 text-left bk-vcenter">
				<h6>已迁户台账</h6>
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
						<th>姓名</th>
						<th>适用政策</th>
						<th>出生日期</th>
						<th>身份证号</th>
						<th>地址</th>
						<th>拆迁日期</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="dataTbody">
				</tbody>
				<tfoot>
					<tr>
						<td colspan="7">
							<div class="bk-margin-5 btn-group pull-right" id="pageArea"></div>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</div>

<form class="modal fade form-horizontal" id="editInfoModal" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title bk-fg-primary">修改已迁人员信息</h4>
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

<div class="modal fade" id="selectExportModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">导出需要的数据</h4>
      </div>
      <div class="modal-body">
			<iframe src="exportHTML/removedInfo.html" style="border: 0;width: 100%;height: 170px;" scrolling="no"></iframe>
      </div>
    </div>
  </div>
</div>
<script id="idNumberQueryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{idNumber}}-{{name}}</a></li>
</script>
<script id="nameQueryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{idNumber}}-{{name}}</a></li>
</script>
<script id="entrytemplate" type="text/x-handlebars-template">
<tr>
	<td>{{name}}</td>
	<td>{{suitPolicy}}</td>
	<td>{{birthday}}</td>
	<td>{{idNumber}}</td>
	<td>{{address}}</td>
	<td>{{removeDate}}</td>
	<td>
		<a class="label label-info" onclick="editInfo(this);">编辑</a>
		<a class="label label-default" onclick="deleteInfo(this);">删除</a>
	</td>
</tr>
</script>
<script id="editModalTemplate" type="text/x-handlebars-template">
<div class="form-group">
	<label class="col-md-3 control-label">迁户人姓名<span class="text-danger">*</span></label>
	<div class="col-md-5">
		<input type="text" name="name" value="{{name}}" maxlength="5" class="form-control" placeholder="请输入迁户人姓名">
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label">迁户人身份证<span class="text-danger">*</span></label>
	<div class="col-md-5">
		<input type="text" name="idNumber" value="{{idNumber}}" maxlength="20" class="form-control" placeholder="请输入迁户人身份证">
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label">出生日期<span class="text-danger">*</span></label>
	<div class="col-md-5">
		<input type="text" name="birthday" value="{{birthday}}" class="form-control" placeholder="____/__/__" data-plugin-datepicker="" data-plugin-datepicker-nottoday="" data-plugin-masked-input="" data-input-mask="9999/99/99">
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label">拆迁日期<span class="text-danger">*</span></label>
	<div class="col-md-5">
		<input type="text" name="removeDate" value="{{removeDate}}" class="form-control" placeholder="____/__/__" data-plugin-datepicker="" data-plugin-datepicker-nottoday="" data-plugin-masked-input="" data-input-mask="9999/99/99">
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label">迁户人地址<span class="text-danger">*</span></label>
	<div class="col-md-8">
		<div class="input-daterange input-group">
			<span class="input-group-addon">镇(街道)</span>
			<select name="streetId" class="form-control" size="1">
				<option value="">请选择街道</option>
				<s:iterator id="dto" value="addressDtos">
					<option value="<s:property value='#dto.getId()' />"><s:property value='#dto.getName()' /></option>
				</s:iterator>
			</select>
			<span class="input-group-addon">村（社区）</span>
			<select name="communityId" class="form-control" size="1">
				<option value="">请选择社区</option>
			</select>
			<span class="input-group-addon" style="display:none;">组</span>
			<select name="groupId" class="form-control" size="1" style="display:none;">
				<option value="">请选择组</option>
			</select>
		</div>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label">地址其他信息</label>
	<div class="col-md-5">
		<input type="text" name="other" value="{{other}}" maxlength="15" class="form-control" placeholder="请输入地址其他信息">
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label">适用政策</label>
	<div class="col-md-5">
		<input type="text" name="suitPolicy" value="{{suitPolicy}}" maxlength="15" class="form-control" placeholder="请输入适用政策">
	</div>
</div>
</script>
<script type="text/javascript" src="assets/pageJs/removedDocManagement/removedInfoDaoChu.js"></script>
<script type="text/javascript" src="assets/pageJs/removedDocManagement/removedInfoQuery.js"></script>