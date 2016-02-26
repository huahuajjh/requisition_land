<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<style type="text/css">
.menu{padding:10px;border:solid 1px #dfdfdf;background:#ffffff;font-size:11px;margin:0 auto;overflow:hidden;}
.menu > ul{padding-left: 0;}
.menu > ul > li > a{border: 1px solid #EBEBEB;background-color: #F6F6F4;text-decoration:none;cursor: pointer;}
.menu  ul  li {display: block;padding-top: 2px;margin-bottom: 5px;list-style: none;overflow: visible;}
.menu ul li a{display:block;height:44px; margin-top:0px;padding-top:10px;padding-left:10px;font-size:14px;color:#82846f;outline:none;}
.menu ul li .active{background:url(assets/img/on.png) top right no-repeat;}
.menu ul li .inactive{background:url(assets/img/off.png) top right no-repeat;}
.menu ul li ul{display:none; margin-top:-4px;margin-bottom:20px;padding-left: 20px;}
.menu ul li ul li ul{margin-bottom:5px;}
.menu ul li ul li{display:block;background:none;font-size:12px;list-style:circle;color:#8f9d4c;margin-bottom:0px;margin-top:0px;padding-top:0px;padding-bottom:0px;padding-left:1px;}
.menu ul li ul li a{background:none;font-size:12px;height:15px;color:#8f9d4c;padding-left:0px;height: 30px;text-decoration:none;cursor: pointer;}
ul.messages-list>li:not (:last-child ) {
	border-bottom: 1px solid #eee;
	border-radius: 0px;
	padding-bottom: 20px;
	margin-bottom: 20px;
}

ul.messages-list>li .header {
	font-size: 17px !important;
	padding-left: 27px;
}

ul.messages-list>li .title {
	padding-left: 40px;
}

ul.messages-list>li:not (:last-child ):hover {
	border-radius: 0px !important;
	padding-bottom: 20px !important;
	margin-bottom: 20px !important;
}
.menuTtitle {
	font-size: 15px;
	font-weight: 900;
	border-bottom: 1px solid gray;
	padding-bottom: 9px;
	text-indent: 5px;
}
.mailbox .message .header .from {
color: gray;
text-indent: 20px;
}
</style>
<div class="row mailbox">
    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
    	<div class="menu">
    		<h2 class="menuTtitle text-primary">政策法规</h2>
				<ul id="menuArea">
				</ul>
			</div>
    </div>
    <div class="col-lg-9 col-md-8 col-sm-8 col-xs-12">
        <div class="panel bk-bg-white">
            <div class="panel-body mailbox-btn-action">
                <div class="col-sm-8 col-xs-12 bk-padding-5">
                    <div class="form-group">
                        <label>查询档案文件</label>
                        <div class="input-group">
                            <input id="textTitle" placeholder="请输入搜索的档案文件" class="form-control" size="16" type="text" maxlength="20">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button" id="searchBtn">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="panel bk-bg-white">
            <div class="panel-body">
                <div class="col-md-12">
                    <div class="btn-group bk-margin-bottom-10 bk-margin-top-10 pull-right">
                        <span class="btn btn-sm btn-default">当前<span id="pageIndex">0</span>页，共有<span id="pageNum">0</span>页</span>
                        <button class="btn btn-sm btn-default" id="perBtn" onclick="perData();"><span class="fa fa-chevron-left"></span></button>
                        <button class="btn btn-sm btn-default" id="nextBtn" onclick="nextData();"><span class="fa fa-chevron-right"></span></button>
                    </div>
                </div>
            </div>
            <div class="panel-body">
                <div class="col-md-12">
                    <ul class="messages-list" id="infoList">
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="showMsgInfo">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
      	<div class="panel mailbox" style="margin-bottom: 0;">
           <div class="panel-body message mailbox-btn-action" id="infoArea">
           </div>
         </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>

<script id="listTemplate" type="text/x-handlebars-template">
<li>
    <a href="javascript:;" onclick="showListInfo(this);">
        <h1 class="header">
            <strong>{{title}}</strong>
        </h1>
        <div class="title">
            发布时间：{{createDate}}
        </div>
    </a>
</li>
</script>
<script id="listInfoTemplate" type="text/x-handlebars-template">
<div class="message-title" style="margin-top: 0;">{{title}}</div>
<div class="header">
    <div class="from">
        发布时间：{{createDate}}
    </div>
</div>
<div class="content">
    {{{article}}}
</div>
<div class="attachments">
    <ul>
		{{#each files}}
        <li class="col-xs-12">
            <b>{{fileName}}</b>
            <span class="quickMenu">
                <a href="{{fileVal}}" target="_blank" class="fa fa-cloud-download text-info">下载</a>
            </span>
        </li>
		{{/each}}
    </ul>
</div>
</script>
<script id="menuTemplate" type="text/x-handlebars-template">
<li>
	<a onclick="menuClick(this);"> {{title}}</a>
</li>
</script>
<script type="text/javascript" src="assets/js/menu_min.js"></script>
<script type="text/javascript" src="assets/pageJs/docFileManagement/fileMList.js"></script>