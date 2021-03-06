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
					<label for="nf-email">持有人身份证件</label>
					<input type="text" name="idNumber" id="idNumber" class="form-control" placeholder="请输入要查询的持有人身份证件"  maxlength="20" autocomplete="OFF" />
					<ul class="dropdown-menu" id="idNumberQueryPrDown">
					</ul>
				</div>
			</div>
			<div class="col-md-12">
				<button type="submit" class="btn btn-primary" id="queryBtn">查询</button>
				<button type="button" class="btn btn-default" onclick="$('#selectPerson').modal('show');">选择人员</button>
			</div>
		</div>
	</div>
</form>

<form id="showQueryDataArea" onsubmit="return false;"></form>

<form class="modal fade" id="operationModal" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">购房券操作</h4>
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

<div class="modal fade" id="showProInfoModal">
  <div class="modal-dialog">
    <div class="modal-content" id="showProInfoArea">
    </div>
  </div>
</div>

<div class="modal fade" id="selectPerson">
  <div class="modal-dialog">
    <div class="modal-content">
    </div>
  </div>
</div>

<script id="logBQItemTemplate" type="text/x-handlebars-template">
<table>
	<tr>
		<td class="text-right">姓名：</td>
		<td>{{resideName}}</td>
	</tr>
	<tr>
		<td class="text-right">身份证件号：</td>
		<td>{{resideIdNumber}}</td>
	</tr>
	<tr>
		<td class="text-right">券号：</td>
		<td>{{ticketNumber}}</td>
	</tr>
	<tr>
		<td class="text-right">补贴金额（万元）：</td>
		<td>{{bonus}}</td>
	</tr>
	<tr>
		<td class="text-right">制券时间：</td>
		<td>{{makeTime}}</td>
	</tr>
	<tr>
		<td class="text-right">新的购房券券号：</td>
		<td>{{newTicketNumber}}</td>
	</tr>
	<tr>
		<td class="text-right">新的购房券金额（万元）：</td>
		<td>{{newBonus}}</td>
	</tr>
	<tr>
		<td class="text-right">新的购房券制券时间：</td>
		<td>{{newMakeTime}}</td>
	</tr>
	<tr>
		<td class="text-right">购房券补失时间：</td>
		<td>{{mendDate}}</td>
	</tr>
</table>
</script>
<script id="logGSItemTemplate" type="text/x-handlebars-template">
<table>
	<tr>
		<td class="text-right">姓名：</td>
		<td>{{resideName}}</td>
	</tr>
	<tr>
		<td class="text-right">身份证件号：</td>
		<td>{{resideIdNumber}}</td>
	</tr>
	<tr>
		<td class="text-right">券号：</td>
		<td>{{ticketNumber}}</td>
	</tr>
	<tr>
		<td class="text-right">补贴金额（万元）：</td>
		<td>{{bonus}}</td>
	</tr>
	<tr>
		<td class="text-right">制券时间：</td>
		<td>{{makeTime}}</td>
	</tr>
	<tr>
		<td class="text-right">挂失时间：</td>
		<td>{{reportOfLossDate}}</td>
	</tr>
	<tr>
		<td class="text-right">挂失备注信息：</td>
		<td>{{remark}}</td>
	</tr>
</table>
</script>
<script id="idNumberQueryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{idNumber}}-{{name}}</a></li>
</script>
<script id="tableItemTemplate" type="text/x-handlebars-template">
<div class="panel">
   <div class="panel-heading bk-bg-primary">
   	<div class="row">
   		<div class="col-xs-5 text-left bk-vcenter">
   			<h6>购房券挂失/补券</h6>
   		</div>
   	</div>
   </div>
   <div class="panel-body">
		<div class="table-responsive">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>姓名</th>
						<th>身份证件</th>
						<th>补贴金额（万元）</th>
						<th>购房券券号</th>
						<th>购房券状态</th>
						<th>购房券操作</th>
					</tr>
				</thead>
				<tbody id="dataItems">
				</tbody>
			</table>
		</div>
   </div>
</div>
</script>
<script id="dataItemTemplate" type="text/x-handlebars-template">
<tr>
	<td>{{name}}</td>
	<td>{{idNumber}}</td>
	<td>{{bonus}}</td>
	<td>{{ticketNumber}}</td>
	<td>{{ticketName}}</td>
	<td>
		{{#dengYu ticketState "RECEIVED"}}
			<a href="javascript:;" class="label label-primary" onclick="guaShi(this);">挂失</a>
		{{/dengYu}}
		{{#dengYu ticketState "LOSSOFREPORT"}}
			<a href="javascript:;" class="label label-primary" onclick="buShi(this);">补券</a>
		{{/dengYu}}
	</td>
</tr>
</script>
<script id="guaShiTemplate" type="text/x-handlebars-template">
<div class="panel panel-default">
    <div class="panel-heading">购房券信息</div>
    <table class="table table-bordered">
    	<tbody>
    		<tr>
    			<td class="active">姓名</td>
    			<td>{{name}}</td>
    			<td class="active">身份证件号</td>
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
    			<td colspan="3">
					<a href="javascript:;" class="text-primary" onclick="showProInfo('{{proId}}')">{{proName}}</a>
				</td>
    		</tr>
    	</tbody>
    </table>
</div>
<div class="form-group">
	<label class="control-label" for="text-input">挂失时间<span class="text-danger">*</span></label>
		<input type="text" name="time" class="form-control" placeholder="____/__/__"
			data-plugin-datepicker data-plugin-masked-input data-input-mask="9999/99/99" />
</div>
<div class="form-group">
	<label class="control-label" for="text-input">挂失备注信息<span class="text-danger">*</span></label>
	<textarea name="remark"  placeholder="请输入挂失描述" class="form-control" rows="5" maxlength="140"></textarea>
</div>
</script>
<script id="buShiTemplate" type="text/x-handlebars-template">
  <div class="panel panel-default">
      <div class="panel-heading">购房券信息</div>
      <table class="table table-bordered">
      	<tbody>
      		<tr>
      			<td class="active">姓名</td>
      			<td>{{name}}</td>
      			<td class="active">身份证件号</td>
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
      				<td colspan="3">
							<a href="javascript:;" class="text-primary" onclick="showProInfo('{{proId}}')">{{proName}}</a>
						</td>
      		</tr>
      	</tbody>
      </table>
  </div>
  <div class="form-group">
  	<label class="control-label" for="text-input">购房券券号<span class="text-danger">*</span></label>
  		<input type="text" name="quanNum" class="form-control" placeholder="请输入购房券券号" />
  </div>
  <div class="form-group">
  	<label class="control-label" for="text-input">购房券金额（万元）<span class="text-danger">*</span></label>
  		<input type="text" class="form-control" name="money" placeholder="请输入购房券金额（万元）" >
  </div>
  <div class="form-group">
  	<label class="control-label" for="text-input">购房券制券时间<span class="text-danger">*</span></label>
  		<input type="text" name="time" class="form-control" placeholder="____/__/__"
  			 data-plugin-datepicker data-plugin-masked-input data-input-mask="9999/99/99" >
  </div>
  <div class="form-group">
  	<label class="control-label" for="text-input">购房券补失时间<span class="text-danger">*</span></label>
  		<input type="text" class="form-control" name="buShiTime" placeholder="____/__/__"
  			 data-plugin-datepicker data-plugin-masked-input data-input-mask="9999/99/99" >
  </div>
</div>
</script>
<script type="text/javascript" src="assets/pageJs/housePurchaseMansgement/hptLossAndMend.js"></script>