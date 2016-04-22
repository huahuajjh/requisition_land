<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.input-group-addon{
color:#555;
}
.bootstrap-tagsinput .tag {
    margin-bottom: 2px;
    display: inline-block;
    height: 22px;
}
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
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<div class="row">
			<div class="col-xs-12 text-left bk-vcenter">
				<h6 class="bk-margin-off">导入项目信息</h6>
			</div>
		</div>
	</div>
	<div class="panel-body">
		<div class="input-group" style="width:100%;">
			<div class="form-control" id="fileName"></div>
			<div class="input-group-btn" style=" width: 520px;">
				<div class="form-control bk-bg-default" style="width:50px;">时间</div>
				<input type="text" id="time" class="form-control" style="width:130px;" placeholder="____/__/__" data-plugin-datepicker data-plugin-masked-input data-input-mask="9999/99/99">
				<button type="button" class="btn btn-default btn-primary fileBtn">
					<input type="file"  id="filePath"/>
					<i class="fa fa-folder-open"></i> 浏览
				</button>
				<button type="button" class="btn btn-default btn-success" id="upLoadeFile">
					<i class="fa fa-upload"></i> <span>上传</span>
				</button>
				<a href="template/project.xlsx" target="_blank" class="btn btn-default btn-info">
					<i class="fa fa-download"></i> 下载模板
				</a>
				<button type="button" class="btn btn-default btn-link bk-fg-danger"
					data-toggle="tooltip" title="上传失败"
					onclick="$('#showErrorModal').modal('show');" id="errorBtn">
					<i class="fa fa-times"></i> <span>0</span>
				</button>
			</div>
		</div>
	</div>
</div>

<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6>手工添加项目信息</h6>
	</div>
	<div class="panel-body">
		<form id="addProform" class="form-horizontal " onsubmit="return false;">
		<input type="hidden" name="addressVal" id="addressVal" />
			<div class="form-group">
				<label class="col-md-4 control-label">项目审批号<span class="text-danger">*</span></label>
				<div class="col-md-5">
					<input type="text" name="approvalNumber" class="form-control" placeholder="请输入项目审批号" maxlength="100" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">项目名称<span class="text-danger">*</span></label>
				<div class="col-md-5">
					<input type="text" name="proName" class="form-control" placeholder="请输入项目名称" maxlength="100">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">项目分类<span class="text-danger">*</span></label>
				<div class="col-md-5">
					<select name="proCategory" class="form-control" size="1">
						<option value="">请选择项目分类</option>
						<option value="省市重点项目">省市重点项目</option>
						<option value="非重点项目">非重点项目</option>
						<option value="先期用地项目">先期用地项目</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">项目地址<span class="text-danger">*</span></label>
				<div class="col-md-5">
					<input type="text" name="addressOrder" class="form-control" placeholder="请输入项目地址其他信息" maxlength="60">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">项目类型<span class="text-danger">*</span></label>
				<div class="col-md-5">
					<select name="proTypeCode" class="form-control" size="1">
						<option value="">请选择项目</option>
						<s:iterator id="dto" value="proTypeDtos">
								<option value="<s:property value='#dto.getCode()' />"><s:property
										value='#dto.getName()' /></option>
							</s:iterator>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" for="password-input">征地面积（亩）<span class="text-danger">*</span></label>
				<div class="col-md-5">
					<input type="text" name="requisitionArea" class="form-control" placeholder="请输入征地面积" maxlength="10" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" for="disabled-input">应拆栋数<span class="text-danger">*</span></label>
				<div class="col-md-5">
					<input type="text" name="shouldRemoveBuildings" class="form-control" placeholder="请输入应拆栋数" maxlength="10">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label" for="textarea-input">应拆户数<span class="text-danger">*</span></label>
				<div class="col-md-5">
					<input type="text" name="shouldRemoveHouses" class="form-control" placeholder="请输入应拆户数" maxlength="10">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">应动迁人口<span class="text-danger">*</span></label>
				<div class="col-md-5">
					<input type="text" name="shouldMovePopulation" class="form-control" placeholder="请输入应动迁人口" maxlength="10">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">应拆总面积（合法）（平方米）<span class="text-danger">*</span></label>
				<div class="col-md-5">
					<input type="text" name="shouldRemoveLegalArea" class="form-control" placeholder="请输入应拆总面积（合法）" maxlength="10">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">应拆总面积（违章）（平方米）<span class="text-danger">*</span></label>
				<div class="col-md-5">
					<input type="text" name="shouldRemoveIllegalArea" class="form-control" placeholder="请输入应拆总面积（违章）" maxlength="10">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">项目应付补偿款（万元）<span class="text-danger">*</span></label>
				<div class="col-md-5">
					<input type="text" name="shouldPayMoney" class="form-control" placeholder="项目应付补偿款" maxlength="15">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">六前项目<span class="text-danger">*</span></label>
				<div class="col-md-5">
					<div>
						<div class="radio-custom radio-inline">
							<input type="radio" name="sixForwardPro" value="是"> 
							<label> 是</label>
						</div>
						<div class="radio-custom radio-inline">
							<input type="radio" name="sixForwardPro" value="否"> 
							<label> 否</label>
						</div>
					</div>
					<label id="sixForwardPro-error" class="error" for="sixForwardPro" style="display: none;"></label>
				</div>
			</div>
			<hr>
			<div class="form-group">
				<div class="col-md-5 col-md-offset-4">
					<button type="submit" class="btn btn-primary button-next pull-right">
						保存
					</button>
				</div>
			</div>
		</form>
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

