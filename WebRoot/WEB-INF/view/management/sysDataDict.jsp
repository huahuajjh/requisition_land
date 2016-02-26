<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<style type="text/css">
	.editLable{
		display:none;
	}
	.saveBtn{
		display:none;
	}
	.tree {
	    min-height:20px;
	    padding:19px;
	    margin-bottom:20px;
	}
	.tree li {
	    list-style-type:none;
	    margin:0;
	    padding:10px 5px 0 5px;
	    position:relative
	}
	.tree li::before, .tree li::after {
	    content:'';
	    left:-20px;
	    position:absolute;
	    right:auto
	}
	.tree li::before {
	    border-left:1px solid #999;
	    bottom:50px;
	    height:100%;
	    top:0;
	    width:1px
	}
	.tree li::after {
	    border-top:1px solid #999;
	    height:20px;
	    top:25px;
	    width:25px
	}
	.tree li > span {
	    -moz-border-radius:5px;
	    -webkit-border-radius:5px;
	    border:1px solid #999;
	    border-radius:5px;
	    display:inline-block;
	    padding:3px 8px;
	    text-decoration:none
	}
	.tree li.parent_li>span {
	    cursor:pointer
	}
	.tree>ul>li::before, .tree>ul>li::after {
	    border:0
	}
	.tree li:last-child::before {
	    height:25px
	}
	.tree li.parent_li>span:hover, .tree li.parent_li>span:hover+ul li span {
	    background:#eee;
	    border:1px solid #94a0b4;
	    color:#000
	}
</style>
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6>
			<i class="glyphicon glyphicon-asterisk"></i>数据字典
		</h6>
	</div>
	<div class="panel-body">
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th class="active">字段名称</th>
					<th class="active">字段值</th>
					<th class="active">操作</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<div class="form-control-static">户口性质</div>
					</td>
					<td>
						<select class="form-control" id="householdType">
						</select>
					</td>
					<td class="two wide">
						<button class="btn btn-bg btn-primary" onclick="showHuKouType();">管理</button>
					</td>
				</tr>
				<tr>
					<td><div class="form-control-static">社保类型</div></td>
					<td>
						<select class="form-control" id="sheBaoType">
						</select>
					</td>
					<td>
						<button class="btn btn-bg btn-primary" onclick="showSheBaoType()">管理</button>
					</td>
				</tr>
				<tr>
					<td><div class="form-control-static">与户主关系</div></td>
					<td>
						<select class="form-control" id="huZhuType">
						</select>
					</td>
					<td>
						<button class="btn btn-bg btn-primary" onclick="showHuZhuType();">管理</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<div class="panel-heading">
			<div class="row">
				<div class="col-xs-12 text-left bk-vcenter">
					<h6 class="bk-margin-off">管理政策法规类型</h6>
				</div>
			</div>
		</div>
	</div>
	<button type="button" class="btn btn-default" style="margin-top: 30px;margin-left: 70px;" onclick="addPolicyType();">
		<i class="fa fa-plus"></i> 新增政策法规类型
	</button>
	<hr>
	<div class="tree" id="policyType">
	    <ul></ul>
	</div>
</div>

<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<div class="panel-heading">
			<div class="row">
				<div class="col-xs-12 text-left bk-vcenter">
					<h6 class="bk-margin-off">管理地址</h6>
				</div>
			</div>
		</div>
	</div>
	<button type="button" class="btn btn-default" style="margin-top: 30px;margin-left: 70px;" onclick="addAddress();">
		<i class="fa fa-plus"></i> 新增地址
	</button>
	<hr>
	<div class="tree" id="addressArea">
	    <ul></ul>
	</div>
</div>

<div class="modal fade" id="dictModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title bk-fg-primary" id="dictModalTitle"></h4>
			</div>
			<div class="modal-body" id="dictBody">
				<blockquote class="bk-margin-off-bottom" style="margin-bottom: 20px !important;">
					<div class="form-group" style="position: relative;height: 90px;">
						<label>名称</label>
						<input type="text" id="addDictName" class="form-control" placeholder="请输入名称" maxlength="10">
						<button type="submit" id="addDictNameBtn" class="btn btn-primary" style="position: absolute;right: 10px;bottom: -10px;">保存</button>
					</div>
				</blockquote>
				<table class="table table-hover table-bordered" id="addDeprt">
					<thead>
						<tr>
							<th class="active" id="dictColName"></th>
							<th class="active">操作</th>
						</tr>
					</thead>
					<tbody id="dictDataArea">
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-bg btn-default" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>
<form class="modal fade form-horizontal" id="addAddressModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">新增地址</h4>
      </div>
      <div class="modal-body">
      	<input type="hidden" name="pid" />
        <div class="form-group">
			<label class="col-md-3 control-label" for="text-input">地址名称<span class="text-danger">*</span></label>
			<div class="col-md-9">
				<input type="text" name="name" class="form-control" placeholder="请输入地址名称" />
			</div>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn btn-primary">保存</button>
      </div>
    </div>
  </div>
