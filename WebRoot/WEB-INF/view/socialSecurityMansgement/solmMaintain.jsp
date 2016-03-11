<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
						<input type="text"  maxlength="20" class="form-control" placeholder="请输入要查询的身份证" id="idNumber" autocomplete="OFF">
						<ul class="dropdown-menu" id="idNumberQueryPrDown">
						</ul>
					</div>
				</div>
				<div class="col-md-2">
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
				<div class="col-md-2">
					<div class="form-group">
						<label>社区</label>
						<select id="community"  class="form-control" size="1">
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
					<div class="btn-group">
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
	<div class="table-responsive">
			<table class="table table-bordered table-striped table-condensed table-hover">
				<thead>
					<th>所属项目</th>
					<th>姓名</th>
					<th>身份证号</th>
					<th>是否社保</th>
					<th>待遇标准</th>
					<th>社保时间</th>
					<th>操作</th>
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
<form class="modal fade form-horizontal" id="editSolmModal">
  <div class="modal-dialog" style="width: 800px;">
    <div class="modal-content">
      <div class="modal-header">
		 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		 <h4 class="modal-title bk-fg-primary">编辑社保信息</h4>
	  </div>
      <div class="modal-body" id="editInfoArea">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn btn-primary">保存</button>
      </div>
    </div>
  </div>
</form>
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
<table>
	<tr>
		<td class="text-right">姓名：</td>
		<td>{{name}}</td>
	</tr>
	<tr>
		<td class="text-right">身份证：</td>
		<td>{{idNumber}}</td>
	</tr>
	<tr>
		<td class="text-right">纳入社保时间：</td>
		<td>{{ssDate}}</td>
	</tr>
	<tr>
		<td class="text-right">待遇标准：</td>
		<td>{{ssTypeStr}}</td>
	</tr>
	<tr>
		<td class="text-right">所属社区：</td>
		<td>{{community}}</td>
	</tr>
	<tr>
		<td class="text-right">参加何种医疗保险：</td>
		<td>{{joinWhichMedicalInsurance}}</td>
	</tr>
	<tr>
		<td class="text-right">养老保险补缴年限：</td>
		<td>{{endowmentInsuranceYear}}</td>
	</tr>
	<tr>
		<td class="text-right">医疗保险视同缴费月数：</td>
		<td>{{medicalInsuranceMonth}}</td>
	</tr>
	<tr>
		<td class="text-right">服刑或劳动教养时间(月)：</td>
		<td>{{prisonTime}}</td>
	</tr>
	<tr>
		<td class="text-right">军队服役时间(月)：</td>
		<td>{{serveArmyTime}}</td>
	</tr>
</table>
</script>

<script id="idNumberQueryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{idNumber}}-{{name}}</a></li>
</script>
<script id="entrytemplate" type="text/x-handlebars-template">
<tr>
	<td><a href="javascript:;" class="text-primary" onclick="showProInfo('{{proId}}')">{{proName}}</a></td>
	<td>{{name}}</td>
	<td>{{idNumber}}</td>
	<td><i class="fa fa-check text-success"></i></td>
	<td>{{ssTypeStr}}</td>
	<td>{{ssDate}}</td>
	<td>
		<a class="label label-primary" onclick="editData(this);">编辑</a>
	</td>
</tr>
</script>
<script id="queryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{proName}}</a></li>
</script>
<script id="editDataTemplate" type="text/x-handlebars-template">
<div class="form-group">
	<label class="col-md-4 control-label">姓名</label>
	<div class="col-md-5">
		<div class="form-control-static">{{name}}</div>
	</div>
</div>
<div class="form-group">
	<label class="col-md-4 control-label">身份证</label>
	<div class="col-md-5">
 		<div class="form-control-static">{{idNumber}}</div>
	</div>
</div>
<div class="form-group">
	<label class="col-md-4 control-label">所属拆迁项目</label>
	<div class="col-md-5">
 		<div class="form-control-static">{{proName}}</div>
	</div>
</div>
<hr>
<div class="form-group">
	<label class="col-md-4 control-label">纳入社保时间<span class="text-danger">*</span></label>
 	<div class="col-md-5">
     	<input type="text" name="socialsecurityDate" value="{{ssDate}}" class="form-control" placeholder="____/__/__" data-plugin-datepicker="" data-plugin-masked-input="" data-input-mask="9999/99/99">
	</div>
</div>
<div class="form-group">
	<label class="col-md-4 control-label">待遇标准<span class="text-danger">*</span></label>
 	<div class="col-md-5">
     	<select class="form-control" name="socialsecurityTypeId">
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
		<input type="text" name="community" value="{{community}}" class="form-control" placeholder="请输入所属社区" maxlength="10">
	</div>
</div>
<div class="form-group">
	<label class="col-md-4 control-label">参加何种医疗保险</label>
 	<div class="col-md-5">
		<input type="text" name="joinWhichMedicalInsurance" value="{{joinWhichMedicalInsurance}}" class="form-control" placeholder="请输入参加何种医疗保险" maxlength="10">
	</div>
</div>
<div class="form-group">
	<label class="col-md-4 control-label">养老保险补缴年限</label>
 	<div class="col-md-5">
		<input type="text" name="endowmentInsuranceYear" value="{{endowmentInsuranceYear}}" class="form-control" placeholder="请输入养老保险补缴年限" maxlength="10">
	</div>
</div>
<div class="form-group">
	<label class="col-md-4 control-label">医疗保险视同缴费月数</label>
 	<div class="col-md-5">
		<input type="text" name="medicalInsuranceMonth" value="{{medicalInsuranceMonth}}" class="form-control" placeholder="请输入医疗保险视同缴费月数" maxlength="10">
	</div>
</div>
<div class="form-group">
	<label class="col-md-4 control-label">服刑或劳动教养时间(月)</label>
 	<div class="col-md-5">
		<input type="text" name="prisonTime" value="{{prisonTime}}" class="form-control" placeholder="请输入服刑或劳动教养时间(月)" maxlength="10">
	</div>
</div>
<div class="form-group">
	<label class="col-md-4 control-label">军队服役时间(月)</label>
 	<div class="col-md-5">
		<input type="text" name="serveArmyTime" value="{{serveArmyTime}}" class="form-control" placeholder="请输入军队服役时间(月)" maxlength="10">
	</div>
</div>
</script>
<script type="text/javascript" src="assets/pageJs/socialSecurityMansgement/solmMaintain.js"></script>