<script id="addreddItemTemplate" type="text/x-handlebars-template">
<span class="tag label label-primary">{{name}}<span data-role="remove" onclick="deleteAddressItem(this);"></span></span>
</script>
<script id="errorItemTemplate" type="text/x-handlebars-template">
{{#each this}}
<li class="red">
	<span class="title">错误描述：{{msg}}</span>
	<span class="description truncate">错误行数：在文件的 {{rowIndex}} 行,第 {{colVal}} 列</span>
</li>
{{/each}}
</script>
<script id="logItemTemplate" type="text/x-handlebars-template">
<table>
	<tr>
        <td class="text-right">项目审批号：</td>
        <td>{{approvalNumber}}</td>
	</tr>
	<tr>
        <td class="text-right">项目名称：</td>
        <td>{{proName}}</td>
	</tr>
	<tr>
        <td class="text-right">项目分类：</td>
        <td>{{proCategory}}</td>
	</tr>
	<tr>
        <td class="text-right">项目地址：</td>
        <td>{{address}}</td>
	</tr>
	<tr>
        <td class="text-right">项目类型：</td>
        <td>{{proTypeStr}}</td>
	</tr>
	<tr>
        <td class="text-right">征地面积（亩）：</td>
        <td>{{requisitionArea}}</td>
	</tr>
	<tr>
        <td class="text-right">应拆栋数：</td>
        <td>{{shouldRemoveBuildings}}</td>
	</tr>
	<tr>
        <td class="text-right">应拆户数：</td>
        <td>{{shouldRemoveHouses}}</td>
	</tr>
	<tr>
        <td class="text-right">应动迁人口：</td>
        <td>{{shouldMovePopulation}}</td>
	</tr>
	<tr>
        <td class="text-right">应拆总面积（合法）（平方米）：</td>
        <td>{{shouldRemoveLegalArea}}</td>
	</tr>
	<tr>
        <td class="text-right">应拆总面积（违章）（平方米）：</td>
        <td>{{shouldRemoveIllegalArea}}</td>
	</tr>
	<tr>
        <td class="text-right">项目应付补偿款（万元）：</td>
        <td>{{shouldPayMoney}}</td>
	</tr>
	<tr>
        <td class="text-right">六前项目：</td>
        <td>{{sixForwardPro}}</td>
	</tr>
</table>
</script>
<script id="logImportItemTemplate" type="text/x-handlebars-template">
<style type="text/css">
.autoTbale td,.autoTbale th {
	white-space: nowrap;
}
</style>
<div style="overflow-x:auto;width: 100%;">
	<table class="table table-hover table-bordered autoTbale">
		<thead>
			<tr>
				<td colspan="30">月报时间：{{time}}</td>
			</tr>
			<tr>
				<td rowspan="4">在拆项目名称</td>
				<td rowspan="4">审批单号</td>
				<td rowspan="4">项目分类</td>
				<td colspan="2">项目类型（用√标识）</td>
 				<td rowspan="4">本月新启动项目<br>（用√标识）</td>
				<td rowspan="4">是否为本月完成结算项目<br>（用√标识）</td>
				<td rowspan="4">用地位置</td>
				<td colspan="4">腾地情况</td>
				<td colspan="8">拆除房屋情况</td>
				<td colspan="4">拆迁安置人口情况</td>
				<td rowspan="4">本年下达限期腾地决定书</td>
				<td rowspan="4">本年申请法院执行</td>
				<td rowspan="4">本年依法实施强制腾地户数</td>
				<td rowspan="4">属“六前项目”请打√</td>
				<td rowspan="4">备注</td>
			</tr>
			<tr>
				<td rowspan="2">基础设施</td>
				<td rowspan="2">其他</td>
 				<td rowspan="2">征地面积</td>
				<td colspan="3">已腾地</td>
				<td>应拆栋数（合法）</td>
				<td colspan="3">已拆栋数  （合法）</td>
				<td>应拆总面积（合法）</td>
				<td colspan="3">已拆面积（合法）</td>
				<td rowspan="2">应动迁人口（包括非农、半边户、独生子女）</td>
				<td colspan="3">已动迁人口</td>
			</tr>
			<tr>
 				<td>累计</td>
				<td>本月</td>
				<td>本年</td>
				<td>累计</td>
				<td>累计</td>
				<td>本月</td>
				<td>本年</td>
				<td>累计</td>
				<td>累计</td>
				<td>本月</td>
				<td>本年</td>
				<td>累计</td>
				<td>本月</td>
				<td>本年</td>	
			</tr>
		</thead>
		<tbody>
			{{#each list}}
			<tr>
				<td>{{proName}}</td>
				<td>{{approvalNumber}}</td>
				<td>{{proCategory}}</td>
				<td>{{proTypeStrInfra}}</td>
				<td>{{proTypeStrOther}}</td>
				<td>{{newStart}}</td>
				<td>{{curMonthComplete}}</td>
				<td>{{totalAddress}}</td>
				<td>{{requisitionArea}}</td>
				<td>{{requisitionLandAreaTotal}}</td>
				<td>{{removedLandArea}}</td>
				<td>{{requisitionLandAreaYear}}</td>
				<td>{{shouldRemoveBuildings}}</td>
				<td>{{removedBuildingsLegalTotal}}</td>
				<td>{{removedBuildings}}</td>
				<td>{{removedBuildingsLegalYear}}</td>
				<td>{{shouldRemoveLegalArea}}</td>
				<td>{{removedAreaLegalTotal}}</td>
				<td>{{removedLegalArea}}</td>
				<td>{{removedAreaLegalYear}}</td>
				<td>{{shouldMovePopulation}}</td>
				<td>{{removedPopulationTotal}}</td>
				<td>{{movedPopulation}}</td>
				<td>{{removedPopulationYear}}</td>
				<td>{{yearDeadlineFile}}</td>
				<td>{{yearCourtExecute}}</td>
				<td>{{yearLegalRemoved}}</td>
				<td>{{sixForheadPro}}</td>
				<td>{{remark}}</td>
			</tr>
			{{/each}}
		</tbody>
	</table>
</div>
</script>
<script type="text/javascript" src="assets/pageJs/projectManagement/pmAddPro.js"></script>