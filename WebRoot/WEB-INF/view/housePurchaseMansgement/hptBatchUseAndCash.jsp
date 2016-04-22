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

.errorBorder {
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
				<div class="col-xs-4">
					<div class="form-group downImput">
						<label>项目名称</label>
						<div class="input-group" style="width: 100%;">
							<input type="text" id="queryPrName" maxlength="20"
								class="form-control" placeholder="请输入要查询的项目名称"
								autocomplete="OFF" /> <span class="input-group-btn"
								style="width:81px;"><button class="btn btn-default"
									type="button" onclick="$('#selectProInfoModal').modal('show');">选择项目</button></span>
						</div>
						<ul class="dropdown-menu" id="queryPrDown" style="display: none;"></ul>
					</div>
				</div>
				<div class="col-xs-4">
					<div class="form-group downImput">
						<label>姓名</label> <input type="text" id="name" maxlength="20"
							class="form-control" placeholder="请输入要查询的姓名" autocomplete="OFF">
						<ul class="dropdown-menu" id="nameQueryPrDown">
						</ul>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group downImput">
						<label>户主身份证件</label> <input type="text" name="idNumber"
							id="idNumber" class="form-control" placeholder="请输入要查询的户主身份证件"
							maxlength="20" autocomplete="OFF" />
						<ul class="dropdown-menu" id="idNumberQueryPrDown">
						</ul>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group downImput">
						<label>地址</label> <input type="text" id="queryAddressName"
							maxlength="20" class="form-control" placeholder="请输入要查询的地址"
							autocomplete="OFF" />
						<ul class="dropdown-menu" id="queryAddressDown">
						</ul>
					</div>
				</div>
			</div>
			<hr>
			<div class="row" style="text-align:right;margin-top:10px">
				<div class="col-xs-12">
					<div class="huge blue ui buttons">
						<button type="reset" class="bk-margin-5 btn btn-link">重置</button>
						<button class="btn btn-bg btn-primary"
							onclick="tableData.goPage(1); ">查询</button>
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
					<option value="10">10</option>
					<option value="20">20</option>
					<option selected="" value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
				</select>条数据,总共有<span id="countArea">0</span>条数据。
			</div>
		</div>
	</div>
	<div class="panel-body">
		<div style="overflow-x:auto;width: 100%;">
			<table class="table table-hover table-bordered autoTbale">
				<thead>
					<tr>
						<th>姓名</th>
						<th>身份证件</th>
						<th>所属拆迁项目</th>
						<th>券号</th>
						<th>补贴金额（万元）</th>
						<th>制券时间</th>
						<th>购房券状态</th>
						<th>是否需要处理
							<form class="form-control-static" id="isChuLi"
								style="width: 120px;">
								<div class="row">
									<div class="col-md-6">
										<div class="radio-custom radio-inline">
											<input type="radio" name="isSheBao" value="true"> <label>全部是</label>
										</div>
									</div>
									<div class="col-md-6">
										<div class="radio-custom radio-inline">
											<input type="radio" name="isSheBao" value="false"> <label>全部否</label>
										</div>
									</div>
								</div>
							</form>
						</th>
						<th>使用时间<span class="text-danger">*</span>
							<div style="width: 140px;">
								<input type="text" id="time" class="form-control"
									data-plugin-datepicker data-plugin-masked-input
									data-input-mask="9999/99/99" placeholder="____/__/__">
							</div>
						</th>
						<th>使用类型<span class="text-danger">*</span> <select
							class="form-control" size="1" style="width: 140px;" id="useType">
								<option value="">请选择使用类型</option>
								<option value="0">使用</option>
								<option value="1">兑现</option>
						</select>
						</th>
						<th>使用去向
							<div style="width: 200px;">
								<input type="text" class="form-control" id="useExplain"
									placeholder="请输入使用去向" maxlength="140">
							</div>
						</th>
						<th>情况说明
							<div style="width: 200px;">
								<input type="text" class="form-control" id="situationExplain"
									placeholder="请输入情况说明" maxlength="140">
							</div>
						</th>
						<th>相关凭证</th>
						<th>图片凭证</th>
					</tr>
				</thead>
				<tbody id="dataTbody">
				</tbody>
				<tfoot>
					<tr>
						<td colspan="14">
							<div class="row"></div>
							<div class="pull-left">
								<button id="sendDataBtn" type="button"
									class="bk-margin-5 btn btn-primary btn-sm">批量处理选中的信息</button>
							</div>
							<div class="bk-margin-5 btn-group pull-right" id="pageArea">
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</div>

<div class="modal fade" id="selectProInfoModal">
	<div class="modal-dialog">
		<div class="modal-content"></div>
	</div>
</div>

<div class="modal fade" id="showProInfoModal">
	<div class="modal-dialog">
		<div class="modal-content" id="showProInfoArea"></div>
	</div>
</div>

<div class="modal fade" id="phonePaiZhaoModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title">拍摄照片</h4>
			</div>
			<div class="modal-body" id="phonePaiZhaoBody"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
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
				<td>券号</td>
				<td>补贴金额（万元）</td>
				<td>制券时间</td>
				<td>使用时间</td>
				<td>使用类型</td>
				<td>使用去向</td>
				<td>情况说明</td>
				<td>相关凭证</td>
				<td>图片凭证</td>
			</tr>
		</thead>
		<tbody>
			{{#each this}}
			<tr>
				<td>{{resideName}}</td>
				<td>{{resideIdNumber}}</td>
				<td>{{resideTicketNumber}}</td>
				<td>{{resideBonus}}</td>
				<td>{{resideMakeTime}}</td>
				<td>{{usingDate}}</td>
				<td>{{usingTypeStr}}</td>
				<td>{{usingToWhere}}</td>
				<td>{{situationExplain}}</td>
				<td>{{evidencePath}}</td>
				<td>{{image}}</td>
			</tr>
			{{/each}}
		</tbody>
	</table>
</div>
</script>
<script id="queryAddressDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{this}}</a></li>
</script>
<script id="nameQueryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{idNumber}}-{{name}}</a></li>
</script>
<script id="queryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{proName}}</a></li>
</script>
<script id="idNumberQueryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{idNumber}}-{{name}}</a></li>
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
		<div class="form-control-static">{{ticketNumber}}</div>
	</td>
	<td>
		<div class="form-control-static">{{bonus}}</div>
	</td>
	<td>
		<div class="form-control-static">{{makeTime}}</div>
	</td>
	<td>
		<div class="form-control-static">{{ticketName}}</div>
	</td>
	<td>
		<form class="form-control-static isChuLi" style="width: 150px;">
			<div class="row">
				<div class="col-md-6">
					<div class="radio-custom radio-inline">
						<input type="radio" name="isChuLi" value="true">
						<label>是</label>
					</div>
				</div>
				<div class="col-md-6">
					<div class="radio-custom radio-inline">
						<input type="radio" name="isChuLi" value="false">
						<label>否</label>
					</div>
				</div>
			</div>
		</form>
	</td>
	<td>
		<input type="text" name="time" class="form-control" disabled data-plugin-datepicker data-plugin-masked-input data-input-mask="9999/99/99" placeholder="____/__/__" style="width: 140px;">
	</td>
	<td>
		<select name="useType" class="form-control" size="1" style="width: 140px;" disabled>
	    	<option value="">请选择使用类型</option>
	    	<option value="0">使用</option>
	    	<option value="1">兑现</option>
		</select>
	</td>
	<td>
		<input type="text" class="form-control" name="useExplain" placeholder="请输入使用去向" maxlength="140" disabled>
	</td>
	<td>
		<input type="text" class="form-control" name="situationExplain"  placeholder="请输入情况说明" maxlength="140" disabled>
	</td>
	<td>
		<div class="controls" style="width: 400px;">
			<div class="input-group upLoadFile" style="width:100%;">
				<input type="hidden" class="upFileHideVal" name="evidencePath" />
				<input class="form-control showUpFileName" type="text" readonly placeholder="请上传相关凭证">
				<span class="input-group-btn upFileOperation" style="width:210px;">
					<button class="btn btn-default upFileSelectBtn" type="button" disabled>选择文件</button>
					<input type="file" class="upFileVal" style="display:none;" />
					<button class="btn btn-default upFileUpBtn" type="button" disabled>上传文件</button>
					<span class="btn btn-link upFileLogin" style="display:none;cursor: auto;">
						<img src="assets/img/login.gif" />
					</span>
					<span class="btn btn-link upFileSuccess" style="display:none;cursor: auto;">
						<i class="fa fa-check text-success"></i>
					</span>
					<span class="btn btn-link upFileError" style="display:none;cursor: auto;">
						<i class="fa fa-times text-danger"></i></span>
				</span>
			</div>
		</div>
	</td>
	<td>
		<div class="form-control-static" style="width: 150px;">
			<input type="file" class="upFile" style="display:none;" accept="image/*" />
			<button class="label label-primary upBtn" onclick="upFileZhaoPian(this);" style="cursor: pointer;" disabled>上传</button>
			<button class="label label-primary zhaoBtn" onclick="paiZhao(this);" style="cursor: pointer;" disabled>拍照</button>
			<button class="label label-success yuLanBtn" style="display: none" style="cursor: pointer;" disabled>预览</button>
			<span class="label">
				<i class="fa fa-check text-success paiZhaoFileCheckState" style="display: none"></i>
				<img src="assets/img/login.gif" class="paiZhaoFileLoginState" style="display: none">
			</span>
		</div>
	</td>
</tr>
</script>
<script type="text/javascript"
	src="assets/pageJs/housePurchaseMansgement/hptBatchUseAndCash.js"></script>