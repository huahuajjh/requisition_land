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
		<div class="row">
			<div class="col-xs-12 text-left bk-vcenter">
				<h6 class="bk-margin-off">导入购房券信息</h6>
			</div>
		</div>
	</div>
	<div class="panel-body">
		<div class="input-group" style="width:100%;">
			<div class="form-control" id="fileName"></div>
			<div class="input-group-btn" style=" width: 300px;">
				<button type="button" class="btn btn-default btn-primary fileBtn">
					<input type="file" id="filePath">
					<i class="fa fa-folder-open"></i> 浏览
				</button>
				<button type="button" class="btn btn-default btn-success" id="upLoadeFile">
					<i class="fa fa-upload"></i> <span>上传</span>
				</button>
				<a href="template/housePurchaseTemplate.xlsx" target="_blank" class="btn btn-default btn-info">
					<i class="fa fa-download"></i> 下载模板
				</a>
				<button type="button" class="btn btn-default btn-link bk-fg-danger" data-toggle="tooltip" title="上传失败" onclick="$('#showErrorModal').modal('show');" id="errorBtn">
					<i class="fa fa-times"></i> <span>0</span>
				</button>
			</div>
		</div>
	</div>
</div>

<form class="panel form-horizontal" id="addHPT">
	<div class="panel-heading bk-bg-primary">
		<h6>手工添加购房券信息</h6>
	</div>
	<div class="panel-body">
			<div class="form-group">
	        	<label class="col-md-3 control-label">请输入姓名或身份证件进行查询</label>
	         	<div class="col-md-5 downImput">
	             	<input type="text" id="idNumberOrName"  class="form-control" placeholder="请输入需要录入人的身份证件" />
	             	<ul class="dropdown-menu" id="queryDown"></ul>
	        	</div>
	      	</div>
	      	<div class="form-group">
	        	<label class="col-md-3 control-label"></label>
	         	<div class="col-md-5">
		         	<button class="btn btn-primary" id="idNumberBtn" type="button"><i class="fa fa-search"></i> 获取</button>
		         	<button type="button" class="btn btn-default" onclick="$('#selectPerson').modal('show');">选择人员</button>
		         	<button type="button" class="btn btn-default" onclick="$('#personInfoModal').modal('show');">添加人员信息</button>
	        	</div>
	      	</div>
	      	<hr>
	      	<div id="showinfo">
			</div>
	</div>
</form>

<form class="modal fade" id="personInfoModal" data-backdrop="static" onsubmit="return false;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title bk-fg-primary">添加人员信息</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-8" id="showHuMsg">
						<label class="control-label">选择所属户主<span class="text-danger">*</span></label>
						<div class="input-group" style="width: 100%;">
							<div class="form-control" id="selectedHuData"></div>
							<span class="input-group-btn" style="width:86px;">
								<button type="button" class="btn btn-default" onclick="showModel('#selectedHuData');">选择户主</button>
							</span>
						</div>
					</div>
					<div class="col-md-12">
						<hr>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label">姓名<span class="text-danger">*</span></label>
							<input type="text" class="form-control" name="name" placeholder="请输入姓名" maxlength="15">
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
										<input type="text" name="idNumber" class="form-control" placeholder="请输入证件号码" maxlength="20" disabled>
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
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="submit" class="btn btn-primary">保存</button>
			</div>
		</div>
	</div>
</form>

<div class="modal fade" id="showErrorModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title bk-fg-primary">上传数据错误列表</h4>
			</div>
			<div class="modal-body" id="errorModalBody">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>

<form class="modal fade" id="personHPTInfoModal" data-backdrop="static" onsubmit="return false;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title bk-fg-primary">添加人员信息以及人员购房券信息</h4>
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

<form class="modal fade" id="htpInfoModal" data-backdrop="static" onsubmit="return false;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title bk-fg-primary">添加购房券信息</h4>
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

<div class="modal fade" id="selectPerson">
  <div class="modal-dialog">
    <div class="modal-content">
    </div>
  </div>
</div>
<div class="modal fade" id="showProInfoModal">
  <div class="modal-dialog">
    <div class="modal-content" id="showProInfoArea">
    </div>
  </div>
</div>
<div class="modal fade" id="selectHuPerson">
  <div class="modal-dialog">
    <div class="modal-content">
    </div>
  </div>
</div>
<div class="modal fade" id="selectHuPerson2">
  <div class="modal-dialog">
    <div class="modal-content">
    </div>
  </div>
</div>

<script id="addHPTModalTemplate" type="text/x-handlebars-template">
<div class="form-group">
	姓名：{{name}}
</div>
<div class="form-group">
	所属项目：<a href="javascript:;" class="text-primary" onclick="showProInfo('{{proId}}')">{{proName}}</a>
</div>
<div class="form-group">
	身份证件：{{idNumber}}
