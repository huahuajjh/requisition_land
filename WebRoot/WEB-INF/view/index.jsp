<%@ page language="java" import="java.util.*" pageEncoding="utf8" autoFlush="false" buffer="50kb"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<s:action name="leftAndTop" executeResult="true"></s:action> 
<div id="showIndexData"></div>
<script id="indexTemplate" type="text/x-handlebars-template">
<div class="panel">
   <div class="panel-body">
       <div class="text-center" style="margin-top:30px;">
           <h3 class="bk-margin-off"><strong>你好<s:property value="userInfo.name" />，欢迎使用征地补偿安置管理系统</strong></h3>
           <small>所属组织：{{orgName}} &nbsp;&nbsp;&nbsp;&nbsp;部门：{{deptName}}</small>
       </div>
    </div>
</div>
<div class="panel">
    <div class="panel-heading bk-bg-primary">
        <h6>征地数据（征地办参考数据）</h6>
    </div>
    <div class="panel-body">
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>拆迁项目总数</th>
						<th>拆迁总面积</th>
						<th>拆迁总栋数</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>{{totalPros}}</td>
						<td>{{totalArea}}</td>
						<td>{{totalBuildings}}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="panel">
    <div class="panel-heading bk-bg-primary">
        <h6>拆迁数据</h6>
    </div>
    <div class="panel-body">
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>拆迁户数</th>
                        <th>拆迁总人数</th>
                        <th>独生子女</th>
                        <th>已转户</th>
                        <th>已纳入社保</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>{{removeFmls}}</td>
                        <td>{{totalRemovePopulation}}</td>
                        <td>{{onlyChildCount}}</td>
                        <td>{{transfered}}</td>
                        <td>{{socialsecurity}}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</script>
<s:include value="/WEB-INF/view/share/bottom.jsp"/>
<script type="text/javascript">
	$.getJSON(sendUrl.indexData_getIndexData,{
		id:getCookie("login")
	},function(data){
		data = actionFormate(data, false);
		var template = Handlebars.compile($("#indexTemplate").html());
		var html = template(data);
		$("#showIndexData").html(html);
	});
</script>