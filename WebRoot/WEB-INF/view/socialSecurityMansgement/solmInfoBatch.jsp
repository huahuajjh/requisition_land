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
		<div class="container" style="width:100%">
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
				<div class="col-xs-3">
					<div class="form-group downImput">
						<label>身份证</label>
						<input type="text" id="idNumber"  maxlength="20" class="form-control" placeholder="请输入要查询的身份证" autocomplete="OFF">
						<ul class="dropdown-menu" id="idNumberQueryPrDown">
						</ul>
					</div>
				</div>
				<div class="col-xs-2">
					<div class="form-group">
						<label>街道</label>
						<select id="street"  class="form-control" size="1">
							<option value="">所有街道</option>
							<s:iterator id="dto" value="addressDtos">
								<option value="<s:property value='#dto.getId()' />"><s:property value='#dto.getName()' /></option>
							</s:iterator>
						</select>
					</div>
				</div>
				<div class="col-xs-2">
					<div class="form-group">
						<label>社区</label>
						<select id="community" class="form-control" size="1">
							<option value="">所有社区</option>
						</select>
					</div>
				</div>
				<div class="col-xs-2">
					<div class="form-group">
						<label>组</label>
						<select id="zu" class="form-control" size="1">
							<option value="">所有组</option>
						</select>
					</div>
				</div>
			</div>
			<hr>
			<div class="row" style="text-align:right;margin-top:10px">
				<div class="col-xs-12">
					<div class="huge blue ui buttons">
						<button class="btn btn-bg btn-primary" onclick="tableData.goPage(1); ">查询</button>
					</div>
				</div>
			</div>
		</div>
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
					<option value="10">10</option>
					<option value="20">20</option>
					<option selected="" value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
				</select>条数据,总共有<span id="countArea">0</span>个拆迁户。
			</div>
		</div>
	</div>
	<div class="panel-body">
		<div style="overflow-x:auto;width: 100%;">
		<table class="table table-hover table-bordered autoTbale">
			<thead>
				<tr>
					<th>姓名</th>
					<th>身份证</th>
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
						待遇标准<span class="text-danger">*</span>
						<select class="form-control" size="1" style="width: 140px;" id="sbType">
							<option value="">请选择待遇标准</option>
							<s:iterator id="dto" value="socialsecurityTypeDtos">
								<option value="<s:property value='#dto.getId()' />"><s:property value='#dto.getName()' /></option>
							</s:iterator>
						</select>
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

<script id="idNumberQueryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{idNumber}}</a></li>
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
		<select name="sbType" class="form-control" size="1" style="width: 140px;" disabled>
			<option value="">请选择待遇标准</option>
			<s:iterator id="dto" value="socialsecurityTypeDtos">
				<option value="<s:property value='#dto.getId()' />"><s:property value='#dto.getName()' /></option>
			</s:iterator>
		</select>
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