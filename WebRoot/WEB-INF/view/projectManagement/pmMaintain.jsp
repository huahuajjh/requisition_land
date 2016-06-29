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
.bootstrap-tagsinput:AFTER {
    content: "";
    display: block;
    clear: both;
}
.bootstrap-tagsinput .tag {
    margin-right: 2px;
    color: white;
    float: left;
    margin: 2px;
}
</style>
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6>查询项目</h6>
		<div class="panel-actions">
			<a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
		</div>
	</div>
	<div class="panel-body">
		<form>
			<div class="row">
				<div class="col-md-3">
					<div class="form-group downImput">
						<label for="nf-email">项目名称</label>
						<input type="text" id="queryPrName" maxlength="100" class="form-control" placeholder="请输入要查询的项目名称" autocomplete="OFF" />
						<ul class="dropdown-menu" id="queryPrDown">
						</ul>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="nf-password">项目类型</label> <select name="select"
							id="queryProType" class="form-control" size="1">
							<option value="0">所有项目类型</option>
							<s:iterator id="dto" value="proTypeDtos">
								<option value="<s:property value='#dto.getCode()' />"><s:property value='#dto.getName()' /></option>
							</s:iterator>
						</select>
					</div>
				</div>
				<div class="col-md-2">
					<div class="form-group">
						<label for="nf-password">项目进度</label> <select name="select"
							id="queryPrJD" class="form-control" size="1">
							<option value="0">所有进度</option>
							<option value="1">一公告</option>
							<option value="2">二公告</option>
							<option value="3">三公告</option>
						</select>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group downImput">
						<label>地址</label>
						<input type="text" id="queryAddressName" maxlength="60" class="form-control" placeholder="请输入要查询的地址" autocomplete="OFF"  />
						<ul class="dropdown-menu" id="queryAddressDown">
						</ul>
					</div>
				</div>
				<div class="col-md-12">
					<hr>
					<input type="button" class="btn btn-primary pull-right" value="查询"
						onclick="tableData.goPage(1); " />
					<button type="reset" class="bk-margin-5 btn btn-link pull-right" >重置</button>
				</div>
			</div>
		</form>
	</div>
</div>

<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<div class="row">
			<div class="col-xs-5 text-left bk-vcenter">
				<h6>项目台账</h6>
			</div>
			<div class="col-xs-7 bk-vcenter text-right">
				每页显示<select class="select_top" id="dataPageCount">
					<option value="10">10</option>
					<option value="20">20</option>
					<option selected value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
				</select>条数据,总共有<span id="countArea">0</span>个项目。
			</div>
		</div>
	</div>
	<div class="panel-body">
		<div class="table-responsive">
			<table
				class="table table-bordered table-striped table-condensed table-hover">
				<thead>
					<tr>
						<th>项目名称</th>
						<th>项目类型</th>
						<th>项目进度</th>
						<th>应征面积(亩)</th>
						<th>应拆栋数</th>
						<th>应拆户数</th>
						<th>项目地址</th>
						<th style="width: 120px;">操作</th>
					</tr>
				</thead>
				<tbody id="dataTbody">
				</tbody>
				<tfoot>
					<tr>
						<td colspan="10">
							<div class="row"></div>
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

