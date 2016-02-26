<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<style type="text/css">
.head-title {
	margin: 0px;
	padding: 0 !important;
}

.head-title:hover {
	background: none !important;
}

.head-title .title {
	font-size: 15px;
	font-weight: 900;
	border-bottom: 1px solid gray;
	padding-bottom: 9px;
	text-indent: 5px;
}

.mailbox .message .attachments ul li span.quickMenu .fa {
	color: #5bc0de;
}

.mailbox .message .header .from {
	color: gray;
	text-indent: 20px;
}
</style>
<div class="row mailbox">
	<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
		<div class="panel">
			<div class="panel-body bk-bg-very-light-gray mailbox-menu">
				<ul style="margin-top:0;">
					<li class="head-title">
						<h2 class="title text-primary">政策法规</h2>
					</li>
					<li class="active"><a href="#"><i
							class="fa fa-angle-right"></i> 长沙县政策法规</a></li>
					<li><a href="#"><i class="fa fa-angle-right"></i> 拆迁法律</a></li>
					<li><a href="#"><i class="fa fa-angle-right"></i> 拆迁政策</a></li>
					<li><a href="#"><i class="fa fa-angle-right"></i> 征地补偿</a></li>
					<li class="head-title">
						<h2 class="title text-primary">内部文件</h2>
					</li>
					<li><a href="#"><i class="fa fa-angle-right"></i> 规章制度</a></li>
					<li><a href="#"><i class="fa fa-angle-right"></i> 奖罚办法</a></li>
					<li><a href="#"><i class="fa fa-angle-right"></i> 绩效考核规定</a></li>
					<li><a href="#"><i class="fa fa-angle-right"></i> 文件模块</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="col-lg-9 col-md-8 col-sm-8 col-xs-12">
		<div class="panel bk-bg-white">
			<div class="panel-body message mailbox-btn-action">
				<div class="col-md-12">
					<div class="message-title">政策法规第一章</div>
					<div class="header">
						<div class="from">发布时间：2011/11/11
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发布人：Admin</div>
					</div>
					<div class="content">
						<p>
							政策法规就是党政机关制定的关于处理党内和政府事务工作的文件。一般包括中共中央、国务院及其部门制定的规定、办法、准则以及行业的规范、和条例规章等。
						</p>
						<blockquote>
							政策法规就是党政机关制定的关于处理党内和政府事务工作的文件。一般包括中共中央、国务院及其部门制定的规定、办法、准则以及行业的规范、和条例规章等。
						</blockquote>
					</div>
					<div class="attachments">
						<ul>
							<li class="col-xs-12"><span class="label label-danger">pdf</span>
								<b>File.pdf</b> <i>(5.3KB)</i> <span class="quickMenu"> <a
									href="#" class="fa fa-cloud-download"><i></i></a>
							</span></li>
							<li class="col-xs-12"><span class="label label-info">txt</span>
								<b>File.txt</b> <i>(7KB)</i> <span class="quickMenu"> <a
									href="#" class="fa fa-cloud-download"><i></i></a>
							</span></li>
							<li class="col-xs-12"><span class="label label-success">xls</span>
								<b>File.xls</b> <i>(984KB)</i> <span class="quickMenu"> <a
									href="#" class="fa fa-cloud-download"><i></i></a>
							</span></li>
							<li class="col-xs-12"><span class="label label-success">zip</span>
								<b>File.zip</b> <i>(1.25MB)</i> <span class="quickMenu">
									<a href="#" class="fa fa-cloud-download"><i></i></a>
							</span></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
