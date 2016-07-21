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
<!--导入拆迁户家庭信息-->
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<div class="row">
			<div class="col-xs-12 text-left bk-vcenter">
				<h6 class="bk-margin-off">导入拆迁户家庭信息</h6>
			</div>
		</div>
	</div>
	<div class="panel-body">
<div class="input-group" style="width:100%;">
			<div class="form-control" id="fileName"></div>
			<div class="input-group-btn" style=" width: 300px;">
				<input type="file" id="filePath" style="display:none" />
				<button type="button" class="btn btn-default btn-primary fileBtn" id="upFileExl">
					<i class="fa fa-folder-open"></i> 浏览
				</button>
				<button type="button" class="btn btn-default btn-success" id="upLoadeFile">
					<i class="fa fa-upload"></i> <span>上传</span>
				</button>
				<a href="template/familyTemplate.xlsx" target="_blank"  class="btn btn-default btn-info">
					<i class="fa fa-download"></i> 下载模板
				</a>
				<button type="button" class="btn btn-default btn-link bk-fg-danger" data-toggle="tooltip" title="上传失败" onclick="$('#showErrorModal').modal('show');" id="errorBtn">
					<i class="fa fa-times"></i> <span>0</span>
				</button>
			</div>
		</div>
	</div>
</div>

