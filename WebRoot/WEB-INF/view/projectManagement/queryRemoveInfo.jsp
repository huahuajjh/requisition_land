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
				<div class="col-xs-3">
					<div class="form-group downImput">
						<label>户主姓名</label>
						<input type="text" id="huZhuName" maxlength="15" class="form-control" placeholder="请输入要查询的户主姓名">
						<ul class="dropdown-menu" id="nameQueryPrDown">
						</ul>
					</div>
				</div>
				<div class="col-md-2">
					<div class="form-group">
						<label>镇(街道)</label>
						<select id="street" class="form-control" size="1">
							<option value="">所有街道</option>
							<s:iterator id="dto" value="addressDtos">
								<option value="<s:property value='#dto.getId()' />"><s:property value='#dto.getName()' /></option>
							</s:iterator>
						</select>
					</div>
				</div>
				<div class="col-md-2">
					<div class="form-group">
						<label>村（社区）</label>
						<select id="community"  class="form-control" size="1">
							<option value="">所有社区</option>
						</select>
					</div>
				</div>
				<div class="col-md-2">
					<div class="form-group">
						<label>组</label>
						<select id="zu" class="form-control" size="1">
							<option value="">所有组</option>
						</select>
					</div>
				</div>
				<div class="col-md-12">
					<hr>
					<div class="btn-group pull-right">
						<input type="button" onclick="tableData.goPage(1); " class="btn btn-primary pull-right" value="查询">
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
						<th>
							<div class="checkbox-custom">
								<input type="checkbox" id="checkAllRem"><label> 全选</label>
							</div>
						</th>
						<th>户主名字</th>
						<th>所属项目</th>
						<th>地址</th>
						<th>人口数</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="dataTbody">
				</tbody>
				<tfoot>
					<tr>
						<td colspan="10">
							<div class="row"></div>
							<div class="pull-left">
								<button type="button" class="bk-margin-5 btn btn-default btn-sm" onclick="daYin(this);">打印选中的拆迁户口台账</button>
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
							<label class="control-label" for="text-input">身份证</label>
							<input type="text" name="idNumber"  class="form-control"  placeholder="请输入身份证" maxlength="18" />
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
<script id="nameQueryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{idNumber}}-{{name}}</a></li>
</script>
<script id="entrytemplate" type="text/x-handlebars-template">
<tr>
	<td>
		<div class="checkbox-custom">
			<input type="checkbox" name="check"><label></label>
		</div>
	</td>
	<td>
			<a href="javascript:;" class="bk-fg-primary" onclick="showInfo(this);">{{headName}}</a>
	</td>
	<td><a href="javascript:;" class="text-primary" onclick="showProInfo('{{proId}}');">{{proName}}</a></td>
	<td>{{address}}</td>
	<td>{{fmlNumber}}</td>
	<td>
		<a class="label label-dark" onclick="showInfo(this);">查看</a> 
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
    			<td>身份证号码</td>
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
							<div class="form-control">{{satuationDesc}}</div>
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
    		<div class="input-daterange input-group">
    			<span class="input-group-addon">镇(街道)</span>
				<select id="editStreet" name="streetId" class="form-control" size="1">
    				<option value="">请选择街道</option>
    				<s:iterator id="dto" value="addressDtos">
    					<option value="<s:property value='#dto.getId()' />"><s:property value='#dto.getName()' /></option>
    				</s:iterator>
    			</select>
				<span class="input-group-addon">村（社区）</span>
				<select id="editCommunity" name="communityId" class="form-control" size="1">
    				<option value="0">请选择社区</option>
    			</select>
				<span class="input-group-addon">组</span>
				<select id="editZu" name="zuId" class="form-control" size="1">
    				<option value="0">请选择组</option>
    			</select>
    		</div>
    	</div>
    </div>
    <div class="col-md-6">
    	<div class="form-group">
    		<label class="control-label">批证及其他情况说明</label>
    		<textarea class="form-control" rows="3" name = "satuationDesc" maxlength="140"
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
<script type="text/javascript" src="assets/pageJs/projectManagement/queryRemoveInfo.js"></script>