</div>
<div class="form-group">
	与户主关系：{{relationshipStr}}{{#if otherRelationship}}-{{otherRelationship}}{{/if}}
</div>
<div class="form-group">
	是否独生子女：{{#if onlyChildNumber}}<i class="fa fa-check text-success"></i>{{else}}<i class="fa fa-times text-danger"></i>{{/if}}
</div>
<div class="form-group">
	是否半边户：{{#if half}}<i class="fa fa-check text-success"></i>{{else}}<i class="fa fa-times text-danger"></i>{{/if}}
</div>
<div class="form-group"><hr></div>
<div class="form-group">
	<label class="control-label">购房券金额（万元）<span class="text-danger">*</span></label>
	<input type="text" value="{{money}}" name="money" class="form-control" id="money" placeholder="请输入购房券金额（万元）" maxlength="15">
</div>
<div class="form-group">
	<label class="control-label" for="select">购房券券号<span class="text-danger">*</span></label>
	<input type="text" value="{{ticketNumber}}" name="quanNumber"  class="form-control" id="quanNumber" placeholder="请输入购房券券号" maxlength="30">
</div>
<div class="form-group">
	<label class="control-label" for="select">制券时间<span class="text-danger">*</span></label>
	<input type="text" name="time" class="form-control" id="quanTime" placeholder="____/__/__"
			data-plugin-datepicker data-plugin-masked-input data-input-mask="9999/99/99">
</div>
</script>
<script id="addFMLPersonTemplate" type="text/x-handlebars-template">
<div class="row">
	<div class="col-md-8" id="showHuMsg2">
		<label class="control-label">选择所属户主<span class="text-danger">*</span></label>
		<div class="input-group" style="width: 100%;">
			<div class="form-control" id="selectedHuData2"></div>
			<span class="input-group-btn" style="width:86px;">
				<button type="button" class="btn btn-default" onclick="showModel('#selectedHuData2');">选择户主</button>
			</span>
		</div>
	</div>
	<div class="col-md-12">
		<hr>
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
	<div class="col-md-12">
		<hr>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">购房券券号<span class="text-danger">*</span></label>
			<input type="text" name="ticketNumber" value="{{ticketNumber}}" class="form-control" placeholder="请输入购房券券号" maxlength="20">
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">购房券金额(万元)<span class="text-danger">*</span></label>
			<input type="text" name="bonus" value="{{money}}" class="form-control" placeholder="请输入购房券金额" maxlength="15">
		</div>
	</div>
</div>
</script>
<script id="notExistHPTItemTemplate" type="text/x-handlebars-template">
<tr>
	<td>{{proName}}</td>
	<td>{{name}}</td>
	<td>{{relationship}}</td>
	<td>{{idNumber}}</td>
	<td>{{ticketNumber}}</td>
	<td>{{money}}</td>
	<td class="operation">
		<a class="label label-primary" onclick="addPerson(this);">添加成员</a>
		<a class="label label-default" onclick="ignorePerson(this);">忽略成员</a>
	</td>
</tr>
</script>
<script id="errorHPTItemTemplate" type="text/x-handlebars-template">
<tr>
	<td>{{proName}}</td>
	<td>{{name}}</td>
	<td>{{relationship}}</td>
	<td>{{idNumber}}</td>
	<td>{{ticketNumber}}</td>
	<td>{{money}}</td>
</tr>
<tr>
	<td colspan="6">错误描述：该购房券已经存在，不可重复添加。</td>
</tr>
</script>
<script id="errorInfoTemplate" type="text/x-handlebars-template">
<ul class="btn-group btn-group-justified" role="tablist" style="padding-left: 0;">
	<li href="#notExistHPT" aria-controls="home" role="tab" data-toggle="tab" class="active btn btn-default">不存在的人员<span class="text-danger" id="notExistHPTCount">（{{notExistHPTCount}}）</span></li>
	<li href="#errorHPT" aria-controls="profile" role="tab" data-toggle="tab" class="btn btn-default">重复添加的购房券<span class="text-warning">（{{errorHPTCount}}）</span></li>
</ul>
<div class="tab-content">
	<div role="tabpanel" class="tab-pane active" style="padding: 20px 0;" id="notExistHPT">
    	<div class="table-responsive">
			<table class="table table-bordered table-striped table-condensed table-hover">
				<thead>
					<tr>
						<th>征拆项目</th>
						<th>姓名</th>
						<th>与户主关系</th>
						<th>身份证件</th>
						<th>票据号</th>
						<th>补贴金额</th>
						<th style="width: 200px;">操作</th>
					</tr>
				</thead>   
				<tbody id="notExistHPTBody">
				</tbody>
			</table>
		</div>
    </div>
    <div role="tabpanel" class="tab-pane" style="padding: 20px 0;" id="errorHPT">
    	<div class="table-responsive">
			<table class="table table-bordered table-striped table-condensed table-hover">
				<thead>
					<tr>
						<th>征拆项目</th>
						<th>姓名</th>
						<th>与户主关系</th>
						<th>身份证件</th>
						<th>票据号</th>
						<th>补贴金额</th>
					</tr>
				</thead>   
				<tbody id="errorHPTBody">
				</tbody>
			</table>
		</div>
    </div>
  </div>
</div>
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
				<td>征拆项目</td>
				<td>姓名</td>
				<td>与户主关系</td>
				<td>身份证件</td>
				<td>人口</td>
				<td>票据号</td>
				<td>补贴金额</td>
			</tr>
		</thead>
		<tbody>
			{{#each this}}
			<tr>
				<td>{{proName}}</td>
				<td>{{name}}</td>
				<td>{{relationship}}</td>
				<td>{{idNumber}}</td>
				<td>{{fmlNumber}}</td>
				<td>{{ticketNumber}}</td>
				<td>{{money}}</td>
			</tr>
			{{/each}}
		</tbody>
	</table>
</div>
</script>
<script id="logItemTemplate" type="text/x-handlebars-template">
<table>
	<tr>
		<td class="text-right">姓名：</td>
		<td>{{name}}</td>
	</tr>
	<tr>
		<td class="text-right">身份证件：</td>
		<td>{{idNumber}}</td>
	</tr>
	<tr>
		<td class="text-right">购房券金额（万元）：</td>
		<td>{{bonus}}</td>
	</tr>
	<tr>
		<td class="text-right">购房券券号：</td>
		<td>{{ticketNumber}}</td>
	</tr>
	<tr>
		<td class="text-right">制券时间：</td>
		<td>{{makeDate}}</td>
	</tr>
</table>
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
<script id="logFmlItemAndHPTTemplate" type="text/x-handlebars-template">
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
<script id="queryDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{name}}-{{idNumber}}</a></li>
</script>
<script id="errorItemTemplate" type="text/x-handlebars-template">
<ul class="bulletList" id="bulletList">
	{{#each this}}
	<li class="red">
		<span class="title">错误描述：{{msg}}</span>
		<span class="description truncate">错误行数：在文件的 {{rowIndex}} 行,第 {{colVal}} 列</span>
	</li>
	{{/each}}
</ul>
</script>
<script id="showInfoTemplate" type="text/x-handlebars-template">
<div class="form-group">
	<label class="col-md-3 control-label">姓名</label>
	<div class="col-md-5">
		<div class="form-control-static" >{{name}}</div>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label">所属项目</label>
	<div class="col-md-5">
		<div class="form-control-static" >
			<a href="javascript:;" class="text-primary" onclick="showProInfo('{{proId}}')">{{proName}}</a>
		</div>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label">身份证件</label>
	<div class="col-md-5">
		<div class="form-control-static" >{{idNumber}}</div>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label">与户主关系</label>
	<div class="col-md-5">
		<div class="form-control-static" >{{relationshipStr}}{{#if otherRelationship}}-{{otherRelationship}}{{/if}}</div>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label">是否独生子女</label>
	<div class="col-md-5">
		<div class="form-control-static">
			{{#if onlyChildNumber}}
			<i class="fa fa-check text-success"></i>
			{{else}}
			<i class="fa fa-times text-danger"></i>
			{{/if}}
		</div>
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="textarea-input">是否半边户</label>
	<div class="col-md-5">
		<div class="form-control-static">
			{{#if half}}
				<i class="fa fa-check text-success"></i>
			{{else}}
				<i class="fa fa-times text-danger"></i>
			{{/if}}
		</div>
	</div>
</div>

<div class="form-group">
	<label class="col-md-3 control-label">购房券金额（万元）<span class="text-danger">*</span></label>
	<div class="col-md-5">
		<input type="text" name="money" class="form-control" id="money" placeholder="请输入购房券金额（万元）" maxlength="15">
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="select">购房券券号<span class="text-danger">*</span></label>
	<div class="col-md-5">
		<input type="text" name="quanNumber"  class="form-control" id="quanNumber" placeholder="请输入购房券券号" maxlength="30">
	</div>
</div>
<div class="form-group">
	<label class="col-md-3 control-label" for="select">制券时间<span class="text-danger">*</span></label>
	<div class="col-md-5">
		<input type="text" name="time" class="form-control" id="quanTime" placeholder="____/__/__"
			data-plugin-datepicker data-plugin-masked-input data-input-mask="9999/99/99">
	</div>
</div>
<hr>
<div class="form-group">
	<div class="col-md-8">
		<Button type="submit" class="btn btn-primary button-next pull-right" id="subDataBtn" >保存</Button>
	</div>
</div>
</script>
<script type="text/javascript" src="assets/pageJs/housePurchaseMansgement/hptAdd.js"></script>