<form class="panel" id="addForm" onsubmit="return false;">
	<div class="panel-heading bk-bg-primary">
		<div class="row">
			<div class="col-xs-8 text-left bk-vcenter">
				<h6>手工添加拆迁户信息</h6>
			</div>
			<div class="col-xs-4 bk-vcenter text-right">
				<input onclick="$('#familyItemsModal').modal('show');" type="button" class="btn btn-bg btn-success" value="家庭成员管理"> 
			</div>
		</div>
	</div>
	<div class="panel-body">
		<div class="row">
			<div class="col-md-4 col-md-offset-2">
				<div class="form-group">
					<label class="control-label">户主姓名</label>
					<div class="form-control" id="showHuZhuName"></div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group downImput">
					<label class="control-label">选择所属项目<span class="text-danger">*</span></label>
					<div class="input-group" style="width: 100%;" id="proData">
						<div class="form-control"  id="proName"></div>
						<span class="input-group-btn" style="width:86px;">
							<button type="button" class="btn btn-default" onclick='$("#showProInfoModal").modal("show");'>选择项目</button>
						</span>
					</div>
				</div>
			</div>
			<div class="col-md-4 col-md-offset-2">
				<div class="form-group">
					<label class="control-label">房屋合法面积（平方米）</label>
						<input type="text" name="houseLegalArea" class="form-control" placeholder="请输入房屋合法面积"
						maxlength="10" id="houseLegalArea" />
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group">
					<label class="control-label">房屋违章面积（平方米）</label>
						<input type="text" name="houseIllegalArea" id="houseIllegalArea" class="form-control" placeholder="请输入房屋合法面积" maxlength="10" />
				</div>
			</div>
			<div class="col-md-8 col-md-offset-2">
				<div class="form-group">
					<label class="control-label">所属地址<span class="text-danger">*</span></label>
					<input type="text" name="address" id="address" class="form-control" placeholder="请输入所属地址" maxlength="60" >
				</div>
			</div>
			<div class="col-md-4 col-md-offset-2">
				<div class="form-group">
					<label class="control-label">批证及其他情况说明</label>
					<textarea class="form-control" rows="3" placeholder="请输入批证及其他情况说明"
						maxlength="500" name=“pzqksm” id="satuationDesc"></textarea>
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group">
					<label class="control-label">拟定处理方案</label>
					<textarea class="form-control" rows="3" placeholder="请输入拟定处理方案"
						maxlength="140" name="ndclfa" id="dealSolution"></textarea>
				</div>
			</div>
			<div class="col-md-4 col-md-offset-2">
				<div class="form-group">
					<label class="control-label">联合会审意见</label>
					<textarea class="form-control" rows="3" placeholder="请输入联合会审意见"
						maxlength="140" name="lhhsyj" id="unionSuggestion"></textarea>
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group">
					<label class="control-label">备注</label>
					<textarea class="form-control" rows="3" placeholder="请输入备注"
						maxlength="140" name="bz" id="remark"></textarea>
				</div>
			</div>
			<div class="col-md-5 col-md-offset-2">
				<div class="form-group">
					<label class="control-label">联合会审附件</label>
					<div class="controls">
						<div class="input-group upLoadFile" id="lHshFJDom" style="width:100%;">
							<input type="hidden" class="upFileHideVal" name="lianheVal" id="lianheVal">
							<input class="form-control showUpFileName" type="text" readonly="" placeholder="请上传联合会审附件">
							<span class="input-group-btn upFileOperation" style="width:210px;">
								<button class="btn btn-default upFileSelectBtn" type="button" id="xzWJ">选择文件</button> <input type="file" class="upFileVal" style="display:none;">
								<button class="btn btn-default upFileUpBtn" type="button" id="scWJ">上传文件</button>
								<span class="btn btn-link upFileLogin" style="display:none;cursor: auto;">
								<img src="assets/img/login.gif"></span> <span class="btn btn-link upFileSuccess" style="display:none;cursor: auto;"><i class="fa fa-check text-success"></i></span> <span class="btn btn-link upFileError" style="display:none;cursor: auto;"><i class="fa fa-times text-danger"></i></span>
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3">
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
			<div class="col-md-8 col-md-offset-2">
				<div class="panel panel-default" style="margin: 30px 0;">
					<div class="panel-heading">
						<h6 class="bk-margin-off">房屋照片管理</h6>
					</div>
					<div class="panel-body">
						<div class="form-group">
							<label class="control-label">房屋照片</label> <input type="hidden"
								name="img" />
							<div class="controls">
								<div class="input-group upLoadFile" id="upLoadFile"
									style="width:100%;">
									<input type="hidden" class="upFileHideVal" /><input
										class="form-control showUpFileName" type="text" readonly
										placeholder="请上传房屋照片"> <span
										class="input-group-btn upFileOperation" style="width:210px;">
										<button class="btn btn-default upFileSelectBtn" type="button"
											id="xzWJ">选择文件</button> <input type="file" class="upFileVal"
										style="display:none;" accept="image/*" />
										<button class="btn btn-default upFileUpBtn" type="button" id="scWJ">上传文件</button>
										<span class="btn btn-link upFileLogin" style="display:none;cursor: auto;">
										<img src="assets/img/login.gif" /></span> <span
										class="btn btn-link upFileSuccess"
										style="display:none;cursor: auto;"><i
											class="fa fa-check text-success"></i></span> <span
										class="btn btn-link upFileError"
										style="display:none;cursor: auto;"><i
											class="fa fa-times text-danger"></i></span>
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
			<div class="col-md-12	">
			<hr>
			</div>
			<div class="col-md-8 col-md-offset-2">
				<div class="text-right">
					家庭成员数：<span familyCount>0</span>&nbsp;&nbsp;&nbsp;&nbsp;
					<input onclick="$('#familyItemsModal').modal('show');" type="button" class="btn btn-bg btn-success" value="家庭成员管理">
					&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp; 
					<button type="submit" class="btn btn-primary" id="subDataBtn">保存</button>
				</div>
			</div>
		</div>
	</div>
	</div>
</form>

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

<div class="modal fade" id="showErrorModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title bk-fg-primary">上传数据错误列表</h4>
			</div>
			<div class="modal-body">
				<ul class="bulletList" id="bulletList">
				</ul>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="showProInfoModal">
  <div class="modal-dialog">
    <div class="modal-content">
    </div>
  </div>
</div>
<div class="modal fade" id="familyItemsModal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">家庭人员列表</h4>
      </div>
      <div class="modal-body">
      	<div id="familyItems" class="panel-body bk-bg-white bk-padding-off-top bk-padding-off-bottom border-at-row">
		</div>
      </div>
      <div class="modal-footer">
      	<span>家庭成员数：<span familyCount>0</span>&nbsp;&nbsp;</span>
		<input onclick="fimalyItem();" type="button" class="btn btn-bg btn-success" value="添加家庭成员"> 
        <button type="button" class="btn btn-default" data-dismiss="modal">保存</button>
      </div>
    </div>
  </div>
</div>
<form class="modal fade" id="personInfoModal" data-backdrop="static" onsubmit="return false;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title bk-fg-primary">家庭成员信息</h4>
			</div>
			<div class="modal-body" id="fimalyItemInfoArea">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="submit" class="btn btn-primary">保存</button>
			</div>
		</div>
	</div>
