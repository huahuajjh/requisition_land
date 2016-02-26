<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal-header">
	<h4 class="modal-title" id="myModalLabel">北站路扩征项目</h4>
</div>
<div class="modal-body">
	<table class="table table-bordered">
		<tbody>
			<tr>
				<td class="bk-bg-very-light-gray">姓名</td>
				<td>小明</td>
				<td class="bk-bg-very-light-gray">所属项目</td>
				<td>项目1</td>
			</tr>
			<tr>
				<td class="bk-bg-very-light-gray">身份证</td>
				<td>888888888888888888</td>
				<td class="bk-bg-very-light-gray">出生时间</td>
				<td>2011/11/11</td>
			</tr>
			<tr>
				<td class="bk-bg-very-light-gray">性别</td>
				<td>男</td>
				<td class="bk-bg-very-light-gray">户口性质</td>
				<td>农业户口</td>
			</tr>
			<tr>
				<td class="bk-bg-very-light-gray">独生子女证号</td>
				<td>20151</td>
				<td class="bk-bg-very-light-gray">是否半边户</td>
				<td>是</td>
			</tr>
		</tbody>
	</table>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-primary" data-dismiss="modal">关闭
	</button>
</div>