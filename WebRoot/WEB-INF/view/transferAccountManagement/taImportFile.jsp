<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="panel" style="display: none;">
	<div class="panel-heading bk-bg-primary">
		<div class="row">
			<div class="col-xs-12">
				<h6 class="bk-margin-off">导入文件</h6>
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
				<button type="button" class="btn btn-default btn-link bk-fg-success" data-toggle="tooltip" title="上传成功">
					<i class="fa fa-check"></i> 0
				</button>
				<button type="button" class="btn btn-default btn-link bk-fg-danger" data-toggle="tooltip" title="上传失败" onclick="$('#myModal').modal('show');">
					<i class="fa fa-times"></i> 0
				</button>
			</div>
		</div>
	</div>
</div>

<form class="panel form-horizontal" id="addZhuanHu">
	<div class="panel-heading bk-bg-primary">
		<h6>录入转户信息</h6>
	</div>
	<div class="panel-body">
		<div class="form-group">
        	<label class="col-md-3 control-label">身份证</label>
         	<div class="col-md-5">
             	<div class="controls">
					<div class="input-group downImput" style="width: 100%;">
						<input id="idNumber" class="form-control"  type="text" placeholder="请输入需要录入人的身份证" maxlength="20" autocomplete="OFF" />
						<span class="input-group-btn" style="width: 100px;">
							<button class="btn btn-default" id="idNumberBtn" type="button"><i class="fa fa-search"></i> 获取</button>
        					<button type="button" class="btn btn-default" onclick="$('#selectPerson').modal('show');">选择人员</button>
						</span>
						<ul class="dropdown-menu" id="idNumberQueryPrDown">
						</ul>
					</div>
				</div>
        	</div>
      	</div>
      	<hr/>
      	<div id="dataArea"></div>
	</div>
</form>
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
<script id="idNumberQueryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{idNumber}}-{{name}}</a></li>
</script>
<script id="entrytemplate" type="text/x-handlebars-template">
<div class="panel panel-default">
	<div class="panel-heading">人员信息</div>
	<table class="table table-bordered">
		<tbody>
			<tr>
				<td class="active">姓名</td>
				<td>{{name}}</td>
				<td class="active">身份证号</td>
				<td>{{idNumber}}</td>
			</tr>
			<tr>
				<td class="active">性别</td>
				<td>{{#dengYu gender "MALE"}}男{{else}}女{{/dengYu}}</td>
				<td class="active">出生日期</td>
				<td>{{birthday}}</td>
			</tr>
			<tr>
				<td class="active">从事农业生产时间</td>
				<td>{{farmingTime}}</td>
				<td class="active">服兵役/劳改/劳教情况及时间起止段</td>
				<td>{{serveArmySituation}}</td>
			</tr>
			<tr>
				<td class="active">联系电话</td>
				<td>{{tel}}</td>
				<td class="active">是否参加过社会保险</td>
				<td>{{#if isSocialsecurity}}<i class="fa fa-check text-success"></i>{{else}}<i class="fa fa-times text-danger"></i>{{/if}}</td>
			</tr>
			<tr>
				<td class="active">原户口类型</td>
				<td>{{householdStr}}</td>
				<td class="active">所属项目</td>
				<td><a href="javascript:;" class="text-primary" onclick="showProInfo('{{proId}}')">{{proName}}</a></td>
			</tr>
		</tbody>
	</table>
</div>
<div class="form-group">
	<label class="col-md-3 control-label">是否转户</label>
	<div class="col-md-9" id="isZhuanHuArea">
		<div class="radio-custom radio-inline">
			<input type="radio"  id="isZhuanHuTrue" name="isZhuanHu"> 
			<label> 是</label>
		</div>
		<div class="radio-custom radio-inline">
			<input type="radio"  id="isZhuanHuFalse" name="isZhuanHu">
			<label> 否</label>
		</div>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label">转户时间<span class="text-danger">*</span></label>
 	<div class="col-md-3" id="timeArea">
     	<input type="text" id="time"  class="form-control" placeholder="____/__/__" disabled data-plugin-datepicker data-plugin-masked-input data-input-mask="9999/99/99">
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label">转户地址<span class="text-danger">*</span></label>
 	<div class="col-md-9"  id="AddressArea">
     	<div class="input-daterange input-group">
         	<span class="input-group-addon">镇(街道)</span>
        	<select class="form-control" size="1" disabled id="street" >
            	<option value="">请选择街道</option>
            	<s:iterator id="dto" value="addressDtos">
					<option value="<s:property value='#dto.getId()' />"><s:property value='#dto.getName()' /></option>
				</s:iterator>
             </select>
             <span class="input-group-addon">村（社区）</span>
             <select class="form-control" size="1" disabled id="community">
                 <option value="">请选择社区</option>
              </select>
              <span class="input-group-addon">组</span>
             <select class="form-control" size="1" disabled id="zu">
                 <option value="">请选择组</option>
              </select>
              <span class="input-group-addon">其他信息</span>
              <input type="text" class="form-control" maxlength="30" style="text-align: left;" id="addressOtherMsg" disabled />
          </div>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" >转户类型<span class="text-danger">*</span></label>
 	<div class="col-md-4" id="newTypeArea">
     	<select class="form-control" size="1" disabled id="newType" name="newType">
         	<option value="">请户口类型</option>
            <s:iterator id="dto" value="householdTypeDtos">
				<option value="<s:property value='#dto.getId()' />"><s:property value='#dto.getName()' /></option>
			</s:iterator>
        </select>
	</div>
</div>
<hr>
<div class="form-group">
	<div class="col-md-5 col-md-offset-4">
		<button type="submit" class="btn btn-primary button-next pull-right" id="subBtn">保存</button>
	</div>
</div>
</script>
<script type="text/javascript" src="assets/pageJs/transferAccountManagement/taImportFile.js"></script>