</form>

<script id="logItemTemplate" type="text/x-handlebars-template">
<style type="text/css">
.autoTbale td,.autoTbale th {
	white-space: nowrap;
}
</style>
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
<div style="overflow-x:auto;width: 100%;">
	<table class="table table-hover table-bordered autoTbale">
		<thead>
			<tr>
				<td>姓名</td>
				<td>与户主关系</td>
				<td>身份证件</td>
				<td>性别</td>
				<td>户口性质</td>
				<td>出生日期</td>
				<td>文化程度</td>
				<td>在读情况</td>
				<td>从事农业劳动时间</td>
				<td>服兵役/劳改/劳教情况及时间起止段</td>
				<td>联系电话</td>
				<td>独生子女证件号</td>
				<td>是否半边户</td>
				<td>是否参加过社会保险</td>
				<td>备注</td>
			</tr>
		</thead>
		<tbody>
			{{#each items}}
			<tr>
				<td>{{name}}</td>
				<td>{{relationshipStr}}{{#if otherRelationship}}-{{otherRelationship}}{{/if}}</td>
				<td>{{idNumber}}</td>
				<td>{{genderStr}}</td>
				<td>{{householdStr}}</td>
				<td>{{birthday}}</td>
				<td>{{educationLevel}}</td>
				<td>{{currentEducationSituation}}</td>
				<td>{{farmingTime}}</td>
				<td>{{serveArmySituation}}</td>
				<td>{{tel}}</td>
				<td>{{onlyChildNumber}}</td>
				<td>{{#if half}}是{{else}}否{{/if}}</td>
				<td>{{#if userdSocialsecurity}}是{{else}}否{{/if}}</td>
				<td>{{remark}}</td>
			</tr>
			{{/each}}
		</tbody>
	</table>
</div>
</script>
<script id="errorItemTemplate" type="text/x-handlebars-template">
{{#each this}}
<li class="red">
	<span class="title">错误描述：{{msg}}</span>
	<span class="description truncate">错误行数：在文件的 {{rowIndex}} 行,第 {{colVal}} 列</span>
</li>
{{/each}}
</script>
<script id="familyItemTemplate" type="text/x-handlebars-template">
<div class="row" style="padding-top: 30px;">
	<div class="col-md-12 bk-vcenter">
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
            			<td><strong>{{#dengYu gender 0}}男{{else}}女{{/dengYu}}</strong></td>
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
            			<td colspan="2"><strong>{{remark}}</strong></td>
						<td>
							<a class="label label-warning" onclick="fimalyItem(this);">编辑</a>
							<a class="label label-default" onclick="deleteFimalyItem(this);">删除</a>
						</td>
            		</tr>
            	</tbody>
            </table>
        </div>
	</div>
</div>
</script>
<script id="fimalyItemEditTemplate" type="text/x-handlebars-template">
<div class="row">
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label">姓名<span class="text-danger">*</span></label>
			<input type="text" class="form-control" name="name" value="{{name}}" placeholder="请输入姓名" maxlength="15">
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
						<input type="text" class="form-control" value="{{otherRelationship}}"  name="otherRelationship" {{#dengYu relationshipStr '其他'}}{{else}}disabled{{/dengYu}} maxlength="10" />
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
						<option value="idNumber">身份证</option>
						<option value="otherNumber">其他证件</option>
					</select>
					<span class="input-group-btn" style="width:170px;">
						<input style="height: 32px;" type="text" name="idNumber" value="{{idNumber}}" class="form-control" placeholder="请输入证件号码" maxlength="20" {{#if certificateType}}{{else}}disabled{{/if}}>
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
			<div class="checkbox-custom form-control-static">
				<input type="checkbox" name="half" {{#if half}}checked{{/if}}> 
				<label>是否半边户</label>
			</div>
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group">
			<div class="checkbox-custom form-control-static">
				<input type="checkbox" name="userdSocialsecurity" {{#if userdSocialsecurity}}checked{{/if}}> 
				<label>是否参加过社会保险</label>
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
<script type="text/javascript" src="assets/pageJs/projectManagement/uploadRemoveInfo.js"></script>