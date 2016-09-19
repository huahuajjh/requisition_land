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
.modal {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: 1050;
    display: none;
    overflow: auto;
    -webkit-overflow-scrolling: touch;
    outline: 0;
}
</style>
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6>查询拆迁人员</h6>
		<div class="panel-actions">
			<a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
		</div>
	</div>
	<div class="panel-body">
		<form action="" method="post">
			<div class="row">
				<div class="col-md-4">
					<div class="form-group downImput">
						<label>身份证件</label>
						<input type="text" id="idNumber" class="form-control" placeholder="请输入身份证件" maxlength="20" autocomplete="OFF" />
						<ul class="dropdown-menu" id="idNumberQueryPrDown">
						</ul>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group downImput">
						<label>项目</label>
						<div class="input-group" style="width: 100%;">
							<input type="text" id="queryPrName" maxlength="20" class="form-control" placeholder="请输入要查询的项目名称" autocomplete="OFF" />
							<span class="input-group-btn" style="width:81px;"><button class="btn btn-default" type="button" onclick="$('#selectProInfoModal').modal('show');">选择项目</button></span>
						 </div>
						<ul class="dropdown-menu" id="queryPrDown">
						</ul>
					</div>
				</div>
				<div class="col-xs-4">
					<div class="form-group downImput">
						<label>姓名</label>
						<input type="text" id="name" maxlength="15" class="form-control" placeholder="请输入要查询的姓名" autocomplete="OFF">
						<ul class="dropdown-menu" id="nameQueryPrDown">
						</ul>
					</div>
				</div>
				<div class="col-md-2">
					<div class="form-group">
						<label>独生子女</label>
						<select id="isDSZN"  class="form-control" size="1">
							<option value="2">全部</option>
							<option value="1">是</option>
							<option value="0">否</option>
						</select>
					</div>
				</div>
				<div class="col-md-2">
					<div class="form-group">
						<label>半边户</label>
						<select id="isBBH" class="form-control" size="1">
							<option value="2">全部</option>
							<option value="1">是</option>
							<option value="0">否</option>
						</select>
					</div>
				</div>
				<div class="col-md-2">
					<div class="form-group">
						<label>是否纳入社保</label>
						<select id="isNRSB" class="form-control" size="1">
							<option value="2">全部</option>
							<option value="1">是</option>
							<option value="0">否</option>
						</select>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group downImput">
						<label>地址</label>
						<input type="text" id="queryAddressName" maxlength="20" class="form-control" placeholder="请输入要查询的地址" autocomplete="OFF"  />
						<ul class="dropdown-menu" id="queryAddressDown">
						</ul>
					</div>
				</div>
				<div class="col-md-12">
					<hr>
					<div class="btn-group pull-right">
						<input type="button" onclick="tableData.goPage(1); " class="btn btn-primary pull-right" value="查询">
						<button type="reset" class="bk-margin-5 btn btn-link pull-right" >重置</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>

<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<div class="row">
			<div class="col-xs-5 text-left bk-vcenter">
				<h6>拆迁人员台账</h6>
			</div>
			<div class="col-xs-7 bk-vcenter text-right">
				每页显示<select class="select_top" id="dataPageCount">
					<option value="10">10</option>
					<option value="20">20</option>
					<option selected value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
				</select>条数据,总共有<span id="countArea">0</span>名人员。
			</div>
		</div>
	</div>
	<div class="panel-body">
		<div class="table-responsive">
			<table class="table table-striped table-bordered bootstrap-datatable datatable">
				<thead>
					<tr>
						<th>名字</th>
						<th>所属项目</th>
						<th>与户主关系</th>
						<th>户口性质</th>
						<th>性别</th>
						<th>独生子女</th>
						<th>半边户</th>
						<th>是否转户</th>
						<th>是否纳入社保</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="dataTbody">
				</tbody>
				<tfoot>
					<tr>
						<td colspan="10">
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

<div class="modal fade" id="showPersonInfoModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title bk-fg-primary">查看拆迁户详情</h4>
			</div>
			<div class="modal-body" id="showPersonInfo">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>
