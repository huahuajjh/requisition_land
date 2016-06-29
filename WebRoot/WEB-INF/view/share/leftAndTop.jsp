<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="UTF-8" />
<meta name="renderer" content="webkit">
<title>征地拆迁信息管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="assets/plugins/bootkit/css/bootkit.css" rel="stylesheet">
<link href="assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
<link href="assets/css/style.css" rel="stylesheet" />
<link href="assets/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" />
<link href="assets/plugins/bootstrap-datepicker/css/datepicker-theme.css" rel="stylesheet" />
<link href="assets/plugins/bootstrap-timepicker/css/bootstrap-timepicker.css" rel="stylesheet" />
<link href="assets/plugins/JBox/jBox.css" rel="stylesheet" />
<link href="assets/plugins/JBox/themes/NoticeBorder.css" rel="stylesheet" />
<link href="assets/plugins/zoom/css/zoom.css" rel="stylesheet" />
<link href="assets/css/add-ons.min.css" rel="stylesheet" />
<link href="assets/plugins/summernote/css/summernote.css" rel="stylesheet" />
<link href="assets/plugins/mSelect/mSelect.css" rel="stylesheet" />
<link href="assets/plugins/bootstrap-tagsinput/css/bootstrap-tagsinput.css" rel="stylesheet" />
<script src="assets/plugins/modernizr/js/modernizr.js"></script>
<!--[if lt IE 9]>
        <script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
        <script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.js"></script>
    <![endif]-->
<link rel="shortcut icon" href="assets/ico/favicon.ico" type="image/x-icon" />
<link rel="apple-touch-icon" href="assets/ico/apple-touch-icon.png" />
<link rel="apple-touch-icon" sizes="57x57" href="assets/ico/apple-touch-icon-57x57.png" />
<link rel="apple-touch-icon" sizes="72x72" href="assets/ico/apple-touch-icon-72x72.png" />
<link rel="apple-touch-icon" sizes="76x76" href="assets/ico/apple-touch-icon-76x76.png" />
<link rel="apple-touch-icon" sizes="114x114" href="assets/ico/apple-touch-icon-114x114.png" />
<link rel="apple-touch-icon" sizes="120x120" href="assets/ico/apple-touch-icon-120x120.png" />
<link rel="apple-touch-icon" sizes="144x144" href="assets/ico/apple-touch-icon-144x144.png" />
<link rel="apple-touch-icon" sizes="152x152" href="assets/ico/apple-touch-icon-152x152.png" />
</head>
<body onhashchange="pageChange()">
	<div class="navbar" role="navigation">
		<div class="container-fluid container-nav">
			<ul class="nav navbar-nav navbar-actions navbar-left">
				<li class="visible-md visible-lg visible-xs visible-sm">
					<a href="javascript:;" id="main-menu-toggle">
						<i class="fa fa-th-large"></i>
					</a>
				</li>
			</ul>
			<div class="navbar-left">
				<!--一键查询-->
				<!--<form class="search navbar-form">
				<div class="input-group input-search">
					<input type="text" class="form-control"
						placeholder="一键查询 | 请输入身份证号" /> <span class="input-group-btn">
						<button data-toggle="modal" data-target="#onekeyModal"
							type="button" class="btn btn-default">
							<i class="fa fa-search"></i>
						</button>
					</span>
				</div>
			</form>-->
				<!--一键查询-->
				<ul class="nav nav-pills">
				  <li role="presentation"><a href="index.do">主页</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="container-fluid content">
		<div class="row">
			<div class="sidebar">
				<div class="sidebar-collapse">
					<div class="sidebar-header">征地拆迁信息管理系统</div>
					<div class="sidebar-menu">
						<nav id="menu" class="nav-main" role="navigation">
							<ul class="nav nav-sidebar" id="menuLeftArea">
								<div class="panel-body text-center">
									<div class="bk-avatar">
										<img
											src="assets/img/hand.jpg"
											class="img-circle bk-img-60" alt="" />
									</div>
									<div class="bk-padding-top-10">
										<i class="fa fa-circle text-success"></i> <small><s:property value="userInfo.name" /></small><br><br>
										<div class="btn-group">
											<a href="javascript:;" onclick="$('#editUserPassword').modal('show');" class="btn btn-primary btn-xs">修改密码</a>
											<a href="login.jsp" class="btn btn-primary btn-xs">安全退出</a>
										</div>
									</div>
								</div>
								<div class="divider2"></div>
							</ul>
						</nav>
					</div>
				</div>
			</div>
			<div class="main">