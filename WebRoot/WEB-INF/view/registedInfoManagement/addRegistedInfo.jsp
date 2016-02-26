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
		<div class="row">
			<div class="col-xs-12 text-left bk-vcenter">
				<h6 class="bk-margin-off">导入在籍农业人口信息</h6>
			</div>
		</div>
	</div>
	<div class="panel-body">
		<div class="input-group" style="width:100%;">
			<input type="file" class="form-control">
			<div class="input-group-btn" style=" width: 260px;">
				<button type="button" class="btn btn-default btn-success">
					<i class="fa fa-upload"></i> 上传
				</button>
				<button type="button" class="btn btn-default btn-info">
					<i class="fa fa-download"></i> 下载模板
				</button>
				<button type="button" class="btn btn-default btn-link bk-fg-success"
					data-toggle="tooltip" title="上传成功">
					<i class="fa fa-check"></i> 0
				</button>
				<button type="button" class="btn btn-default btn-link bk-fg-danger"
					data-toggle="tooltip" title="上传失败"
					onclick="$('#myModal').modal('show');">
					<i class="fa fa-times"></i> 0
				</button>
			</div>
		</div>
	</div>
</div>

<form class="panel form-horizontal" id="addRegistedInfo" onsubmit="return false;">
	<div class="panel-heading bk-bg-primary">
		<h6>手工添加在籍农业人口信息</h6>
	</div>
	<div class="panel-body">
		<div class="form-group">
			<label class="col-md-3 control-label">姓名<span class="text-danger">*</span></label>
			<div class="col-md-5">
				<input type="text" class="form-control" name="name" placeholder="请输入姓名"  maxlength="5" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">身份证<span class="text-danger">*</span></label>
			<div class="col-md-5">
				<input type="text" class="form-control" name="idNumber" placeholder="请输入身份证" maxlength="20" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">适用政策<span class="text-danger">*</span></label>
			<div class="col-md-5">
				<input type="text" class="form-control" name="policyStr" placeholder="请输入适用政策" maxlength="10" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">是否拆迁<span class="text-danger">*</span></label>
			<div class="col-md-5">
				<div class="radio-custom radio-inline">
					<input type="radio" name="isRemove" value="true">
					<label> 是</label>
				</div>
				<div class="radio-custom radio-inline">
					<input type="radio" name="isRemove" value="false">
					<label>否</label>
				</div>
				<div>
					<label id="isRemove-error" class="error" for="isRemove"></label>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">是否安置<span class="text-danger">*</span></label>
			<div class="col-md-5">
				<div class="radio-custom radio-inline">
					<input type="radio" name="isSetting" value="true">
					<label> 是</label>
				</div>
				<div class="radio-custom radio-inline">
					<input type="radio" name="isSetting" value="false">
					<label> 否</label>
				</div>
				<div>
					<label id="isSetting-error" class="error" for="isSetting"></label>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label" >是否转户<span class="text-danger">*</span></label>
			<div class="col-md-5">
				<div class="radio-custom radio-inline">
					<input type="radio" name="isTransfer" value="true">
					<label> 是</label>
				</div>
				<div class="radio-custom radio-inline">
					<input type="radio" name="isTransfer" value="false">
					<label> 否</label>
				</div>
				<div>
					<label id="isTransfer-error" class="error" for="isTransfer"></label>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">是否纳入社保<span class="text-danger">*</span></label>
			<div class="col-md-5">
				<div class="radio-custom radio-inline">
					<input type="radio" name="isSocialSecurity" value="true">
					<label> 是</label>
				</div>
				<div class="radio-custom radio-inline">
					<input type="radio"  name="isSocialSecurity" value="false">
					<label> 否</label>
				</div>
				<div>
					<label id="isSocialSecurity-error" class="error" for="isSocialSecurity"></label>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">人员状态<span class="text-danger">*</span></label>
			<div class="col-md-5">
				<input type="text" class="form-control" name="userStateStr" placeholder="请输入人员状态" maxlength="10">
			</div>
		</div>
	    <div class="form-group">
	    	<label class="col-md-3 control-label">迁户人地址<span class="text-danger">*</span></label>
	    	<div class="col-md-8">
	    		<div class="input-daterange input-group">
					<span class="input-group-addon">镇(街道)</span>
					<select id="street" name="street" class="form-control" size="1">
						<option value="">请选择街道</option>
						<s:iterator id="dto" value="addressDtos">
							<option value="<s:property value='#dto.getId()' />"><s:property value='#dto.getName()' /></option>
						</s:iterator>
					</select>
					<span class="input-group-addon">村（社区）</span>
					<select id="community" name="community" class="form-control" size="1">
						<option value="">请选择社区</option>
					</select>
					<span class="input-group-addon">组</span>
					<select id="zu" name="zu" class="form-control" size="1">
						<option value="">请选择组</option>
					</select>
				</div>
	    	</div>
	    </div>
	    <div class="form-group">
	    	<label class="col-md-3 control-label" >地址其他信息</label>
	    	<div class="col-md-5">
	    		<input type="text" name="addressOther" maxlength="20" class="form-control" placeholder="请输入地址其他信息">
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
<div class="modal fade" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title bk-fg-primary">上传数据错误列表</h4>
			</div>
			<div class="modal-body">
				<ul class="bulletList">
					<li class="red"><span class="title">错误行数：在文件的140行</span> <span
						class="description truncate">错误描述：姓名不可以空</span></li>
					<li class="red"><span class="title">错误行数：在文件的140行</span> <span
						class="description truncate">错误描述：姓名不可以空</span></li>
					<li class="red"><span class="title">错误行数：在文件的140行</span> <span
						class="description truncate">错误描述：姓名不可以空</span></li>
					<li class="red"><span class="title">错误行数：在文件的140行</span> <span
						class="description truncate">错误描述：姓名不可以空</span></li>
					<li class="red"><span class="title">错误行数：在文件的140行</span> <span
						class="description truncate">错误描述：姓名不可以空</span></li>
					<li class="red"><span class="title">错误行数：在文件的140行</span> <span
						class="description truncate">错误描述：姓名不可以空</span></li>
					<li class="red"><span class="title">错误行数：在文件的140行</span> <span
						class="description truncate">错误描述：姓名不可以空</span></li>
				</ul>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="assets/pageJs/registedInfoManagement/addRegistedInfo.js"></script>