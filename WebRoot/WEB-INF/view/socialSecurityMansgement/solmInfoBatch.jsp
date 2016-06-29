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
.autoTbale td,.autoTbale th {
	white-space: nowrap;
}
.errorBorder{
    border: 1px solid red !important;
}
</style>
<!--查询条件-->
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6>查询条件</h6>
	</div>
	<div class="panel-body">
		<form class="container" style="width:100%" onsubmit="return false;">
			<div class="row">
				<div class="col-xs-3">
					<div class="form-group downImput">
						<label>项目名称</label>
						<div class="input-group" style="width: 100%;">
							<input type="text" id="queryPrName" maxlength="20" class="form-control" placeholder="请输入要查询的项目名称" autocomplete="OFF" />
							<span class="input-group-btn" style="width:81px;"><button class="btn btn-default" type="button" onclick="$('#selectProInfoModal').modal('show');">选择项目</button></span>
						 </div>
						<ul class="dropdown-menu" id="queryPrDown" style="display: none;"></ul>
					</div>
				</div>
				<div class="col-xs-4">
					<div class="form-group downImput">
						<label>身份证件</label>
						<input type="text" id="idNumber"  maxlength="20" class="form-control" placeholder="请输入要查询的身份证件" autocomplete="OFF">
						<ul class="dropdown-menu" id="idNumberQueryPrDown">
						</ul>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group downImput">
						<label>地址</label>
						<input type="text" id="queryAddressName" maxlength="20" class="form-control" placeholder="请输入要查询的地址" autocomplete="OFF"  />
						<ul class="dropdown-menu" id="queryAddressDown">
						</ul>
					</div>
				</div>
			</div>
			<hr>
			<div class="row" style="text-align:right;margin-top:10px">
				<div class="col-xs-12">
					<div class="huge blue ui buttons">
						<button type="reset" class="bk-margin-5 btn btn-link" >重置</button>
						<button class="btn btn-bg btn-primary" onclick="tableData.goPage(1); ">查询</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<!--查询条件-->

<!--查询结果组件-->
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<div class="row">
			<div class="col-xs-5 text-left bk-vcenter">
				<h6>查询结果</h6>
			</div>
			<div class="col-xs-7 bk-vcenter text-right">
					每页显示<select class="select_top" id="dataPageCount">
					<option selected value="10">10</option>
					<option value="20">20</option>
					<option value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
				</select>条数据,总共有<span id="countArea">0</span>个拆迁户。
			</div>
		</div>
	</div>
	<div class="panel-body">
		<div style="overflow-x:auto;width: 100%; overflow-y: auto;height: 600px;">
		<table class="table table-hover table-bordered autoTbale">
			<thead>
				<tr>
					<th>姓名</th>
					<th>身份证件</th>
					<th>所属拆迁项目</th>
					<th>
						是否需要纳入社保
						<form class="form-control-static" id="isSheBao" style="width: 120px;">
							<div class="row">
								<div class="col-md-6">
									<div class="radio-custom radio-inline">
										<input type="radio" name="isSheBao" value="true">
										<label>全部是</label>
									</div>
								</div>
								<div class="col-md-6">
									<div class="radio-custom radio-inline">
										<input type="radio" name="isSheBao" value="false">
										<label>全部否</label>
									</div>
								</div>
							</div>
						</form>
					</th>
					<th>
						社保时间<span class="text-danger">*</span>
						<div style="width: 140px;">
							<input type="text" id="time" class="form-control"  data-plugin-datepicker-nottoday data-plugin-datepicker data-plugin-masked-input data-input-mask="9999/99/99" placeholder="____/__/__">
						</div>
					</th>
					<th>年龄段</th>
					<th>所属社区</th>
					<th>参加何种医疗保险</th>
					<th>养老保险补缴年限</th>
					<th>医疗保险视同缴费月数</th>
					<th>服刑或劳动教养时间(月)</th>
					<th>军队服役时间(月)</th>	
				</tr>
			</thead>
			<tbody id="dataTbody">
			</tbody>
		 	<tfoot>
				<tr>
					<td colspan="13">
						<div class="row"></div>
						<div class="pull-left">
							<button id="sendDataBtn" type="button" class="bk-margin-5 btn btn-primary btn-sm">批量处理选中的信息</button>
						</div>
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

