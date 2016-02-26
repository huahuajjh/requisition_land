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
		<h6>
			<i class="fa fa-indent red"></i>添加人员
		</h6>
	</div>
	<div class="panel-body">
		<form action="" method="post" enctype="multipart/form-data"
			id="personForm" class="form-horizontal" onsubmit="return false;">
			<div class="form-group">
				<label class="col-md-4 control-label" for="text-input">账号<span
					class="text-danger">*</span></label>
				<div class="col-md-5">
					<input type="text" class="form-control" placeholder="请输入账号"
						name="account" maxlength="15" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" for="text-input">姓名<span
					class="text-danger">*</span></label>
				<div class="col-md-5">
					<input type="text" class="form-control" placeholder="请输入姓名"
						name="name" maxlength="5" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" for="email-input">所属单位<span
					class="text-danger">*</span></label>
				<div class="col-md-5">
					<select class="form-control" name="orgId" id="organization">
						<option value="">请选择单位</option>
						<s:iterator id="dto" value="orgDtoList">
							<option value="<s:property value='#dto.getId()' />">
								<s:property value='#dto.getName()' />
							</option>
						</s:iterator>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" for="email-input">所属部门</label>
				<div class="col-md-5">
					<select class="form-control" name="deptId" id="department">
						<option value="">请选择部门</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" for="text-input">角色<span
					class="text-danger">*</span></label>
				<div class="col-md-5">
					<select class="form-control" id="role" name="roleId">
						<option value="">请选择角色</option>
						<s:iterator id="dto" value="roleDtoList">
							<option value="<s:property value='#dto.getId()' />">
								<s:property value='#dto.getName()' />
							</option>
						</s:iterator>
					</select>
				</div>
			</div>
			<hr> 
			<div class="form-group">
				<div class="col-md-9">
					<button type="submit" class="btn btn-primary pull-right" >保存</button>
			<div class="pull-right" style="margin-top:10px;margin-right: 10px;">所有注册账号默认密码是1234567，注册完成后请提醒持有人修改密码</div>
				</div>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript" src="assets/pageJs/management/sysCreateAccount.js"></script>