</form>
<form class="modal fade form-horizontal" id="addPolicyTypeModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">新增政策法规类型</h4>
      </div>
      <div class="modal-body">
      	<input type="hidden" name="pid" />
        <div class="form-group">
			<label class="col-md-3 control-label" for="text-input">政策法规名称<span class="text-danger">*</span></label>
			<div class="col-md-9">
				<input type="text" name="name" class="form-control" placeholder="请输入政策法规名称" />
			</div>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn btn-primary">保存</button>
      </div>
    </div>
  </div>
</form>
<form class="modal fade form-horizontal" id="editAddressModal" onsubmit="return false;">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">编辑地址</h4>
      </div>
      <div class="modal-body" id="editAddressArea">

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn btn-primary">保存</button>
      </div>
    </div>
  </div>
</form>
<form class="modal fade form-horizontal" id="editPolicyTypeModal" onsubmit="return false;">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">编辑政策法规类型</h4>
      </div>
      <div class="modal-body" id="editPolicyTypeArea">

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn btn-primary">保存</button>
      </div>
    </div>
  </div>
</form>
<script id="addressItemTemplate" type="text/x-handlebars-template">
<li>
    <span>
    	<i class="fa"></i> <span>{{name}}</span>
    </span>
    &nbsp;&nbsp;
	<a href="javascript:;" class="text-primary" onclick="addAddress(this);" ><i class="fa fa-plus"></i> 新增地址</a>
	&nbsp;&nbsp;
	<a href="javascript:;" class="text-success" onclick="editAddress(this);"><i class="fa fa-edit"></i> 编辑</a>
	&nbsp;&nbsp;
	<a href="javascript:;" onclick="deleteAddress(this);"><i class="fa fa-times"></i> 删除</a>
</li>
</script>
<script id="policyTypeItemTemplate" type="text/x-handlebars-template">
<li>
    <span>
    	<i class="fa"></i> <span>{{title}}</span>
    </span>
    &nbsp;&nbsp;
	<a href="javascript:;" class="text-primary" onclick="addPolicyType(this);" ><i class="fa fa-plus"></i> 新增地址</a>
	&nbsp;&nbsp;
	<a href="javascript:;" class="text-success" onclick="editPolicyType(this);"><i class="fa fa-edit"></i> 编辑</a>
	&nbsp;&nbsp;
	<a href="javascript:;" onclick="deletePolicyType(this);"><i class="fa fa-times"></i> 删除</a>
</li>
</script>
<script id="editAddressTemplate" type="text/x-handlebars-template">
<input type="hidden" name="id" value="{{id}}" />
<input type="hidden" name="pid" value="{{pid}}" />
<div class="form-group">
	<label class="col-md-3 control-label" for="text-input">地址名称<span class="text-danger">*</span></label>
	<div class="col-md-9">
		<input type="text" name="name" class="form-control" placeholder="请输入地址名称" value="{{name}}" />
	</div>
</div>
</script>
<script id="editPolicyTypeTemplate" type="text/x-handlebars-template">
<input type="hidden" name="id" value="{{id}}" />
<input type="hidden" name="pid" value="{{pid}}" />
<div class="form-group">
	<label class="col-md-3 control-label" for="text-input">地址名称<span class="text-danger">*</span></label>
	<div class="col-md-9">
		<input type="text" name="name" class="form-control" placeholder="请输入地址名称" value="{{title}}" />
	</div>
</div>
</script>
<script id="dictItemTemplate" type="text/x-handlebars-template">
<tr>
	<td>
		<input class="form-control input-sm dataVal" value="{{name}}" placeholder="请输入名称" name="name" maxlength="20" type="text" disabled>
	</td>
	<td>
		<button type="button" class="btn btn-sm btn-success saveBtn" onclick="saveDictData(this)" style="display:none;">
			<i class="fa fa-edit"></i>提交
		</button>
		<button type="button" class="btn btn-sm btn-primary editBtn" onclick="editDictData(this)">
			<i class="fa fa-edit"></i>编辑
		</button>&nbsp;
		<button type="button" class="btn btn-sm btn-warning" onclick="cancleDictData(this)">
			<i class="fa fa-eraser"></i>取消编辑
		</button>&nbsp;
		<button type="button" class="btn btn-sm btn-danger" onclick="deleteDictData(this)">
			<i class="glyphicon glyphicon-trash"></i>删除
		</button>
	</td>
</tr>
</script>
<script type="text/javascript" src="assets/pageJs/management/sysDataDict.js"></script>