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
		<h6>查询在籍农业人口数据</h6>
		<div class="panel-actions">
			<a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
		</div>
	</div>
	<div class="panel-body">
		<form action="" method="post">
			<div class="row">
				<div class="col-md-3">
					<div class="form-group">
						<label>身份证</label>
						<input id="queryIdNumber" type="text" class="form-control" placeholder="输入身份证进行搜索" />
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label>姓名</label>
						<input id="queryName" type="text" class="form-control" placeholder="输入身份证进行搜索" />
					</div>
				</div>
				<div class="col-md-2">
					<div class="form-group">
						<label>镇(街道)</label>
						<select id="queryStreet" class="form-control" size="1">
							<option value="">所有街道</option>
							<s:iterator id="dto" value="addressDtos">
								<option value="<s:property value='#dto.getId()' />"><s:property value='#dto.getName()' /></option>
							</s:iterator>
						</select>
					</div>
				</div>
				<div class="col-md-2">
					<div class="form-group">
						<label>村（社区）</label>
						<select id="queryCommunity" class="form-control" size="1">
							<option value="">所有社区</option>
						</select>
					</div>
				</div>
				<div class="col-md-2">
					<div class="form-group">
						<label>组</label>
						<select id="queryZu" class="form-control" size="1">
							<option value="">所有组</option>
						</select>
					</div>
				</div>
				<div class="col-md-12 text-right">
					<hr>
					<div class="btn-group">
						<button class="btn btn-bg btn-success">导出在籍农业人口台账</button>
						<input type="button" class="btn btn-primary pull-left" value="查询">
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
				<h6>在籍农业人口台账</h6>
			</div>
			<div class="col-xs-7 bk-vcenter text-right">
				每页显示<select class="select_top" id="dataPageCount">
					<option value="10">10</option>
					<option value="20">20</option>
					<option selected value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
				</select>条数据,总共有<span id="countArea">0</span>个在籍农业人口。
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
						<th>身份证</th>
						<th>适用政策</th>
						<th>地址</th>
						<th>是否<br>拆迁</th>
						<th>是否<br>安置</th>
						<th>是否<br>转户</th>
						<th>是否<br>纳入社保</th>
						<th>人员状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="dataTbody">
				</tbody>
				<tfoot>
					<tr>
						<td colspan="11">
							<div class="bk-margin-5 btn-group pull-right" id="pageArea">
								<button type="button" class="btn btn-primary btn-sm">1</button>
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</div>

<form class="modal fade form-horizontal" id="editInfoModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title bk-fg-primary">修改在籍农业人员</h4>
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

<script id="entrytemplate" type="text/x-handlebars-template">
<tr>
	<td>{{name}}</td>
	<td>{{idNumber}}</td>
	<td>{{policyStr}}</td>
	<td>{{address}}</td>
	<td>
		{{#if isRemove}}
			<i class="fa fa-check text-success"></i>
		{{else}}
			<i class="fa fa-times text-danger"></i>
		{{/if}}
	</td>
	<td>
		{{#if isSetting}}
			<i class="fa fa-check text-success"></i>
		{{else}}
			<i class="fa fa-times text-danger"></i>
		{{/if}}
	</td>
	<td>
		{{#if isTransfer}}
			<i class="fa fa-check text-success"></i>
		{{else}}
			<i class="fa fa-times text-danger"></i>
		{{/if}}
	</td>
	<td>
		{{#if isSocialSecurity}}
			<i class="fa fa-check text-success"></i>
		{{else}}
			<i class="fa fa-times text-danger"></i>
		{{/if}}
	</td>
	<td>{{userStateStr}}</td>
	<td>
		<a class="label label-info" onclick="editInfo(this);">编辑</a>
		<a class="label label-default" onclick="deleteInfo(this);">删除</a>
	</td>
</tr>
</script>
<script id="editModalTemplate" type="text/x-handlebars-template">
<div class="form-group">
	<label class="col-md-3 control-label">姓名<span class="text-danger">*</span></label>
	<div class="col-md-9">
		<input type="text" class="form-control" value="{{name}}" name="name" placeholder="请输入姓名"  maxlength="5" />
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label">身份证<span class="text-danger">*</span></label>
	<div class="col-md-9">
		<input type="text" class="form-control" value="{{idNumber}}" name="idNumber" placeholder="请输入身份证" maxlength="20" />
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label">适用政策<span class="text-danger">*</span></label>
	<div class="col-md-9">
		<input type="text" class="form-control" value="{{policyStr}}" name="policy" placeholder="请输入适用政策" maxlength="10" />
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label">是否拆迁<span class="text-danger">*</span></label>
	<div class="col-md-9">
		<div class="radio-custom radio-inline">
			<input type="radio" name="isDemolition" value="true" {{#if isRemove}}checked{{/if}}>
			<label> 是</label>
		</div>
		<div class="radio-custom radio-inline">
			<input type="radio" name="isDemolition" value="false"{{#if isRemove}}{{else}}checked{{/if}}>
			<label>否</label>
		</div>
		<div>
			<label id="isDemolition-error" class="error" for="isDemolition"></label>
		</div>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label">是否安置<span class="text-danger">*</span></label>
	<div class="col-md-9">
		<div class="radio-custom radio-inline">
			<input type="radio" name="isSetting" value="true"{{#if isSetting}}checked{{/if}}>
			<label> 是</label>
		</div>
		<div class="radio-custom radio-inline">
			<input type="radio" name="isSetting" value="false"{{#if isSetting}}{{else}}checked{{/if}}>
			<label> 否</label>
		</div>
		<div>
			<label id="isSetting-error" class="error" for="isSetting"></label>
		</div>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" >是否转户<span class="text-danger">*</span></label>
	<div class="col-md-9">
		<div class="radio-custom radio-inline">
			<input type="radio" name="isZhuanHu" value="true"{{#if isTransfer}}checked{{/if}}>
			<label> 是</label>
		</div>
		<div class="radio-custom radio-inline">
			<input type="radio" name="isZhuanHu" value="false" {{#if isTransfer}}{{else}}checked{{/if}}>
			<label> 否</label>
		</div>
		<div>
			<label id="isZhuanHu-error" class="error" for="isZhuanHu"></label>
		</div>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label">是否纳入社保<span class="text-danger">*</span></label>
	<div class="col-md-9">
		<div class="radio-custom radio-inline">
			<input type="radio" name="isSheBao" value="true" {{#if isSocialSecurity}}checked{{/if}}>
			<label> 是</label>
		</div>
		<div class="radio-custom radio-inline">
			<input type="radio"  name="isSheBao" value="false" {{#if isSocialSecurity}}{{else}}checked{{/if}}>
			<label> 否</label>
		</div>
		<div>
			<label id="isSheBao-error" class="error" for="isSheBao"></label>
		</div>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label">人员状态<span class="text-danger">*</span></label>
	<div class="col-md-9">
		<input type="text" class="form-control" name="personState" value="{{userStateStr}}" placeholder="请输入人员状态" maxlength="10">
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="email-input">迁户人地址<span class="text-danger">*</span></label>
	<div class="col-md-9">
		<div id="selectType">
        	<button type="button" class="btn btn-default btn-select" id="selectBtn"><span>请选择</span> <i class="fa fa-angle-down"></i></button>
        </div>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" >地址其他信息</label>
	<div class="col-md-9">
		<input type="text" name="addressOther" maxlength="30" class="form-control" placeholder="请输入地址其他信息">
	</div>
</div>
</script>
<script type="text/javascript" src="assets/pageJs/registedInfoManagement/queryRegistedInfo.js"></script>