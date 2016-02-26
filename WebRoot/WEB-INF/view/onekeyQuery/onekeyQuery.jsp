<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!--查询条件-->
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6>查询条件</h6>
	</div>
	<div class="panel-body">
		<div class="row">
			<div class="col-md-6">
				<label>请输入姓名或身份证进行查询</label>
				<div class="input-group downImput" style="width: 100%;">
					<input class="form-control" id="queryVal" type="text" placeholder="请输入姓名或身份证" maxlength="20" autocomplete="OFF" />
					<span class="input-group-btn" style="width: 57px;">
						<button class="btn btn-default" type="button" id="queryBtn">查询</button>
					</span>
					<ul class="dropdown-menu" id="queryDown"></ul>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="dataArea"></div>

<div class="modal fade" id="showProInfoJModal">
  <div class="modal-dialog">
    <div class="modal-content" id="showProInfoJArea">
    </div>
  </div>
</div>
<script id="queryDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{name}}-{{idNumber}}</a></li>
</script>
<script id="entrytemplate" type="text/x-handlebars-template">
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6 class="bk-margin-off">拆迁户信息/项目信息</h6>
	</div>
	<div class="panel-body">
		<h4 class="ui header text-center text-primary">
			<strong>{{proName}}</strong>
		</h4>
		<div class="row text-center">
			<div class="col-xs-4 bk-bg-white bk-bg-lighten bk-padding-top-20 bk-padding-bottom-20">
				<small>审批号</small>
				<h5 class="bk-margin-off-bottom">
					<strong>{{approvalNumber}}</strong>
				</h5>
			</div>
			<div class="col-xs-4 bk-bg-white bk-bg-lighten bk-padding-top-20 bk-padding-bottom-20">
				<small>项目类型</small>
				<h5 class="bk-margin-off-bottom">
					<strong>{{proTypeStr}}</strong>
				</h5>
			</div>
			<div class="col-xs-4 bk-bg-white bk-bg-lighten bk-padding-top-20 bk-padding-bottom-20">
				<small>项目进度</small>
				<h5 class="bk-margin-off-bottom">
					<strong>{{sequence}}</strong>
				</h5>
			</div>
		</div>
		<table class="table table-bordered">
			<tbody>
				<tr>
					<td class="active text-right"><strong>户主姓名：</strong></td>
					<td>{{headName}}</td>
					<td class="active text-right"><strong>房子合法面积(平方米)：</strong></td>
					<td>{{houseLegalArea}}</td>
					<td class="active text-right"><strong>房子违章面积(平方米)：</strong></td>
					<td>{{houseIllegalArea}}</td>
				</tr>
				<tr>
					<td class="active text-right"><strong>地址：</strong></td>
					<td>{{address}}</td>
					<td class="active text-right"><strong>房子照片：</strong></td>
					<td><a href="javascript:;" id="showFileItem" class="text-primary">点击查看</a></td>
					<td class="active text-right"><strong>联合会审意见文件：</strong></td>
					<td><a {{#if unionSuggestionPathVal}}href="{{unionSuggestionPathVal}}"{{/if}} target="_blank" class="text-primary">点击下载</a></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6>人员信息</h6>
	</div>
	<div class="panel-body">
         <table class="table table-striped table-bordered bootstrap-datatable datatable"> 
           	<tbody>								
           		<tr>
           			<td style="width: 230px;">姓名</td>
           			<td><strong>{{name}}</strong></td>
           			<td style="width: 150px;">性别</td>
           			<td><strong>{{#dengYu gender 0}}男{{else}}女{{/dengYu}}</strong></td>
           		</tr>
           		<tr>
           			<td>身份证号码</td>
       				<td><strong>{{idNumber}}</strong></td>
           			<td>独生子女证件号</td>
       				<td><strong>{{onlyChildNumber}}</strong></td>
           		</tr>
				<tr>
					<td>出生时间</td>
       				<td colspan="3"><strong>{{birthday}}</strong></td>
				</tr>
           	</tbody>
           </table>
	</div>
</div>

<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6>转户信息</h6>
	</div>
	<div class="panel-body">
		<table class="table table-bordered">
			<tbody>
				<tr>
					<td>转户时间：<strong>{{transferDate}}</strong></td>
					<td>转户类型：<strong>{{houseHoldTypeStr}}</strong></td>
					<td>转户地址：<strong>{{tAddress}}</strong></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6>社保信息</h6>
	</div>
	<div class="panel-body">
		<table class="table table-bordered">
			<tbody>
				<tr>
					<td class="active">纳入社保日期</td>
					<td>{{socialsecurityDate}}</td>
					<td class="active">类型字符串</td>
					<td>{{typeStr}}</td>
				</tr>
				<tr>
					<td class="active">军队服役时间(月)</td>
					<td>{{serveArmyTime}}</td>
					<td class="active">养老保险补缴年限</td>
					<td>{{endowmentInsuranceYear}}</td>
				</tr>
				<tr>
					<td class="active">医疗保险视同缴费月数</td>
					<td>{{medicalInsuranceMonth}}</td>
					<td class="active">参加何种医疗保险</td>
					<td>{{joinWhichMedicalInsurance}}</td>
				</tr>
				<tr>
					<td class="active">所属社区</td>
					<td>{{community}}</td>
					<td class="active">服刑或劳动教养时间(月)</td>
					<td>{{prisonTime}}</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6>购房券信息</h6>
	</div>
	<div class="panel-body">
		<table class="table table-bordered">
			<tbody>
                <tr>
                	<td class="active" style="width: 160px;">购房券状态</td>
                	<td>{{state}}</td>
                	<td class="active" style="width: 150px;">制券日期</td>
                	<td>{{makeDate}}</td>
                </tr>
                <tr>
                	<td class="active">补贴金额（万元）</td>
                	<td>{{bonus}}</td>
                	<td class="active">券号</td>
                	<td>{{ticketNumber}}</td>
                </tr>
                <tr>
                	<td class="active">领券时间</td>
                	<td>{{gettingDate}}</td>
                	<td class="active">领用凭证</td>
                	<td>{{#if evidence}}<a class="text-primary" href="javascript:;" onclick="$.initShowImage(['{{evidence}}']);">点击查看</a>{{/if}}</td>
                </tr>
                <tr>
                	<td class="active">领用人姓名</td>
                	<td>{{name}}</td>
                	<td class="active">领用身份证</td>
                	<td>{{idNumber}}</td>
                </tr>
                <tr>
                	<td class="active">使用时间</td>
                	<td>{{useDate}}</td>
                	<td class="active">使用类型</td>
                	<td>{{useType}}</td>
                </tr>
                <tr>
                	<td class="active">购房券使用凭证</td>
                	<td colspan="3">
                		{{#if evidencePathVal}}<a target="_blank" href="{{evidencePathVal}}" class="text-primary">点击下载</a>{{/if}}
                	</td>
                </tr>
		</table>
	</div>
</div>
</script>

<script type="text/javascript" src="assets/pageJs/onekeyQuery/onekeyQuery.js"></script>