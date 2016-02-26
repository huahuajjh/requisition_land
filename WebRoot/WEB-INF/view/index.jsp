<%@ page language="java" import="java.util.*" pageEncoding="utf8" autoFlush="false" buffer="50kb"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<s:action name="leftAndTop" executeResult="true"></s:action> 
<div class="panel">
   <div class="panel-body">
       <div class="text-center" style="margin-top:30px;">
           <h3 class="bk-margin-off"><strong>你好Admin，欢迎使用征地补偿安置管理系统</strong></h3>
           <small>所属组织：征地办 &nbsp;&nbsp;&nbsp;&nbsp;部门：征地部 &nbsp;&nbsp;&nbsp;&nbsp;角色：管理员</small>
           <p class="bk-margin-off-bottom">
               上次登录时间：2011/11/11 11:11:11
           </p>
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
                        <th>拆迁人口总数</th>
                        <th>农业人口</th>
                        <th>非农业人口</th>
                        <th>独生子女</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>235</td>
                        <td>1,581,521</td>
                        <td>1,515</td>
                        <td>5,518</td>
                        <td>5,518</td>
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
                        <th>农业户口人员</th>
                        <th>城镇户口人员</th>
                        <th>独生子女</th>
                        <th>已转户</th>
                        <th>已纳入社保</th>
                        <th>已补贴金额（元）</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>200</td>
                        <td>1,581,521</td>
                        <td>1,515</td>
                        <td>5,518</td>
                        <td>5,518</td>
                        <td>5,518</td>
                        <td>5,518</td>
                        <td>5,518</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<s:include value="/WEB-INF/view/share/bottom.jsp"/>