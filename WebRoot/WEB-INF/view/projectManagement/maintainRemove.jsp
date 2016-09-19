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
.border-at-row > .row:not(:first-child){
	    border-top: 1px solid #eee;
}
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
		<h6>查询拆迁户</h6>
		<div class="panel-actions">
			<a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
		</div>
	</div>
	<div class="panel-body">
		<form action="" method="post">
			<div class="row">
				<div class="col-md-3">
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
						<label>户主姓名</label>
						<input type="text" id="huZhuName" maxlength="15" class="form-control" placeholder="请输入要查询的户主姓名">
						<ul class="dropdown-menu" id="nameQueryPrDown">
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
				<h6>拆迁户户信息台账</h6>
			</div>
			<div class="col-xs-7 bk-vcenter text-right">
				每页显示<select class="select_top" id="dataPageCount">
					<option value="10">10</option>
					<option value="20">20</option>
					<option selected value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
				</select>条数据,总共有<span id="countArea">0</span>户口。
			</div>
		</div>
	</div>
	<div class="panel-body">
		<div class="table-responsive">
			<table
				class="table table-striped table-bordered bootstrap-datatable datatable">
				<thead>
					<tr>
						<th>户主名字</th>
						<th>所属项目</th>
						<th>地址</th>
						<th>人口数</th>
						<th style="width: 280px;">操作</th>
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
<iframe id="daYin" src="template.html" style="display: none;"></iframe>
<div class="modal fade" id="familyInfoModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title bk-fg-primary">查看拆迁户详情</h4>
			</div>
			<div class="modal-body" id="familyInfo">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>

<form class="modal fade" id="editFamilyInfoModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">修改拆迁户信息</h4>
			</div>
			<div class="modal-body" id="editFamilyInfo">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="submit" class="btn btn-primary">保存</button>
			</div>
		</div>
	</div>
</form>
<form class="modal fade" id="addRemoveModal">
	<div class="modal-dialog" >
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title bk-fg-primary">新增家庭人员信息</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label" for="text-input">姓名</label>
							<input type="text" class="form-control" name="name"  placeholder="请输入姓名" maxlength="5" />
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label" for="text-input">与户主关系</label>
							<select name="relationshipId" class="form-control" size="1">
								<option value="">请选择户口性质</option>
								<s:iterator id="dto" value="householdTypeDtos">
									<option value="<s:property value='#dto.getId()' />"><s:property value='#dto.getName()' /></option>
								</s:iterator>
							</select>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label" for="text-input">身份证件</label>
							<input type="text" name="idNumber"  class="form-control"  placeholder="请输入身份证件" maxlength="18" />
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label" for="text-input">出生日期</label>
							<input type="text" name="birthday" class="form-control"  placeholder="____/__/__" maxlength="18" data-plugin-masked-input data-plugin-datepicker data-input-mask="9999/99/99" />
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label" for="text-input">性别</label>
							<select name="gender" class="form-control" size="1">
								<option value="">请选择性别</option>
								<option value="0">男</option>
								<option value="1">女</option>
							</select>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label" for="text-input">户口性质</label>
							<select name="householdId" class="form-control" size="1">
								<option value="">请选择户口性质</option>
								<s:iterator id="dto" value="relationshipTypeDtos">
									<option value="<s:property value='#dto.getId()' />"><s:property value='#dto.getName()' /></option>
								</s:iterator>
							</select>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label" for="text-input">独生子女证件号</label>
							<input type="text" name="onlyChildNumber"  class="form-control"  placeholder="请输入独生子女证件号" maxlength="30" />
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label" for="text-input">是否半边户</label>
							<div class="checkbox-custom form-control" style="border:0;">
								<input type="checkbox" name="half" /> 
								<label></label>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="submit" class="btn btn-primary">保存</button>
			</div>
		</div>
	</div>
