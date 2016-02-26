<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<form class="panel" id="queryData">
	<div class="panel-heading bk-bg-primary">
		<h6>查询购房券</h6>
		<div class="panel-actions">
			<a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
		</div>
	</div>
	<div class="panel-body">
		<div class="row">
			<div class="col-md-6">
				<div class="form-group downImput">
					<label for="nf-email">持有人身份证</label>
					<input type="text" name="idNumber" id="idNumber" class="form-control" placeholder="请输入要查询的持有人身份证"  maxlength="20" autocomplete="OFF" />
					<ul class="dropdown-menu" id="idNumberQueryPrDown">
					</ul>
				</div>
			</div>
			<div class="col-md-6" style="display:none;">
				<div class="form-group">
					<label for="nf-password">购房券券号</label>
					<input type="text" name="quanNumber" class="form-control" placeholder="请输入要查询的购房券券号" maxlength="30" />
				</div>
			</div>
			<div class="col-md-12">
				<button type="submit" class="btn btn-primary" id="queryBtn">查询</button>
				<button type="button" class="btn btn-default" onclick="$('#selectPerson').modal('show');">选择人员</button>
			</div>
		</div>
	</div>
</form>

<form id="selectHPTList"></form>

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
<div class="modal fade" id="showProInfoModal">
  <div class="modal-dialog">
    <div class="modal-content" id="showProInfoArea">
    </div>
  </div>
</div>

<div class="modal fade" id="selectPerson">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">选择拆迁户人员</h4>
      </div>
      <div class="panel-body">
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label>镇(街道)</label>
						<select id="proStreet" class="form-control" size="1">
							<option value="">所有街道</option>
						</select>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label>村（社区）</label> <select id="proCommunity" class="form-control" size="1">
							<option value="">所有社区</option>
						</select>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label>组</label> <select id="proCommunity" class="form-control" size="1">
							<option value="">所有组</option>
						</select>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group downImput">
						<label for="nf-email">项目名称</label>
						<input type="text" id="queryPrName" maxlength="20" class="form-control" placeholder="请输入要查询的项目名称" autocomplete="off">
						<ul class="dropdown-menu" id="queryPrDown" style="display: none;"></ul>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group downImput">
						<label for="nf-email">户主名称</label>
						<input type="text" maxlength="5" class="form-control" placeholder="请输入要查询的户主名称">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group downImput">
						<label for="nf-email">人员名称</label>
						<input type="text" maxlength="5" class="form-control" placeholder="请输入要查询的户主名称">
					</div>
				</div>
				<div class="col-md-12 text-right">
					<input type="button" class="btn btn-primary" value="查询" onclick="tableData.goPage(1); " style="margin-top: 20px;">
				</div>
			</div>
			<hr>
			<table class="table table-striped table-bordered bootstrap-datatable datatable">
				<thead>
					<tr>
						<th>人员姓名</th>
						<th>所属项目</th>
						<th>身份证</th>
						<th>地址</th>
						<th>操作</th>
					</tr>
				</thead>   
				<tbody id="dataTbody">
				</tbody>
				<tfoot>
						<tr>
							<td colspan="5">
								<div class="bk-margin-5 btn-group pull-right" id="pageArea"><button type="button" class="btn btn-default disabled" jp-role="prev" jp-data="0"><i class="fa fa-angle-double-left"></i></button><button type="button" class="btn btn-default active" jp-role="page" jp-data="1">1</button><button type="button" class="btn btn-default disabled" jp-role="next" jp-data="2"><i class="fa fa-angle-double-right"></i></button></div>
							</td>
						</tr>
				</tfoot>
			</table>
		</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>

<script id="idNumberQueryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{idNumber}}</a></li>
</script>
<script id="entrytemplate" type="text/x-handlebars-template">
<div class="panel">
   <div class="panel-heading bk-bg-primary">
   	<div class="row">
   		<div class="col-xs-5 text-left bk-vcenter">
   			<h6>购房券换发</h6>
   		</div>
   	</div>
   </div>
   <div class="panel-body">
   	<div class="panel panel-default">
   			<div class="panel-heading">购房券信息</div>
   			<table class="table table-bordered">
   				<tbody>
   					<tr>
   						<td class="active">姓名</td>
   						<td>{{name}}</td>
   						<td class="active">身份证号</td>
   						<td>{{idNumber}}</td>
   					</tr>
   					<tr>
   						<td class="active">券号</td>
   						<td>{{ticketNumber}}</td>
   						<td class="active">补贴金额（万元）</td>
   						<td>{{bonus}}</td>
   					</tr>
   					<tr>
   						<td class="active">制券时间</td>
   						<td>{{makeTime}}</td>
   						<td class="active">购房券状态</td>
   						<td>{{ticketName}}</td>
   					</tr>
   					<tr>
   						<td class="active">所属项目</td>
   						<td colspan="3"><a href="javascript:;" class="text-primary" onclick="showProInfo('{{proId}}')">{{proName}}</a></td>
   					</tr>
   				</tbody>
   			</table>
   		</div>
   		<div class="row">
   		    <div class="col-md-4 col-md-offset-2">
   		        <div class="form-group">
   		            <label for="nf-email">新的购房券面额（万元）<span class="text-danger">*</span></label>
   		            <input type="text" name="quanNewMoney" class="form-control" placeholder="请输入新的购房券面额" maxlength="15">
   		        </div>
   		    </div>
   		    <div class="col-md-4">
   		        <div class="form-group">
   		            <label for="nf-email">新的购房券券号<span class="text-danger">*</span></label>
   		            <input type="text" name="quanNum" class="form-control" placeholder="请输入新的购房券券号" maxlength="30">
   		        </div>
   		    </div>
   		    <div class="col-md-4 col-md-offset-2">
   		        <div class="form-group">
   		            <label for="nf-email">领用人姓名<span class="text-danger">*</span></label>
   		            <input type="text" class="form-control" name="name" placeholder="请输入领用人姓名" maxlength="5">
   		        </div>
   		    </div>
   		    <div class="col-md-4" style="display:none;">
   		        <div class="form-group">
   		            <label for="nf-email">领用人身份证<span class="text-danger">*</span></label>
   		            <input type="text" class="form-control" name="idNumber" placeholder="请输入领用人身份证" maxlength="18">
   		        </div>
   		    </div>
			<div class="col-md-4">
   		        <div class="form-group">
   		            <label for="nf-email">购房券制券时间<span class="text-danger">*</span></label>
   		            <input type="text" class="form-control" name="zTime" placeholder="____/__/__" data-plugin-datepicker="" data-plugin-masked-input="" data-input-mask="9999/99/99">
   		        </div>
   		    </div>
   		    <div class="col-md-4 col-md-offset-2">
   		        <div class="form-group">
   		            <label for="nf-email">换发时间<span class="text-danger">*</span></label>
   		            <input type="text" class="form-control" name="time" placeholder="____/__/__" data-plugin-datepicker="" data-plugin-masked-input="" data-input-mask="9999/99/99">
   		        </div>
   		    </div>
   		    <div class="col-md-4">
   		        <div class="form-group">
   		            <label for="nf-email">领用凭证：</label>
   		            <div class="form-control-static">
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
				<hr>
			</div>
			<div class="col-md-10">
				<button type="submit" class="btn btn-primary button-next pull-right">保存</button>
			</div>
   		</div>
   		<br>
   </div>
</div>
</script>
<script type="text/javascript" src="assets/pageJs/housePurchaseMansgement/hptExchange.js"></script>