<div class="modal fade" id="infoModal">
	<div class="modal-dialog" style="width:1200px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title bk-fg-primary">项目详细信息</h4>
			</div>
			<div class="modal-body">
				<h4 class="ui header text-center text-primary">
					<strong id="proInfoName"></strong>
				</h4>
				<table class="table table-striped">
					<tbody>
						<tr>
							<td class="active text-right"><strong>审批号：</strong></td>
							<td id="proInfoApprovalNumber"></td>
							<td class="active text-right"><strong>项目地址：</strong></td>
							<td id="proInfoAddress"></td>
							<td class="active text-right"><strong>项目类型：</strong></td>
							<td id="proInfoType"></td>
						</tr>
						<tr>
							<td class="active text-right"><strong>征地面积(亩)：</strong></td>
							<td id="proInfoZdmj"></td>
							<td class="active text-right"><strong>应拆栋数：</strong></td>
							<td id="proInfoYCDS"></td>
							<td class="active text-right"><strong>应拆户数：</strong></td>
							<td id="proInfoYCHS"></td>
						</tr>
						<tr>
							<td class="active text-right"><strong>应动迁人口：</strong></td>
							<td id="proInfoYDQRK"></td>
							<td class="active text-right"><strong>应拆面积（合法）(平方米)：</strong></td>
							<td id="proInfoHFMJ"></td>
							<td class="active text-right"><strong>应拆面积（违章）(平方米)：</strong></td>
							<td id="proInfoWZMJ"></td>
						</tr>
						<tr>
							<td class="active text-right"><strong>所处公告：</strong></td>
							<td id="proInfoGG"></td>
							<td class="active text-right"><strong>应付补偿款(万元)：</strong></td>
							<td id="proInfoYBCK"></td>
							<td class="active text-right"><strong>启动时间：</strong></td>
							<td id="startDate"></td>
						</tr>
						<tr>
							<td class="active text-right"><strong>项目分类：</strong></td>
							<td id="proInfoFL"></td>
							<td class="active text-right"><strong>六前项目：</strong></td>
							<td id="proInfoLQXM"></td>
						</tr>
					</tbody>
				</table>
				<div class="table-responsive" style="margin:40px 30px;">
					<table
						class="table table-striped table-bordered bootstrap-datatable datatable">
						<thead>
							<tr>
								<th>公告类型</th>
								<th>公告文号</th>
								<th>公告时间</th>
								<th>公告批文</th>
							</tr>
						</thead>
						<tbody id="annListInfo">
						</tbody>
					</table>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h6>项目每月台账详细信息</h6>
					</div>
					<table class="table table-striped table-bordered bootstrap-datatable datatable">
						<thead>
							<tr>
								<th>月份</th>
								<th>本月腾地数(亩)</th>
								<th>本月拆栋数</th>
								<th>本月拆合法面积<br>(平方米)</th>
								<th>本月动迁人口</th>
								<th>下达限期腾地决定书</th>
								<th>申请法院执行</th>
								<th>依法实施强制腾地户数</th>
								<th>是否为本月完成结算项目</th>
								<th>本月新启动项目</th>
							</tr>
						</thead>
						<tbody id="showProMonthProces">
						</tbody>
						<tfoot id="yurBaoHejiArea">
						</tfoot>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>

<form class="modal fade form-horizontal" id="editModal" action="projectManagement/pmQueryProEdit" onsubmit="return false;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">编辑项目信息</h4>
			</div>
			<div class="modal-body" id="editProInfoArea">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="submit" class="btn btn-primary">保存</button>
			</div>
		</div>
	</div>
</form>
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
		<td>{{sixForward}}</td>
	</tr>
</table>
</script>
<script id="yueCountTemplate" type="text/x-handlebars-template">
<tr class="text-primary">
	<th>合计</th>
    <td>{{this.removedLandArea}}</td>
    <td>{{this.removedBuildings}}</td>
    <td>{{this.removedLegalArea}}</td>
    <td>{{this.movedPopulation}}</td>
    <td>{{this.yearDeadlineFile}}</td>
    <td>{{this.yearCourtExecute}}</td>
	<td>{{this.yearLegalRemoved}}</td>
	<td></td>
	<td></td>