<form class="modal fade" id="editPersonInfoModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title bk-fg-primary">编辑拆迁户人员信息</h4>
			</div>
			<div class="modal-body" id="editPersonInfo">
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

<div class="modal fade" id="showPesroMsgModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
	      	<div class="modal-header">
	        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        	<h4 class="modal-title">拆迁户人员信息</h4>
	      	</div>
	      	<div class="modal-body" id="showPesroMsgArea">
			</div>
			<div class="modal-footer">
			  <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
	   </div>
	</div>
</div>

<div class="modal fade" id="showHuMsgModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">查看户信息</h4>
      </div>
      <div id="showHuArea">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
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
		<td class="text-right">与户主关系：</td>
		<td>{{relationshipStr}}{{#if otherRelationship}}-{{otherRelationship}}{{/if}}</td>
	</tr>
	<tr>
		<td class="text-right">身份证件：</td>
		<td>{{idNumber}}</td>
	</tr>
	<tr>
		<td class="text-right">性别：</td>
		<td>{{genderStr}}</td>
	</tr>
	<tr>
		<td class="text-right">户口性质：</td>
		<td>{{householdStr}}</td>
	</tr>
	<tr>
		<td class="text-right">出生日期：</td>
		<td>{{birthday}}</td>
	</tr>
	<tr>
		<td class="text-right">文化程度：</td>
		<td>{{educationLevel}}</td>
	</tr>
	<tr>
		<td class="text-right">在读情况：</td>
		<td>{{currentEducationSituation}}</td>
	</tr>
	<tr>
		<td class="text-right">从事农业劳动时间：</td>
		<td>{{farmingTime}}</td>
	</tr>
	<tr>
		<td class="text-right">服兵役/劳改/劳教情况及时间起止段：</td>
		<td>{{serveArmySituation}}</td>
	</tr>
	<tr>
		<td class="text-right">联系电话：</td>
		<td>{{tel}}</td>
	</tr>
	<tr>
		<td class="text-right">独生子女证件号：</td>
		<td>{{onlyChildNumber}}</td>
	</tr>
	<tr>
		<td class="text-right">是否半边户：</td>
		<td>{{#if half}}是{{else}}否{{/if}}</td>
	</tr>
	<tr>
		<td class="text-right">是否参加过社会保险：</td>
		<td>{{#if isSocialsecurity}}是{{else}}否{{/if}}</td>
	</tr>
	<tr>
		<td class="text-right">备注：</td>
		<td>{{remark}}</td>
	</tr>
</table>
</script>

<script id="showHuInfoEntrytemplate" type="text/x-handlebars-template">
<table class="table table-striped">
	<tbody>
		<tr>
			<td class="active text-right"><strong>户主姓名：</strong></td>
			<td>{{headName}}</td>
			<td class="active text-right"><strong>房屋合法面积(平方米)：</strong></td>
			<td>{{houseLegalArea}}</td>
			<td class="active text-right"><strong>房屋违章面积(平方米)：</strong></td>
			<td>{{houseIllegalArea}}</td>
		</tr>
		<tr>
			<td class="active text-right"><strong>房屋照片：</strong></td>
			<td><a href="javascript:;" onclick="showFileItem(this);" class="text-primary">点击查看</a></td>
			<td class="active text-right"><strong>高拍仪拍照</strong></td>
			<td><a href="javascript:;" onclick="showFileImage(this);" class="text-primary">点击查看</a></td>
			<td class="active text-right"><strong>地址：</strong></td>
			<td>{{address}}</td>
		</tr>
		<tr>
			<td colspan="6">
				<div class="form-group">
					<label>批证及其他情况说明</label>
					<div class="form-control" style="height: auto;">{{satuationDesc}}</div>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<div class="form-group">
					<label>拟定处理方案</label>
					<div class="form-control">{{dealSolution}}</div>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<div class="form-group">
				<label>联合会审意见（<a class="text-primary" target="_blank" {{#if unionSuggestionPathVal}}href="{{unionSuggestionPathVal}}"{{/if}}>联合会审附件-点击下载</a>）</label>
					<div class="form-control">{{unionSuggestion}}</div>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="6">
			<div class="form-group">
					<label>备注</label>
					<div class="form-control">{{remark}}</div>
				</div>
			</td>
		</tr>
	</tbody>
</table>
</script>
<script id="entrytemplate" type="text/x-handlebars-template">
<tr>
	<td>
		<a href="javascript:;" class="bk-fg-primary" onclick="showRemovedInfo(this);">{{name}}</a>
	</td>
	<td><a href="javascript:;" class="text-primary" onclick="showProInfo('{{proId}}');">{{proName}}</a></td>
	<td>{{relationshipStr}}{{#if otherRelationship}}-{{otherRelationship}}{{/if}}</td>	
	<td>{{householdStr}}</td>
	<td>{{genderStr}}</td>
	<td>
		{{#if onlyChildNumber}}
			<i class="fa fa-check text-success"></i>
		{{else}}
			<i class="fa fa-times text-danger"></i>
		{{/if}}
	</td>
	<td>
		{{#if half}}
			<i class="fa fa-check text-success"></i>
		{{else}}
			<i class="fa fa-times text-danger"></i>
		{{/if}}
	</td>
	<td>
		{{#if transfer}}
			<i class="fa fa-check text-success"></i>
		{{else}}
			<i class="fa fa-times text-danger"></i>
		{{/if}}
	</td>
	<td>
		{{#if socialsecurity}}
			<i class="fa fa-check text-success"></i>
		{{else}}
			<i class="fa fa-times text-danger"></i>
		{{/if}}
	</td>
	<td>
		<a class="label label-dark" onclick="showRemovedInfo(this);">查看</a> 
		<a class="label label-info" onclick="editRemevedInfo(this);">编辑</a>
	</td>
</tr>
</script>
<script id="proInfoEntrytemplate" type="text/x-handlebars-template">
<h4 class="ui header text-center text-primary">
	<strong>{{proName}}</strong>
</h4>
<div class="row text-center">
	<div class="col-xs-3 bk-bg-white bk-bg-lighten bk-padding-top-20 bk-padding-bottom-20">
		<small>审批号</small>
		<h5 class="bk-margin-off-bottom">
			<strong>{{approvalNumber}}</strong>
		</h5>
	</div>
	<div class="col-xs-3 bk-bg-white bk-bg-lighten bk-padding-top-20 bk-padding-bottom-20">
		<small>项目地址</small>
		<h5 class="bk-margin-off-bottom">
			<strong>{{address}}</strong>
		</h5>
	</div>
	<div class="col-xs-3 bk-bg-white bk-bg-lighten bk-padding-top-20 bk-padding-bottom-20">
		<small>项目类型</small>
		<h5 class="bk-margin-off-bottom">
			<strong>{{proTypeStr}}</strong>
		</h5>
	</div>
	<div class="col-xs-3 bk-bg-white bk-bg-lighten bk-padding-top-20 bk-padding-bottom-20">
		<small>项目进度</small>
		<h5 class="bk-margin-off-bottom">
			<strong>{{announceName}}</strong>
		</h5>
	</div>
</div>
</script>
<script id="showInfoTemplate" type="text/x-handlebars-template">
<div id="proInfoShow"></div>
<div class="panel panel-default">
	<div class="panel-heading">
		<h6>人员信息</h6>
	</div>
    <table class="table table-striped table-bordered bootstrap-datatable datatable"> 
    	<tbody>								
    		<tr>
    			<td style="width: 230px;">姓名</td>
    			<td><strong>{{name}}</strong></td>
    			<td style="width: 150px;">与户主关系</td>
				<td><strong>{{relationshipStr}}{{#if otherRelationship}}-{{otherRelationship}}{{/if}}</strong></td>
    		</tr>
    		<tr>
    			<td>身份证件号码</td>
    			<td><strong>{{idNumber}}</strong></td>
    			<td>出生日期</td>
				<td><strong>{{birthday}}</strong></td>
    		</tr>
    		<tr>
    			<td>性别</td>
    			<td><strong>{{#dengYu gender "MALE"}}男{{else}}女{{/dengYu}}</strong></td>
    			<td>文化程度</td>
				<td><strong>{{educationLevel}}</strong></td>
    		</tr>
    		<tr>
    			<td>在读情况</td>
    			<td><strong>{{currentEducationSituation}}</strong></td>
    			<td>从事农业劳动时间</td>
				<td><strong>{{farmingTime}}</strong></td>
    		</tr>
    		<tr>
    			<td>是否参加过社会保险</td>
    			<td>
					{{#if isSocialsecurity}}
						<i class="fa fa-check text-success"></i>
					{{else}}
						<i class="fa fa-times text-danger"></i>
					{{/if}}
				</td>
    			<td>是否半边户</td>
				<td>
					{{#if half}}
						<i class="fa fa-check text-success"></i>
					{{else}}
						<i class="fa fa-times text-danger"></i>
					{{/if}}
				</td>
    		</tr>
    		<tr>
    			<td>联系电话</td>
    			<td><strong>{{tel}}</strong></td>
    			<td>户口性质</td>
				<td><strong>{{householdStr}}</strong></td>
    		</tr>
    		<tr>
    			<td>服兵役/劳改/劳教情况及时间起止段</td>
    			<td><strong>{{serveArmySituation}}</strong></td>
    			<td>独生子女证件号</td>
				<td><strong>{{onlyChildNumber}}</strong></td>
    		</tr>
    		<tr>
    			<td>备注</td>
    			<td colspan="3"><strong>{{remark}}</strong></td>
    		</tr>
    	</tbody>
    </table>
</div>
<div class="panel panel-default" id="showHuMsgArea">
	<div class="panel-heading">
		<div class="row">
			<div class="col-xs-12 text-left bk-vcenter">
				<h6 class="bk-margin-off">户口详细信息</h6>
			</div>
		</div>
	</div>
</div>
<div class="panel panel-default">
	<div class="panel-heading">
		<div class="row">
			<div class="col-xs-12 text-left bk-vcenter">
				<h6 class="bk-margin-off">其他成员信息</h6>
			</div>
		</div>
	</div>
	<table class="table table-striped table-bordered bootstrap-datatable datatable">
    	<thead>
    		<tr>
    			<th>姓名</th>
    			<th>与户主关系</th>
    			<th>性别</th>
    			<th>出生日期</th>
    			<th>户口性质</th>
				<th>独生子女证号</th>
				<th>是否半边户</th>
				<th>是否参加过社会保险</th>
    		</tr>
    	</thead>
    	<tbody id="familyInfoItem">
    	</tbody>
    </table>
</div>
</script>
<script id="famitlyItemEntrytemplate" type="text/x-handlebars-template">
<tr>
	<td><a href="javascript:;" onclick="showPersonInfo(this);" class="text-primary">{{name}}</a></td>
	<td>{{relationshipStr}}{{#if otherRelationship}}-{{otherRelationship}}{{/if}}</td>
	<td>
		{{#dengYu gender "MALE"}}
			男
		{{else}}
			女
		{{/dengYu}}
	</td>
	<td>{{birthday}}</td>
	<td>{{householdStr}}</td>
	<td>{{onlyChildNumber}}</td>
	<td>
		{{#if half}}
			<i class="fa fa-check text-success"></i>
		{{else}}
			<i class="fa fa-times text-danger"></i>
		{{/if}}
	</td>
	<td>
		{{#if isSocialsecurity}}
			<i class="fa fa-check text-success"></i>
		{{else}}
			<i class="fa fa-times text-danger"></i>
		{{/if}}
	</td>
</tr>
</script>
<script id="showHuMsgEntrytemplate" type="text/x-handlebars-template">
<table class="table table-striped">
	<tbody>
		<tr>
			<td class="active text-right"><strong>户主姓名：</strong></td>
			<td><a href="javascript:;" onclick="showHuInfo(this);" class="text-primary">{{headName}}</a></td>
			<td class="active text-right"><strong>房屋合法面积(平方米)：</strong></td>
			<td>{{houseLegalArea}}</td>
			<td class="active text-right"><strong>房屋违章面积(平方米)：</strong></td>
			<td>{{houseIllegalArea}}</td>
		</tr>
		<tr>
			<td class="active text-right"><strong>房屋照片：</strong></td>
			<td><a href="javascript:;" onclick="showFileItem(this);" class="text-primary">点击查看</a></td>
			<td class="active text-right"><strong>高拍仪拍照</strong></td>
			<td><a href="javascript:;" onclick="showFileImage(this);" class="text-primary">点击查看</a></td>
			<td class="active text-right"><strong>地址：</strong></td>
			<td colspan="3">{{address}}</td>
		</tr>
	</tbody>
</table>
</script>
<script id="familyItemInfoEntrytemplate" type="text/x-handlebars-template">
<div class="panel panel-default">
    <table class="table table-striped table-bordered bootstrap-datatable datatable"> 
    	<tbody>								
    		<tr>
    			<td style="width: 230px;">姓名</td>
    			<td><strong>{{name}}</strong></td>
    			<td style="width: 150px;">与户主关系</td>
				<td><strong>{{relationshipStr}}{{#if otherRelationship}}-{{otherRelationship}}{{/if}}</strong></td>
    		</tr>
    		<tr>
    			<td>身份证件号码</td>
    			<td><strong>{{idNumber}}</strong></td>
    			<td>出生日期</td>
				<td><strong>{{birthday}}</strong></td>
    		</tr>
    		<tr>
    			<td>性别</td>
    			<td><strong>{{#dengYu gender "MALE"}}男{{else}}女{{/dengYu}}</strong></td>
    			<td>文化程度</td>
				<td><strong>{{educationLevel}}</strong></td>
    		</tr>
    		<tr>
    			<td>在读情况</td>
    			<td><strong>{{currentEducationSituation}}</strong></td>
    			<td>从事农业劳动时间</td>
				<td><strong>{{farmingTime}}</strong></td>
    		</tr>
    		<tr>
    			<td>是否参加过社会保险</td>
    			<td>
					{{#if isSocialsecurity}}
						<i class="fa fa-check text-success"></i>
					{{else}}
						<i class="fa fa-times text-danger"></i>
					{{/if}}
				</td>
    			<td>是否半边户</td>
				<td>
					{{#if half}}
						<i class="fa fa-check text-success"></i>
					{{else}}
						<i class="fa fa-times text-danger"></i>
					{{/if}}
				</td>
    		</tr>
    		<tr>
    			<td>联系电话</td>
    			<td><strong>{{tel}}</strong></td>
    			<td>户口性质</td>
				<td><strong>{{householdStr}}</strong></td>
    		</tr>
    		<tr>
    			<td>服兵役/劳改/劳教情况及时间起止段</td>
    			<td><strong>{{serveArmySituation}}</strong></td>
    			<td>独生子女证件号</td>
				<td><strong>{{onlyChildNumber}}</strong></td>
    		</tr>
    		<tr>
    			<td>备注</td>
    			<td colspan="3"><strong>{{remark}}</strong></td>
    		</tr>
    	</tbody>
    </table>
</div>
</script>
<script id="proInfoTemplate" type="text/x-handlebars-template">
<h4 class="ui header text-center text-primary">
	<strong>{{proName}}</strong>
</h4>
<div class="row text-center">
	<div class="col-xs-3 bk-bg-white bk-bg-lighten bk-padding-top-20 bk-padding-bottom-20">
		<small>审批号</small>
		<h5 class="bk-margin-off-bottom">
			<strong>{{approvalNumber}}</strong>
		</h5>
	</div>
	<div class="col-xs-3 bk-bg-white bk-bg-lighten bk-padding-top-20 bk-padding-bottom-20">
		<small>项目地址</small>
		<h5 class="bk-margin-off-bottom">
			<strong>{{totalAddress}}</strong>
		</h5>
	</div>
	<div class="col-xs-3 bk-bg-white bk-bg-lighten bk-padding-top-20 bk-padding-bottom-20">
		<small>项目类型</small>
		<h5 class="bk-margin-off-bottom">
			<strong>{{proTypeStr}}</strong>
		</h5>
	</div>
	<div class="col-xs-3 bk-bg-white bk-bg-lighten bk-padding-top-20 bk-padding-bottom-20">
		<small>项目进度</small>
		<h5 class="bk-margin-off-bottom">
			<strong>{{sequenceStr}}</strong>
		</h5>
	</div>
</div>
</script>
<script id="editPersonInfoTemplate" type="text/x-handlebars-template">
<div class="row">
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">姓名<span class="text-danger">*</span></label>
			<input type="text" class="form-control" name="name" value="{{name}}" placeholder="请输入姓名" maxlength="15">
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">与户主关系</label>
			<div class="form-control">{{relationshipStr}}{{#if otherRelationship}}-{{otherRelationship}}{{/if}}</div>
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">身份证件<span class="text-danger">*</span></label>
			<input type="text" name="idNumber" value="{{idNumber}}" class="form-control" placeholder="请输入身份证件" maxlength="20">
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">性别<span class="text-danger">*</span></label>
			<select name="gender" class="form-control" size="1">
				<option value="">请选择性别</option>
				<option value="0">男</option>
				<option value="1">女</option>
			</select>
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">户口性质<span class="text-danger">*</span></label>
			<select name="householdId" class="form-control" size="1">
				<option value="">请选择户口性质</option>
				<s:iterator id="dto" value="householdTypeDtos">
					<option value="<s:property value='#dto.getId()' />"><s:property value='#dto.getName()' /></option>
				</s:iterator>
			</select>
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">出生日期<span class="text-danger">*</span></label>
			<input type="text" name="birthday" value="{{birthday}}" class="form-control" placeholder="____/__/__" maxlength="18" data-plugin-masked-input="" data-plugin-datepicker="" data-input-mask="9999/99/99">
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">文化程度</label>
			<input type="text" name="educationLevel" value="{{educationLevel}}" class="form-control" placeholder="请输入文化程度" maxlength="10">
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">在读情况</label>
			<input type="text" name="currentEducationSituation" value="{{currentEducationSituation}}" class="form-control" placeholder="请输入在读情况" maxlength="30">
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">从事农业劳动时间</label>
			<input type="text" name="farmingTime" value="{{farmingTime}}" class="form-control" placeholder="请输入从事农业劳动时间">
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">服兵役/劳改/劳教情况及时间起止段</label>
				<input type="text" name="serveArmySituation" value="{{serveArmySituation}}" class="form-control" placeholder="请输入服兵役/劳改/劳教情况及时间起止段"  />
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">联系电话</label>
			<input type="text" name="tel" value="{{tel}}" class="form-control" placeholder="请输入联系电话" maxlength="15">
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">独生子女证件号</label>
			<input type="text" name="onlyChildNumber" value="{{onlyChildNumber}}" class="form-control" placeholder="请输入独生子女证件号" maxlength="20">
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">是否半边户</label>
			<div class="checkbox-custom form-control-static">
				<input type="checkbox" name="half" {{#if half}}checked{{/if}}> 
				<label></label>
			</div>
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">是否参加过社会保险</label>
			<div class="checkbox-custom form-control-static">
				<input type="checkbox" name="userdSocialsecurity" {{#if isSocialsecurity}}checked{{/if}}> 
				<label></label>
			</div>
		</div>
	</div>
	<div class="col-md-12">
		<div class="form-group">
			<label class="control-label">备注</label>
			<textarea name="remark" rows="3" class="form-control" placeholder="请输入备注" maxlength="140">{{remark}}</textarea>
		</div>
	</div>
</div>
</script>
<script id="queryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{proName}}</a></li>
</script>
<script id="idNumberQueryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{idNumber}}-{{name}}</a></li>
</script>
<script id="nameQueryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{idNumber}}-{{name}}</a></li>
</script>
<script id="queryAddressDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{this}}</a></li>
</script>
<script type="text/javascript" src="assets/js/showProListModal.js"></script>
<script type="text/javascript" src="assets/js/select.js"></script>
<script type="text/javascript" src="assets/pageJs/projectManagement/maintainPersonRemove.js"></script>