</form>
<div class="modal fade" id="personMsgModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title bk-fg-primary">人员管理信息</h4>
			</div>
			<div class="modal-body">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>姓名</th>
							<th>与户主关系</th>
							<th>操作</th>                                        
						</tr>
					</thead>   
					<tbody id="personMsgArea">
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
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
<div class="modal fade" id="phonePaiZhaoModal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
        <h4 class="modal-title">拍摄照片</h4>
      </div>
      <div class="modal-body" id="phonePaiZhaoBody">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>
<form class="modal fade" id="personInfoModal" data-backdrop="static" onsubmit="return false;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title bk-fg-primary">添加人员信息</h4>
			</div>
			<div class="modal-body">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="submit" class="btn btn-primary">保存</button>
			</div>
		</div>
	</div>
</form>

<script id="itemOperationTemplate" type="text/x-handlebars-template">
	<tr>
		<td><a href="javascript:;" onclick="showPersonInfo(this);" class="text-primary">{{name}}</a></td>
		<td>{{relationshipStr}}{{#if otherRelationship}}-{{otherRelationship}}{{/if}}</td>
		<td>
			{{#dengYu relationshipStr '户主'}}
			{{else}}
			<a class="label label-default" onclick="deleteFMLItem(this);">删除家庭成员<a>
			{{/dengYu}}
		</td>
	</tr>
</script>
<script id="itemDeleteLogTemplate" type="text/x-handlebars-template">
<table>
	<tr>
		<td class="text-right">人员姓名：</td>
		<td>{{name}}</td>
	</tr>
	<tr>
		<td class="text-right">人员身份证：</td>
		<td>{{idNumber}}</td>
	</tr>
	<tr>
		<td class="text-right">地址：</td>
		<td>{{address}}</td>
	</tr>
	<tr>
		<td class="text-right">出生时间：</td>
		<td>{{birthday}}</td>
	</tr>
	<tr>
		<td class="text-right">户口类型：</td>
		<td>{{householdStr}}</td>
	</tr>
	<tr>
		<td class="text-right">与户主关系：</td>
		<td>{{relationshipStr}}{{#if otherRelationship}}-{{otherRelationship}}{{/if}}</td>
	</tr>
	<tr>
		<td class="text-right">性别：</td>
		<td>{{#dengYu gender "MALE"}}男{{else}}女{{/dengYu}}</td>
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
</table>
</script>
<script id="addFMLPersonTemplate" type="text/x-handlebars-template">
<div class="row">
	<div class="col-md-6">
		<div class="form-group">
			<div class="form-control-static">户主姓名:<strong>&nbsp;&nbsp;&nbsp;&nbsp;{{headName}}</strong></div>
		</div>
	</div>
	<div class="col-md-12">
		<hr/>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">姓名<span class="text-danger">*</span></label>
			<input type="text" class="form-control" name="name" placeholder="请输入姓名" maxlength="15" value="{{name}}">
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">与户主关系<span class="text-danger">*</span></label>
			<div class="controls">
				<div class="input-group" style="width: 100%;">
					<select class="form-control" size="1" name="relationship">
						<option value="">请选择与户主关系</option>
						<s:iterator id="dto" value="relationshipTypeDtos">
							<option value="<s:property value='#dto.getId()' />"><s:property value='#dto.getName()' /></option>
						</s:iterator>
					</select>
					<span class="input-group-btn" style="width:130px;">
						<input type="text" class="form-control"  name="otherRelationship" disabled maxlength="10" placeholder="请输入与户主关系" />
					</span>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">身份证件<span class="text-danger">*</span></label>
			<div class="controls">
				<div class="input-group" style="width: 100%;">
					<select class="form-control" size="1" name="certificateType">
						<option value="">请选择证件类型</option>
						<option value="idNumber">身份证件</option>
						<option value="otherNumber">其他证件</option>
					</select>
					<span class="input-group-btn" style="width:170px;">
						<input type="text" name="idNumber" value="{{idNumber}}" class="form-control" placeholder="请输入证件号码" maxlength="20" disabled>
					</span>
				</div>
			</div>
			<label id="idNumber-error" class="error" for="idNumber" style="display: none;"></label>
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
			<input type="text" name="birthday" class="form-control" placeholder="____/__/__" maxlength="18" data-plugin-masked-input data-plugin-datepicker data-plugin-datepicker-nottoday data-input-mask="9999/99/99"/>
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">文化程度</label>
			<input type="text" name="educationLevel" class="form-control" placeholder="请输入文化程度" maxlength="10">
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">在读情况</label>
			<input type="text" name="currentEducationSituation"  class="form-control" placeholder="请输入在读情况" maxlength="30">
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">从事农业劳动时间</label>
			<input type="text" name="farmingTime" class="form-control" placeholder="请输入从事农业劳动时间">
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">服兵役/劳改/劳教情况及时间起止段</label>
				<input type="text" name="serveArmySituation" class="form-control" placeholder="请输入服兵役/劳改/劳教情况及时间起止段"  />
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">联系电话</label>
			<input type="text" name="tel" class="form-control" placeholder="请输入联系电话" maxlength="15">
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">独生子女证件号</label>
			<input type="text" name="onlyChildNumber" class="form-control" placeholder="请输入独生子女证件号" maxlength="20">
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">是否半边户</label>
			<div class="checkbox-custom form-control-static">
				<input type="checkbox" name="half"> 
				<label></label>
			</div>
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">是否参加过社会保险</label>
			<div class="checkbox-custom form-control-static">
				<input type="checkbox" name="userdSocialsecurity"> 
				<label></label>
			</div>
		</div>
	</div>
	<div class="col-md-12">
		<div class="form-group">
			<label class="control-label">备注</label>
			<textarea name="remark" rows="3" class="form-control" placeholder="请输入备注" maxlength="140"></textarea>
		</div>
	</div>
</div>
</script>
<script id="logItemTemplate" type="text/x-handlebars-template">
<table>
	<tr>
		<td class="text-right">户主姓名：</td>
		<td>{{headName}}</td>
	</tr>
	<tr>
		<td class="text-right">选择所属项目：</td>
		<td>{{proName}}</td>
	</tr>
	<tr>
		<td class="text-right">房屋合法面积（平方米）：</td>
		<td>{{houseLegalArea}}</td>
	</tr>
	<tr>
		<td class="text-right">房屋违章面积（平方米）：</td>
		<td>{{houseIllegalArea}}</td>
	</tr>
	<tr>
		<td class="text-right">所属地址：</td>
		<td>{{address}}</td>
	</tr>
	<tr>
		<td class="text-right">批证及其他情况说明：</td>
		<td>{{satuationDesc}}</td>
	</tr>
	<tr>
		<td class="text-right">拟定处理方案：</td>
		<td>{{dealSolution}}</td>
	</tr>
	<tr>
		<td class="text-right">联合会审意见：</td>
		<td>{{unionSuggestion}}</td>
	</tr>
	<tr>
		<td class="text-right">备注：</td>
		<td>{{remark}}</td>
	</tr>
	<tr>
		<td class="text-right">联合会审附件：</td>
		<td>{{unionSuggestionPath}}</td>
	</tr>
	<tr>
		<td class="text-right">高拍仪拍照：</td>
		<td>{{image}}</td>
	</tr>
	<tr>
		<td class="text-right">房屋照片管理：</td>
		<td>{{houseImgPath}}</td>
	</tr>
	<tr>
		<td class="text-right">家庭成员数：</td>
		<td>{{fmlNumber}}</td>
	</tr>
</table>
</script>

<script id="nameQueryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{idNumber}}-{{name}}</a></li>
</script>
<script id="entrytemplate" type="text/x-handlebars-template">
<tr>
	<td>
			<a href="javascript:;" class="bk-fg-primary" onclick="showInfo(this);">{{headName}}</a>
	</td>
	<td><a href="javascript:;" class="text-primary" onclick="showProInfo('{{proId}}');">{{proName}}</a></td>
	<td>{{address}}</td>
	<td>{{fmlNumber}}</td>
	<td>
		<a class="label label-dark" onclick="showInfo(this);">查看</a> 
		<a class="label label-info" onclick="editInfo(this);">编辑</a> 
		<a class="label label-success" onclick="showAddFMLAndHPTModal(this);">增加家庭成员</a>
		<a class="label label-default" onclick="showItemList(this);">管理家庭成员<a> 
	</td>
</tr>
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
					{{#if userdSocialsecurity}}
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
		{{#if userdSocialsecurity}}
			<i class="fa fa-check text-success"></i>
		{{else}}
			<i class="fa fa-times text-danger"></i>
		{{/if}}
	</td>
</tr>
</script>
<script id="removeInfoTemplate" type="text/x-handlebars-template">
<div id="proInfoShow"></div>
<div class="panel panel-default">
	<div class="panel-heading">
		<h6>家庭人员管理</h6>
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
</div>
<div class="panel panel-default">
	<div class="panel-heading">
		<div class="row">
			<div class="col-xs-12 text-left bk-vcenter">
				<h6 class="bk-margin-off">户口详细信息</h6>
			</div>
		</div>
	</div>
	<div class="panel-body">
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
					<td><a href="javascript:;" id="showFileItem" class="text-primary">点击查看</a></td>
					<td class="active text-right"><strong>高拍仪拍照</strong></td>
					<td><a href="javascript:;" id="showImage" class="text-primary">点击查看</a></td>
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
	</div>
</div>
</script>
<script id="proInfoTemplate" type="text/x-handlebars-template">
<h4 class="ui header text-center text-primary">
	<strong>
		<a href="javascript:;" class="text-primary" onclick="showProInfo('{{proId}}');">{{proName}}</a>
	</strong>
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
			<strong>{{sequenceStr}}</strong>
		</h5>
	</div>
</div>
</script>
<script id="queryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{proName}}</a></li>
</script>
<script id="queryAddressDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{this}}</a></li>
</script>
<script id="editFamilyInfoTemplate" type="text/x-handlebars-template">
<div class="row">
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">户主姓名</label>
			<div class="form-control-static">{{headName}}</div>
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">选择所属项目</label>
			<div class="form-control-static">{{proName}}</div>
		</div>
	</div>
    <div class="col-md-6">
    	<div class="form-group">
    		<label class="control-label">房屋合法面积（平方米）</label>
				<input type="text" name="houseLegalArea" maxlength="10" class="form-control" placeholder="请输入房屋合法面积" value="{{houseLegalArea}}">
    	</div>
    </div>
	<div class="col-md-6">
    	<div class="form-group">
    		<label class="control-label">房屋违章面积（平方米）</label>
			<input type="text" name="houseIllegalArea" maxlength="10" class="form-control" placeholder="请输入房屋违章面积" value="{{houseIllegalArea}}">
    	</div>
    </div>
    <div class="col-md-12">
    	<div class="form-group">
    		<label class="control-label">所属地址<span class="text-danger">*</span></label>
    		<input type="text" name="address" maxlength="60" class="form-control" placeholder="请输入所属地址" value="{{address}}">
    	</div>
    </div>
    <div class="col-md-6">
    	<div class="form-group">
    		<label class="control-label">批证及其他情况说明</label>
    		<textarea class="form-control" rows="3" name = "satuationDesc" maxlength="500"
    			placeholder="请输入批证及其他情况说明">{{satuationDesc}}</textarea>
    	</div>
    </div>
    <div class="col-md-6">
    	<div class="form-group">
    		<label class="control-label">拟定处理方案</label>
    		<textarea class="form-control" rows="3" maxlength="140" name="dealSolution" placeholder="请输入拟定处理方案">{{dealSolution}}</textarea>
    	</div>
    </div>
    <div class="col-md-6">
    	<div class="form-group">
    		<label class="control-label">联合会审意见</label>
    		<textarea class="form-control" rows="3" maxlength="140" name="unionSuggestion" placeholder="请输入联合会审意见">{{unionSuggestion}}</textarea>
    	</div>
    </div>
    <div class="col-md-6">
    	<div class="form-group">
    		<label class="control-label">备注</label>
    		<textarea class="form-control" rows="3" maxlength="140" name="remark" placeholder="请输入备注">{{remark}}</textarea>
    	</div>
    </div>
<div class="col-md-8">
	<div class="form-group">
			<label class="control-label">联合会审附件</label>
				<div class="controls">
					<div class="input-group upLoadFile" id="lHshFJDom" style="width:100%;">
						<input type="hidden" class="upFileHideVal" name="unionSuggestionPath" value="{{unionSuggestionPath}}">
						<input class="form-control showUpFileName" type="text" readonly="" placeholder="请上传联合会审附件" value="{{unionSuggestionPathName}}">
						<span class="input-group-btn upFileOperation" style="width:210px;">
						    <button class="btn btn-default upFileSelectBtn" type="button" id="xzWJ">选择文件</button>
						    <input type="file" class="upFileVal" style="display:none;">
						    <button class="btn btn-default upFileUpBtn" type="button" id="scWJ">上传文件</button>
						<span class="btn btn-link upFileLogin" style="display:none;cursor: auto;">
							<img src="assets/img/login.gif">
						</span> 
						<span class="btn btn-link upFileSuccess" style="display:none;cursor: auto;">
							<i class="fa fa-check text-success"></i>
						</span>
						<span class="btn btn-link upFileError" style="display:none;cursor: auto;">
							<i class="fa fa-times text-danger"></i>
						</span>
					</span>
				</div>
			</div>
		</div>
   	</div>
	<div class="col-md-4">
    	<div class="form-group">
    		<label class="control-label">高拍仪拍照</label>
    		<div class="form-control-static"">
				<input type="file" id="upFile" style="display:none;" accept="image/*" />
				<a class="label label-primary" id="upBtn" onclick="upFileZhaoPian();">上传</a>
				<a class="label label-primary" id="zhaoBtn" onclick="paiZhao();">拍照</a>
				<a class="label label-success" id="yuLanBtn" style="display: none">预览</a>
				<span class="label">
					<i class="fa fa-check text-success" id="paiZhaoFileCheckState" style="display: none"></i>
					<img src="assets/img/login.gif" id="paiZhaoFileLoginState" style="display: none">
				</span>
			</div>
    	</div>
    </div>
    <div class="col-md-12">
    	<div class="panel panel-default" style="margin: 30px 0;">
    		<div class="panel-heading">
    			<h6 class="bk-margin-off">房屋照片管理</h6>
    		</div>
    		<div class="panel-body">
    			<div class="form-group">
    				<label class="control-label">房屋照片</label> <input type="hidden" name="img" />
    				<div class="controls">
    					<div class="input-group upLoadFile" id="upLoadFile" style="width:100%;">
    						<input type="hidden" class="upFileHideVal" />
							<input class="form-control showUpFileName" type="text" readonly placeholder="请上传房屋照片">
							<span class="input-group-btn upFileOperation" style="width:210px;">
    							<button class="btn btn-default upFileSelectBtn" type="button" id="xzWJ">选择文件</button>
								<input type="file" class="upFileVal" style="display:none;" accept="image/*"  />
    							<button class="btn btn-default upFileUpBtn" type="button" id="scWJ">上传文件</button>
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
    			</div>
    			<hr />
    			<ul class="list-group" id="fileItems">
    			</ul>
    		</div>
    	</div>
    </div>
</div>
</script>
<script id="fileItemTemplate" type="text/x-handlebars-template">
<li class="list-group-item">
	<input type="hidden" name="fileItem" value="{{fileValue}}" />
	<div class="row">
		<div class="col-xs-6">
			<a href="javascript:;" onclick="showImage('{{filePath}}');" class="text-primary">{{fileName}}</a>
		</div>
		<div class="col-xs-6 text-right">
			<a href="javascript:;" onclick="deleteFileItem(this);" class="label label-default">删除</a>
		</div>
	</div>
</li>
</script>
<script id="daYinTemplate" type="text/x-handlebars-template">
<style type="text/css">
	.xiaHuaXian{
		border-bottom: 1px solid #000;padding: 0 20px;
	}
	.right-time{
		float: right;
	}
	.right-time > span{
		min-width: 100px;
	}
	table{
		font-size: 10px;
	}
	.notborder{
		border: 0;
	}
</style>
<h4 style="text-align: center;">
	<strong>
		<span class="xiaHuaXian">{{proName}}</span>项目
		<span class="xiaHuaXian">{{headName}}</span>户房屋拆迁情况
	</strong>
</h4>
<div style="margin: 20px;">
	地址：<span class="xiaHuaXian">{{address}}</span>
	<p class="right-time">
		<span class="xiaHuaXian"></span>年
		<span class="xiaHuaXian"></span>月
		<span class="xiaHuaXian"></span>日
	</p>
</div>
<table class="table table-bordered">
	  <tbody>
	  	<tr>
	  		<td rowspan="2" style="padding: 0;width: 45%;">
	  			<table style="width: 100%;" class="notborder table table-bordered">
	  				<thead>
						<tr style="height: 50px;">
							<th>与户主关系</th>
							<th>姓名</th>
							<th>性别</th>
							<th>出生时间</th>
							<th>户口性质</th>
						</tr>
	  				</thead>
	  				<tbody>
						{{#each items}}
	  					<tr>
	  						<td>{{relationshipStr}}{{#if otherRelationship}}-{{otherRelationship}}{{/if}}</td>
	  						<td>{{name}}</td>
	  						<td>
								{{#dengYu gender "MALE"}}
									男
								{{else}}
									女
								{{/dengYu}}
							</td>
	  						<td>{{birthday}}</td>
	  						<td>{{householdStr}}</td>
	  					</tr>
						{{/each}}
	  				</tbody>
	  			</table>
	  		</td>
			<th style="width: 15%;height: 50px;">批证及其他情况说明</th>
			<th style="width: 15%;height: 50px;">拟定处理方案</th>
			<th style="width: 15%;height: 50px;">联合会审意见</th>
			<th style="width: 10%;height: 50px;">备注</th>
		</tr>
	  	<tr>
	  		<td>{{satuationDesc}}</td>
	  		<td>{{dealSolution}}</td>
	  		<td>
	  			{{unionSuggestion}}
	  			<hr>
	  			<div style="height: 100px;">
	  			县征地办审核人签字：
	  			</div>
	  		</td>
	  		<td>{{remark}}</td>
	  	</tr>
	  </tbody>
</table>
<div class="row">
	<div class="col-xs-2">
		经办人：
	</div>
	<div class="col-xs-2">
		审核人：
	</div>
	<div class="col-xs-3">
		分管负责人：
	</div>
	<div class="col-xs-5">
		拆迁科（区征地办）复核人：
	</div>
</div>
</script>
<script id="logFmlItemTemplate" type="text/x-handlebars-template">
<table>
	<tr>
		<td class="text-right">户主姓名：</td>
		<td>{{headName}}</td>
	</tr>
	<tr>
		<td class="text-right">户主身份证件：</td>
		<td>{{headIdNumber}}</td>
	</tr>
	<tr>
		<td class="text-right">人员姓名：</td>
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
		<td>{{#if userdSocialsecurity}}是{{else}}否{{/if}}</td>
	</tr>
	<tr>
		<td class="text-right">备注：</td>
		<td>{{remark}}</td>
	</tr>
</table>
</script>
<script type="text/javascript" src="assets/pageJs/projectManagement/maintainRemove.js"></script>