</tr>
</script>
<script id="entrytemplate" type="text/x-handlebars-template">
<tr>
	<td>
		<a href="javascript:;" class="bk-fg-primary" onclick="showInfo(this);">{{proName}}</a>
	</td>
	<td>{{proTypeStr}}</td>
	<td>{{sequenceStr}}</td>
	<td>{{requisitionArea}}</td>
	<td>{{shouldRemoveBuildings}}</td>
	<td>{{shouldRemoveHouses}}</td>
	<td>{{totalAddress}}</td>
	<td>
		<a class="label label-dark" onclick="showInfo(this)">查看</a>
		{{#xydy totalPayMoney 0}}
		<a class="label label-info" onclick="editProjectInfo(this);">编辑</a>
		{{/xydy}}
	</td>
</tr>
</script>
<script id="entryInfoTemplate" type="text/x-handlebars-template">
{{#each this}}
   <tr>
        <td>{{this.date}}</td>
        <td>{{this.removedLandArea}}</td>
        <td>{{this.removedBuildings}}</td>
        <td>{{this.removedLegalArea}}</td>
        <td>{{this.movedPopulation}}</td>
        <td>{{this.yearDeadlineFile}}</td>
        <td>{{this.yearCourtExecute}}</td>
		<td>{{this.yearLegalRemoved}}</td>
		<td>{{this.curMonthComplete}}</td>
		<td>{{this.isStart}}</td>
    </tr>
	<tr>
		<td>备注:</td>
		<td colspan="9">{{this.remark}}</td>
	</tr>
{{/each}}
</script>
<script id="editProInfoTemplate" type="text/x-handlebars-template">
<input type="hidden" name="proId" value="{{id}}" />
<div class="row">
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">项目审批号</label>
			<input type="text" name="approvalNumber" value="{{approvalNumber}}" class="form-control" placeholder="请输入项目审批号" maxlength="100">
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">项目名称<span class="text-danger">*</span></label>
			<input type="text" name="proName" class="form-control" value="{{proName}}" placeholder="请输入项目名称" maxlength="100">
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">项目分类<span class="text-danger">*</span></label>
			<select name="proTypeStr" class="form-control" size="1">
				<option value="">请选择项目分类</option>
				<option value="省市重点项目">省市重点项目</option>
				<option value="非重点项目">非重点项目</option>
				<option value="先期用地项目">先期用地项目</option>
			</select>
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">项目地址<span class="text-danger">*</span></label>
			<input type="text" name="otherAddress" class="form-control" placeholder="请输入项目地址其他信息" maxlength="60" value="{{totalAddress}}">
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">项目类型<span class="text-danger">*</span></label>
			<select name="proType" class="form-control" size="1">
				<option value="">请选择项目</option>
				<s:iterator id="dto" value="proTypeDtos">
					<option value="<s:property value='#dto.getCode()' />"><s:property value='#dto.getName()' /></option>
				</s:iterator>
			</select>
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label" >征地面积（亩）<span class="text-danger">*</span></label>
			<input type="text" class="form-control" value="{{requisitionArea}}" placeholder="请输入征地面积" name="requisitionArea" maxlength="10">
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label" for="disabled-input">应拆栋数<span class="text-danger">*</span></label>
			<input type="text" class="form-control" placeholder="请输入应拆栋数" value="{{shouldRemoveBuildings}}" name="shouldRemoveBuildings" maxlength="10">
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label" for="textarea-input">应拆户数<span class="text-danger">*</span></label>
			<input type="text" class="form-control" placeholder="请输入应拆户数" value="{{shouldRemoveHouses}}" name="shouldRemoveHouses" maxlength="10">
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label" for="select">应动迁人口<span class="text-danger">*</span></label>
			<input type="text" class="form-control" placeholder="请输入应动迁人口" value="{{shouldMovePopulation}}" name="shouldMovePopulation" maxlength="10">
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label" for="select">应拆总面积（合法）（平方米）<span class="text-danger">*</span></label>
			<input type="text" class="form-control" placeholder="请输入应拆总面积（合法）" value="{{shouldRemoveLegalArea}}" name="shouldRemoveLegalArea" maxlength="10">
		</div> 
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label" for="select">应拆总面积（违章）（平方米）<span class="text-danger">*</span></label>
				<input type="text" class="form-control" placeholder="请输入应拆总面积（违章）" value="{{shouldRemoveIllegalArea}}" name="shouldRemoveIllegalArea" maxlength="10">
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label" for="multiple-select">项目应付补偿款（万元）<span class="text-danger">*</span></label>
				<input type="text" class="form-control" placeholder="项目应付补偿款（万元）" value="{{shouldPayMoney}}" name="shouldPayMoney" maxlength="15">
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group" style="height: 59px;">
			<label class="control-label">六前项目<span class="text-danger">*</span></label>
			<div>
				<div class="radio-custom radio-inline">
					<input type="radio" name="sixPro" value="是"> 
					<label> 是</label>
				</div>
				<div class="radio-custom radio-inline">
					<input type="radio" name="sixPro" value="否"> 
					<label> 否</label>
				</div>
			</div>
			<label id="sixPro-error" class="error" for="sixPro" style="display: none;"></label>
		</div>
	</div>
</div>
</script>
<script id="announceInfoTemplate" type="text/x-handlebars-template">
{{#each this}}
    <tr>
        <td>{{this.name}}</td>
        <td>{{this.number}}</td>
        <td>{{this.date}}</td>
        <td><a target="_blank" href="{{filePath}}" class="text-primary">{{fileName}}</a></td>
    </tr>
{{/each}}
</script>
<script id="queryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{proName}}</a></li>
</script>
<script id="queryAddressDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{this}}</a></li>
</script>
<script id="addreddItemTemplate" type="text/x-handlebars-template">
<span class="tag label label-primary">{{name}}<span data-role="remove" onclick="deleteFileIItem(this);"></span></span>
</script>
<script src="assets/pageJs/projectManagement/pmMaintain.js"></script>