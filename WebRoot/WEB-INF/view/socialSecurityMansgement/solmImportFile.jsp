<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
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
<!--导入社保信息-->
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6>导入社保信息</h6>
	</div>
	<div class="panel-body">
		<div class="input-group" style="width:100%;">
			<div class="form-control" id="fileName"></div>
			<div class="input-group-btn" style=" width: 300px;">
				<button type="button" class="btn btn-default btn-primary fileBtn">
					<input type="file" id="filePath">
					<i class="fa fa-folder-open"></i> 浏览
				</button>
				<button type="button" class="btn btn-default btn-success" id="upLoadeFile">
					<i class="fa fa-upload"></i> <span>上传</span>
				</button>
				<a href="template/socialSecurityTemplate.xlsx" target="_blank" class="btn btn-default btn-info">
					<i class="fa fa-download"></i> 下载模板
				</a>
				<button type="button" class="btn btn-default btn-link bk-fg-danger" data-toggle="tooltip" title="上传失败" onclick="$('#showErrorModal').modal('show');" id="errorBtn">
					<i class="fa fa-times"></i> <span>0</span>
				</button>
			</div>
		</div>
	</div>
</div>

<form class="panel form-horizontal" id="addTalmportForm">
	<div class="panel-heading bk-bg-primary">
		<h6>录入社保信息</h6>
	</div>
	<div class="panel-body">
		<div class="form-group">
        	<label class="col-md-3 control-label">身份证</label>
         	<div class="col-md-5">
             	<div class="controls">
					<div class="input-group" style="width: 100%;">
						<input id="idNumber" class="form-control"  type="text" placeholder="请输入需要录入人的身份证" maxlength="20"  />
						<span class="input-group-btn" style="width: 100px;">
							<button class="btn btn-default" id="idNumberBtn" type="button"><i class="fa fa-search"></i> 获取</button>
							<button type="button" class="btn btn-default" onclick="$('#selectPerson').modal('show');">选择人员</button>
						</span>
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
<script id="errorItemTemplate" type="text/x-handlebars-template">
{{#each this}}
<li class="red">
	<span class="title">错误描述：{{msg}}</span>
	<span class="description truncate">错误行数：在文件的 {{rowIndex}} 行,第 {{colVal}} 列</span>
</li>
{{/each}}
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
				<td>{{#if socialsecurity}}<i class="fa fa-check text-success"></i>{{else}}<i class="fa fa-times text-danger"></i>{{/if}}</td>
			</tr>
			<tr>
				<td class="active">户口类型</td>
				<td>{{householdStr}}</td>
				<td class="active">所属项目</td>
				<td><a href="javascript:;" class="text-primary" onclick="showProInfo('{{proId}}')">{{proName}}</a></td>
			</tr>
		</tbody>
	</table>
</div>
<div class="form-group">
	<label class="col-md-4 control-label">年龄段</label>
 	<div class="col-md-5">
     	<div class="form-control-static">{{ageDuan}}</div>
	</div>
</div>
 <div class="form-group">
	<label class="col-md-4 control-label">是否纳入社保<span class="text-danger">*</span></label>
	<div class="col-md-5" id="isSheBao">
		<div class="radio-custom radio-inline">
			<input type="radio" name="isSheBao" value="true">
			<label> 是</label>
		</div>
		<div class="radio-custom radio-inline">
			<input type="radio" name="isSheBao" value="flase">
			<label> 否</label>
		</div>
	</div>
</div>
<div class="form-group">
	<label class="col-md-4 control-label">纳入社保时间<span class="text-danger">*</span></label>
 	<div class="col-md-5">
     	<input type="text" id="time" class="form-control" disabled placeholder="____/__/__" data-plugin-datepicker="" data-plugin-masked-input="" data-input-mask="9999/99/99">
	</div>
</div>
<div class="form-group">
	<label class="col-md-4 control-label">待遇标准<span class="text-danger">*</span></label>
 	<div class="col-md-5">
     	<select class="form-control" id="newType" disabled>
			<option value="">请选择待遇标准</option>
			<s:iterator id="dto" value="socialsecurityTypeDtos">
				<option value="<s:property value='#dto.getId()' />"><s:property value='#dto.getName()' /></option>
			</s:iterator>
		</select>
	</div>
</div>
<div class="form-group">
	<label class="col-md-4 control-label">所属社区</label>
 	<div class="col-md-5">
		<input type="text" name="community" class="form-control" disabled placeholder="请输入所属社区" maxlength="10">
	</div>
</div>
<div class="form-group">
	<label class="col-md-4 control-label">参加何种医疗保险</label>
 	<div class="col-md-5">
		<input type="text" name="joinWhichMedicalInsurance" class="form-control" disabled placeholder="请输入参加何种医疗保险" maxlength="10">
	</div>
</div>
<div class="form-group">
	<label class="col-md-4 control-label">养老保险补缴年限</label>
 	<div class="col-md-5">
		<input type="text" name="endowmentInsuranceYear" class="form-control" disabled placeholder="请输入养老保险补缴年限" maxlength="10">
	</div>
</div>
<div class="form-group">
	<label class="col-md-4 control-label">医疗保险视同缴费月数</label>
 	<div class="col-md-5">
		<input type="text" name="medicalInsuranceMonth" class="form-control" disabled placeholder="请输入医疗保险视同缴费月数" maxlength="10">
	</div>
</div>
<div class="form-group">
	<label class="col-md-4 control-label">服刑或劳动教养时间(月)</label>
 	<div class="col-md-5">
		<input type="text" name="prisonTime" class="form-control" disabled placeholder="请输入服刑或劳动教养时间(月)" maxlength="10">
	</div>
</div>
<div class="form-group">
	<label class="col-md-4 control-label">军队服役时间(月)</label>
 	<div class="col-md-5">
		<input type="text" name="serveArmyTime" class="form-control" disabled placeholder="请输入军队服役时间(月)" maxlength="10">
	</div>
</div>
<hr>
<div class="form-group">
	<div class="col-md-5 col-md-offset-4">
		<div style="text-align:right">
			<button type="submit" class="btn btn-primary btn-bg">保存</button>
		</div>
	</div>
</div>
</script>
<script type="text/javascript" src="assets/js/ageCalculate.js"></script>
<script type="text/javascript" src="assets/pageJs/socialSecurityMansgement/solmImportFile.js"></script>