<div class="modal fade" id="showProInfoModal">
  <div class="modal-dialog">
    <div class="modal-content" id="showProInfoArea">
    </div>
  </div>
</div>

<div class="modal fade" id="selectProInfoModal">
  <div class="modal-dialog">
    <div class="modal-content">
    </div>
  </div>
</div>

<script id="logItemTemplate" type="text/x-handlebars-template">
<style type="text/css">
.autoTbale td,.autoTbale th {
	white-space: nowrap;
}
</style>
<div style="overflow-x:auto;width: 100%;">
<table class="table table-hover table-bordered autoTbale">
	<thead>
		<tr>
		    <td>姓名</td>
		    <td>身份证件</td>
		    <td>社保时间</td>
		    <td>年龄段</td>
		    <td>所属社区</td>
		    <td>参加何种医疗保险</td>
		    <td>养老保险补缴年限</td>
		    <td>医疗保险视同缴费月数</td>
		    <td>服刑或劳动教养时间(月)</td>
		    <td>军队服役时间(月)</td>
		</tr>
	</thead>
	<tbody>
		{{#each this}}
		<tr>
		    <td>{{name}}</td>
		    <td>{{idNumber}}</td>
		    <td>{{socialsecurityTypeStr}}</td>
		    <td>{{socialsecurityDate}}</td>
		    <td>{{ageRange}}</td>
		    <td>{{community}}</td>
		    <td>{{joinWhichMedicalInsurance}}</td>
		    <td>{{endowmentInsuranceYear}}</td>
		    <td>{{medicalInsuranceMonth}}</td>
		    <td>{{prisonTime}}</td>
		    <td>{{serveArmyTime}}</td>
		</tr>
		{{/each}}
	</tbody>
</table>
</div>
</script>
<script id="idNumberQueryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{idNumber}}-{{name}}</a></li>
</script>
<script id="queryAddressDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{this}}</a></li>
</script>
<script id="entrytemplate" type="text/x-handlebars-template">
<tr>
	<td>
		<div class="form-control-static">{{name}}</div>
	</td>
	<td>
		<div class="form-control-static">{{idNumber}}</div>
	</td>
	<td>
		<div class="form-control-static">
			<a href="javascript:;" class="text-primary" onclick="showProInfo('{{proId}}')">{{proName}}</a>
		</div>
	</td>
	<td>
		<form class="form-control-static isSheBao" style="width: 150px;">
			<div class="row">
				<div class="col-md-6">
					<div class="radio-custom radio-inline">
						<input type="radio" name="isSheBao" value="true">
						<label>是</label>
					</div>
				</div>
				<div class="col-md-6">
					<div class="radio-custom radio-inline">
						<input type="radio" name="isSheBao" value="false">
						<label>否</label>
					</div>
				</div>
			</div>
		</form>
	</td>
	<td>
		<input type="text" name="time" class="form-control" disabled data-plugin-datepicker data-plugin-masked-input data-input-mask="9999/99/99" placeholder="____/__/__" style="width: 140px;">
	</td>
	<td>{{ageDuan}}</td>
	<td>
		<input type="text" name="community" class="form-control" disabled placeholder="请输入所属社区" maxlength="10" style="width: 140px;" />
	</td>
	<td>
		<input type="text" name="joinWhichMedicalInsurance" class="form-control" disabled placeholder="请输入参加何种医疗保险" style="width: 140px;">
	</td>
	<td>
		<input type="text" name="endowmentInsuranceYear" class="form-control" disabled placeholder="请输入养老保险补缴年限" style="width: 140px;">
	</td>
	<td>
		<input type="text" name="medicalInsuranceMonth" class="form-control" disabled placeholder="请输入医疗保险视同缴费月数" style="width: 140px;">
	</td>
	<td>
		<input type="text" name="prisonTime" class="form-control" disabled placeholder="请输入服刑或劳动教养时间(月)" style="width: 140px;">
	</td>
	<td>
		<input type="text" name="serveArmyTime" class="form-control" disabled placeholder="请输入军队服役时间(月)" style="width: 140px;">
	</td>
</tr>
</script>
<script id="queryPrDownTemplate" type="text/x-handlebars-template">
       <li><a href="javascript:;">{{proName}}</a></li>
</script>
<script type="text/javascript" src="assets/js/ageCalculate.js"></script>
<script type="text/javascript" src="assets/pageJs/socialSecurityMansgement/solmInfoBatch.js"></script>