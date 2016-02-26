<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal-header">
	<h4 class="modal-title" id="myModalLabel"><s:property value="proName"/></h4>
</div>
<div class="modal-body">
	<table class="table table-bordered">
		<tbody>
			<tr>
				<td class="bk-bg-very-light-gray">项目名称</td>
				<td><s:property value="proName"/></td>
				<td class="bk-bg-very-light-gray">审批号</td>
				<td><s:property value="approvalNumber"/></td>
			</tr>
			<tr>
				<td class="bk-bg-very-light-gray">项目地址</td>
				<td><s:property value="address"/></td>
				<td class="bk-bg-very-light-gray">项目类型</td>
				<td><s:property value="proType"/></td>
			</tr>
			<tr>
				<td class="bk-bg-very-light-gray">项目启动时间</td>
				<td><s:property value="startDate"/></td>
				<td class="bk-bg-very-light-gray">项目进度</td>
				<td><s:property value="announceName"/></td>
			</tr>
		</tbody>
	</table>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-primary" data-dismiss="modal">关闭
	</button>
</div>