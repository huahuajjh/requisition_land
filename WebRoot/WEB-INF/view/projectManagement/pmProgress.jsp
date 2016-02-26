<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6>查询项目</h6>
		<div class="panel-actions">
			<a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
		</div>
	</div>
	<div class="panel-body">
		<form onsubmit="return false;">
			<div class="row">
				<div class="col-md-3">
					<div class="form-group downImput">
						<label for="nf-email">项目名称</label>
						<input type="text" id="queryPrName" maxlength="20" class="form-control" placeholder="请输入要查询的项目名称" />
						<ul class="dropdown-menu" id="queryPrDown">
						</ul>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label for="nf-password">项目类型</label> <select name="select"
							id="queryProType" class="form-control" size="1">
							<option value="0">所有项目类型</option>
							<s:iterator id="dto" value="proTypeDtos">
								<option value="<s:property value='#dto.getCode()' />">
								<s:property value='#dto.getName()' />
								</option>
							</s:iterator>
						</select>
					</div>
				</div>
				<div class="col-md-2">
					<div class="form-group">
						<label for="nf-password">项目进度</label> <select name="select"
							id="queryPrJD" class="form-control" size="1">
							<option value="0">所有进度</option>
							<option value="1">一公告</option>
							<option value="2">二公告</option>
							<option value="3">三公共</option>
						</select>
					</div>
				</div>
				<div class="col-md-2">
					<div class="form-group">
						<label for="nf-password">镇(街道)</label> <select id="street"
							name="select" class="form-control" size="1">
							<option value="">所有街道</option>
							<s:iterator id="dto" value="addressDtos">
								<option value="<s:property value='#dto.getId()' />">
									<s:property value='#dto.getName()' />
								</option>
							</s:iterator>
						</select>
					</div>
				</div>
				<div class="col-md-2">
					<div class="form-group">
						<label for="nf-password">村（社区）</label> <select id="community"
							name="select" class="form-control" size="1">
							<option value="">所有社区</option>
						</select>
					</div>
				</div>
				<div class="col-md-12">
				<hr>
				<button type="submit" class="btn btn-primary pull-right" 
						onclick="tableData.goPage(1); " >查询</button>
				<button type="button" class="btn btn-default pull-right" 
						onclick="$('#selectExportModal').modal('show');">导出选中的项目月台账</button>
				</div>
			</div>
		</form>
	</div>
</div>

<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<div class="row">
			<div class="col-xs-5 text-left bk-vcenter">
				<h6>项目台账</h6>
			</div>
			<div class="col-xs-7 bk-vcenter text-right">
				每页显示<select class="select_top" id="dataPageCount">
					<option value="10">10</option>
					<option value="20">20</option>
					<option selected value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
				</select>条数据,总共有<span id="countArea">0</span>个项目。
			</div>
		</div>
	</div>
	<div class="panel-body">
		<div class="table-responsive">
			<table
				class="table table-striped table-bordered bootstrap-datatable datatable">
				<thead>
					<tr>
						<th>
							<div class="checkbox-custom">
								<input type="checkbox" id="checkAllPro"><label> 全选</label>
							</div>
						</th>
						<th>项目名称</th>
						<th>项目类型</th>
						<th>项目进度</th>
						<th>应征面积(亩)</th>
						<th>应拆栋数</th>
						<th>应拆户数</th>
						<th>项目地址</th>
						<th style="width: 274px;">操作</th>
					</tr>
				</thead>
				<tbody id="dataTbody">
				</tbody>
				<tfoot>
					<tr>
						<td colspan="10">
							<div class="pull-left">
								<button type="button" class="bk-margin-5 btn btn-default btn-sm" onclick="daYin(this);">打印选中的项目月台账</button>
							</div>
							<div class="bk-margin-5 btn-group pull-right" id="pageArea">
								<button type="button" class="btn btn-primary btn-sm">1</button>
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</div>

<div class="modal fade" id="showYueBaoModal">
	<div class="modal-dialog" style="width:1200px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title bk-fg-primary">项目月报详细信息</h4>
			</div>
			<div class="modal-body">
				<div class="panel panel-default">
					<div class="panel-body">
						<h4 class="ui header text-center text-primary">
							<strong id="proInfoName"></strong>
						</h4>
						<div class="row text-center">
							<div class="col-xs-3 bk-bg-white bk-bg-lighten bk-padding-top-20 bk-padding-bottom-20">
								<small>审批号</small>
								<h5 class="bk-margin-off-bottom">
									<strong id="proInfoNum"></strong>
								</h5>
							</div>
							<div class="col-xs-3 bk-bg-white bk-bg-lighten bk-padding-top-20 bk-padding-bottom-20">
								<small>项目地址</small>
								<h5 class="bk-margin-off-bottom">
									<strong id="proInfoAddress"></strong>
								</h5>
							</div>
							<div class="col-xs-3 bk-bg-white bk-bg-lighten bk-padding-top-20 bk-padding-bottom-20">
								<small>项目类型</small>
								<h5 class="bk-margin-off-bottom">
									<strong id="proInfoType"></strong>
								</h5>
							</div>
							<div class="col-xs-3 bk-bg-white bk-bg-lighten bk-padding-top-20 bk-padding-bottom-20">
								<small>项目进度</small>
								<h5 class="bk-margin-off-bottom">
									<strong id="announceName"></strong>
								</h5>
							</div>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h6>项目每月台账详细信息</h6>
					</div>
					<table class="table table-striped table-bordered bootstrap-datatable datatable">
						<thead>
							<tr>
								<th>月份</th>
								<th>已腾地数(亩)</th>
								<th>已拆栋数</th>
								<th>已迁户数</th>
								<th>已拆合法面积<br>(平方米)</th>
								<th>已拆违章面积<br>(平方米)</th>
								<th>已动迁人口</th>
								<th>已付赔偿款<br>(万元)</th>
								<th>下达限期腾地决定书</th>
								<th>申请法院执行</th>
								<th>依法实施强制腾地户数</th>
							</tr>
						</thead>
						<tbody id="showProMonthProces">
						</tbody>
						<tfoot id="yurBaoHejiArea">
						</tfoot>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>

<form class="modal fade form-horizontal" id="yueBaoAddModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">录入项目月报信息</h4>
			</div>
			<input type="hidden" name="proId" id="addMonthProcesId">
			<div class="modal-body">
				<h4 class="ui header text-center text-primary">
					<strong id="addMonthProName"></strong>
				</h4>
				<hr>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label" for="text-input">选择录入的所属年/月<span class="text-danger">*</span></label>
							<div class="input-daterange input-group">
								<select id="proYBYear" class="form-control" name="year"></select>
								<span class="input-group-addon"> 年 </span>
								<select id="proYBy" class="form-control" name="month">
									<option value="01">1</option>
									<option value="02">2</option>
									<option value="03">3</option>
									<option value="04">4</option>
									<option value="05">5</option>
									<option value="06">6</option>
									<option value="07">7</option>
									<option value="08">8</option>
									<option value="09">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
								</select>
								<span class="input-group-addon">月</span>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label" >已拆除栋数<span class="text-danger">*</span></label>
							<input type="text" maxlength="10" id="removedBuildings" name="removedBuildings" class="form-control" placeholder="请输入拆除栋数" value="">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label" >已腾地数（亩）<span class="text-danger">*</span></label>
							<input type="text" maxlength="10" id="removedLandArea" name="removedLandArea" class="form-control" placeholder="请输入腾地数" value="">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label" >已拆除户数<span class="text-danger">*</span></label> <input
								type="text" maxlength="10" id="rmovedHouses" name="rmovedHouses" class="form-control" placeholder="请输入除户数" value="">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label" >已拆除面积（合法）（平方米）<span class="text-danger">*</span></label>
							<input type="text" maxlength="10" id="removedLegalArea" name="removedLegalArea" class="form-control" placeholder="请输入拆除面积（合法）" value="">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label" >已拆除面积（违章）（平方米）<span class="text-danger">*</span></label>
							<input type="text" maxlength="10" id="removedIllegalArea" name="removedIllegalArea" class="form-control" placeholder="请输入拆除面积（违章）" value="">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label" >已动迁的人口<span class="text-danger">*</span></label> <input
								type="text" maxlength="10" id="movedPopulation" name="movedPopulation" class="form-control" placeholder="请输入动迁的人口" value="">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label" >已付补偿款（万元）<span class="text-danger">*</span></label>
							<input type="text" maxlength="15" id="paidMoney" name="paidMoney" class="form-control" placeholder="请输入所付补偿款" value="">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label">已下达期限腾地决定书<span class="text-danger">*</span></label> <input
								type="text" maxlength="10" name="yearDeadlineFile" class="form-control" placeholder="请输入下达期限腾地决定书"
								value="">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label">已申请法院执行数<span class="text-danger">*</span></label> <input
								type="text" maxlength="10" name="yearCourtExecute" class="form-control" placeholder="请输入下达期限腾地决定书数"
								value="">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label">已发实施强制户数<span class="text-danger">*</span></label> <input type="text"
								class="form-control" maxlength="10" name="yearLegalRemoved" placeholder="请输入申请法院执行数" value="">
						</div>
					</div>
					<div class="col-md-6" id="isSee">
						<div class="form-group">
							<label class="control-label">启动时间<span class="text-danger">*</span></label></label>
							<input type="text" id="monthStartTime" name="startDate" class="form-control" placeholder="____/__/__" data-plugin-datepicker="" data-plugin-datepicker-nottoday="" data-plugin-masked-input="" data-input-mask="9999/99/99">
						</div>
					</div>
					<div class="col-md-6 col-md-offset-6">
						<div class="form-group">
							<div class="form-control-static">
								<div class="checkbox-custom">
									<input type="checkbox"  name="isBenYueJieSuan" value="true"> 
									<label>是否为本月完成结算项目</label>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="submit" class="btn btn-primary">保存</button>
			</div>
		</div>
	</div>
</form>

<div class="modal fade form-horizontal" id="announceAddInfoModal" >
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">添加公告</h4>
			</div>
			<div class="modal-body">
				<h4 class="ui header text-center text-primary">
					<strong id="addAnnouncementNmae"></strong>
				</h4>
				<div id="addAnnounce">
					<div class="tab-head bk-margin-5 btn-group btn-group-justified">
						<button type="button"  toggle="#announce0"
							class="btn btn-default pull-left" style="width: 33.3%">
							一公告</button>
						<button type="button" toggle="#announce1" class="btn btn-default pull-left"
							style="width: 33.3%">二公告</button>
						<button type="button"  toggle="#announce2" class="btn btn-default pull-left"
							style="width: 33.3%">三公告</button>
					</div>
					<div class="tab-content" style="margin-top: 20px;" id="addAnnouncementContent">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="announceInfoModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title bk-fg-primary">项目公告详细信息</h4>
			</div>
			<div class="modal-body">
				<h4 class="ui header text-center text-primary">
					<strong id="announceInfoName"></strong>
				</h4>
				<div class="table-responsive" style="margin:40px 30px;">
					<table
						class="table table-striped table-bordered bootstrap-datatable datatable">
						<thead>
							<tr>
								<th>公告类型</th>
								<th>公告文号</th>
								<th>公告时间</th>
								<th>公告批文</th>
							</tr>
						</thead>
						<tbody id="announceShowArea">
						</tbody>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
		</div>
	</div>
</div>
<iframe id="daYin" src="template.html" style="display: none;"></iframe>
<div class="modal fade" id="yueBaoModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">管理月报</h4>
      </div>
      <div class="modal-body">
        <h4 class="ui header text-center text-primary">
			<strong id="announceInfoName"></strong>
		</h4>
		<table class="table table-bordered">
		  <thead>
			  <tr>
				  <th>所处时间</th>
				  <th>操作</th>                                       
			  </tr>
		  </thead>   
		  <tbody id="yueBaoListMsgArea">						                                  
		  </tbody>
	</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>
<form class="modal fade" id="editYueBaoModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">修改月报</h4>
      </div>
      <div class="modal-body" id="editYueBaoArea">
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn btn-primary">保存</button>
      </div>
    </div>
  </div>
</form>

<div class="modal fade" id="selectExportModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">导出需要的数据</h4>
      </div>
      <div class="modal-body">
      	<div class="row">
      		<div class="col-md-12">
      			<h4 class="bk-padding-top-10bk-docs-font-weight-300">导出的月份</h4>
      		</div>
      		<div class="col-md-4">
      			导出<select id="daYinYear"></select>年
      			<select id="daYinMouth">
					<option value="01">1</option>
					<option value="02">2</option>
					<option value="03">3</option>
					<option value="04">4</option>
					<option value="05">5</option>
					<option value="06">6</option>
					<option value="07">7</option>
					<option value="08">8</option>
					<option value="09">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select>月的台账 
      		</div>
      		<div class="col-md-12">
      			<h4 class="bk-padding-top-10bk-docs-font-weight-300">项目基本信息</h4>
      		</div>
      		<div class="col-md-4" style="height: 30px;">
      			<div class="checkbox-custom checkbox-inline">
					<input type="checkbox" checked value="0" name="colIndex"> 
					<label>序号</label>
				</div>
      		</div>
      		<div class="col-md-4" style="height: 30px;">
      			<div class="checkbox-custom checkbox-inline">
					<input type="checkbox" checked value="1" name="colIndex"> 
					<label>在拆项目名称</label>
				</div>
      		</div>
      		<div class="col-md-4" style="height: 30px;">
      			<div class="checkbox-custom checkbox-inline">
					<input type="checkbox" checked value="2" name="colIndex"> 
					<label>审批单号</label>
				</div>
      		</div>
      		<div class="col-md-4" style="height: 30px;">
      			<div class="checkbox-custom checkbox-inline">
					<input type="checkbox" checked value="3" name="colIndex"> 
					<label>项目分类</label>
				</div>
      		</div>
      		<div class="col-md-4" style="height: 30px;">
      			<div class="checkbox-custom checkbox-inline">
					<input type="checkbox" checked value="4" name="colIndex"> 
					<label>项目类型</label>
				</div>
      		</div>
      		<div class="col-md-4" style="height: 30px;">
      			<div class="checkbox-custom checkbox-inline">
					<input type="checkbox" checked value="5" name="colIndex"> 
					<label>本月新启动项目</label>
				</div>
      		</div>
      		<div class="col-md-4" style="height: 30px;">
      			<div class="checkbox-custom checkbox-inline">
					<input type="checkbox" checked value="6" name="colIndex"> 
					<label>是否为本月完成结算项目</label>
				</div>
      		</div>
      		<div class="col-md-4" style="height: 30px;">
      			<div class="checkbox-custom checkbox-inline">
					<input type="checkbox" checked value="7" name="colIndex"> 
					<label>用地位置</label>
				</div>
      		</div>
      		<div class="col-md-4" style="height: 30px;">
      			<div class="checkbox-custom checkbox-inline">
					<input type="checkbox" checked value="8" name="colIndex"> 
					<label>一公告</label>
				</div>
      		</div>
      		<div class="col-md-4" style="height: 30px;">
      			<div class="checkbox-custom checkbox-inline">
					<input type="checkbox" checked value="9" name="colIndex"> 
					<label>二公告</label>
				</div>
      		</div>
      		<div class="col-md-4" style="height: 30px;">
      			<div class="checkbox-custom checkbox-inline">
					<input type="checkbox" checked value="10" name="colIndex"> 
					<label>三公告</label>
				</div>
      		</div>
      		<div class="col-md-4" style="height: 30px;">
      			<div class="checkbox-custom checkbox-inline">
					<input type="checkbox" checked value="11" name="colIndex"> 
					<label>腾地情况</label>
				</div>
      		</div>
      		<div class="col-md-4" style="height: 30px;">
      			<div class="checkbox-custom checkbox-inline">
					<input type="checkbox" checked value="12" name="colIndex"> 
					<label>拆除房屋情况</label>
				</div>
      		</div>
      		<div class="col-md-4" style="height: 30px;">
      			<div class="checkbox-custom checkbox-inline">
					<input type="checkbox" checked value="13" name="colIndex"> 
					<label>拆迁安置人口情况</label>
				</div>
      		</div>
      		<div class="col-md-4" style="height: 30px;">
      			<div class="checkbox-custom checkbox-inline">
					<input type="checkbox" checked value="14" name="colIndex"> 
					<label>本年下达限期腾地决定书</label>
				</div>
      		</div>
      		<div class="col-md-4" style="height: 30px;">
      			<div class="checkbox-custom checkbox-inline">
					<input type="checkbox" checked value="15" name="colIndex"> 
					<label>本年申请法院执行</label>
				</div>
      		</div>
      		<div class="col-md-4" style="height: 30px;">
      			<div class="checkbox-custom checkbox-inline">
					<input type="checkbox" checked value="16" name="colIndex"> 
					<label>本年依法实施强制腾地户数</label>
				</div>
      		</div>
      		<div class="col-md-4" style="height: 30px;">
      			<div class="checkbox-custom checkbox-inline">
					<input type="checkbox" checked value="17" name="colIndex"> 
					<label>六前项目</label>
				</div>
      		</div>	
      		<div class="col-md-4" style="height: 30px;">
      			<div class="checkbox-custom checkbox-inline">
					<input type="checkbox" checked value="18" name="colIndex"> 
					<label>备注</label>
				</div>
      		</div>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" onclick="daoChu();">导出</button>
      </div>
    </div>
  </div>
</div>

<form id="subDaoChu" action="projectManagement/pmProgressDaoChu" method="post" target="list" style="display:none;">
	<iframe name="list"></iframe>
	<input type="hidden" name="daYinDate" id="daYinDate">
	<input type="hidden" name="daoChuAttrModel" id="daoChuAttrModel">
	<input type="hidden" name="daoChuHead" id="daoChuHead">
 </form>

<script id="daYinProYueBaoTemplate" type="text/x-handlebars-template">
<table class="table table-bordered">
	<tbody>
		<tr>
			<td>项目名称 ： <strong>{{proName}}</strong></td>
			<td>项目启动时间：<strong>{{startDate}}</strong></td>
			<th>项目地址：<strong>{{totalAddress}}</strong></th>
		</tr>
		<tr>
			<th>项目类型：<strong>{{proTypeStr}}</strong></th>
			<th>征地面积(亩)：<strong>{{requisitionArea}}</strong></th>
			<th>应拆栋数：<strong>{{shouldRemoveBuildings}}</strong></th>
		</tr>
		<tr>
			<th>应拆户数：<strong>{{shouldRemoveHouses}}</strong></th>
			<th>应拆面积（合法）(平方米)：<strong>{{shouldRemoveLegalArea}}</strong></th>
			<th>应拆面积（违章）(平方米)：<strong>{{shouldRemoveIllegalArea}}</strong></th>
		</tr>
		<tr>
			<th>应动迁人口：<strong>{{shouldMovePopulation}}</strong></th>
			<th>应付补偿款：<strong>{{shouldPayMoney}}</strong></th>
		</tr>
		{{#if announcements}}
		{{#each announcements}}
		<tr>
			<td>{{sequenceStr}}</td>
			<td>时间：<strong>{{date}}</strong></td>
			<td>文号：<strong>{{number}}</strong></td>
		</tr>
		{{/each}}
		{{/if}}
		<tr>
			<td colspan="3" style="padding: 0">
				<table>
					<thead>
						<th>月份</th>
						<th>已腾地数(亩)</th>
						<th>已拆栋数</th>
						<th>已迁户数</th>
						<th>已拆合法面积<br>(平方米)</th>
						<th>已拆违章面积<br>(平方米)</th>
						<th>已动迁人口</th>
						<th>已付赔偿款<br>(万元)</th>
						<th>下达限期腾地决定书</th>
						<th>申请法院执行</th>
						<th>依法实施强制腾地户数</th>
					</thead>
					<tbody>
					{{#each items}}
					<tr>
        				<td>{{this.date}}</td>
        				<td>{{this.removedLandArea}}</td>
        				<td>{{this.removedBuildings}}</td>
        				<td>{{this.rmovedHouses}}</td>
        				<td>{{this.removedLegalArea}}</td>
        				<td>{{this.removedIllegalArea}}</td>
        				<td>{{this.movedPopulation}}</td>
        				<td>{{this.paidMoney}}</td>
        				<td>{{this.yearDeadlineFile}}</td>
        				<td>{{this.yearCourtExecute}}</td>
						<td>{{this.yearLegalRemoved}}</td>
    				</tr>
					{{/each}}
					</tbody>
					<tfoot>
                        <tr class="text-primary">
                        	<th>合计</th>
                            <td>{{this.countModel.removedLandArea}}</td>
                            <td>{{this.countModel.removedBuildings}}</td>
                            <td>{{this.countModel.rmovedHouses}}</td>
                            <td>{{this.countModel.removedLegalArea}}</td>
                            <td>{{this.countModel.removedIllegalArea}}</td>
                            <td>{{this.countModel.movedPopulation}}</td>
                            <td>{{this.countModel.paidMoney}}</td>
                            <td>{{this.countModel.yearDeadlineFile}}</td>
                            <td>{{this.countModel.yearCourtExecute}}</td>
                        	<td>{{this.countModel.yearLegalRemoved}}</td>
                        </tr>
					</tfoot>
				</table>
			</td>
		</tr>
	</tbody>
</table>
</script>
<script id="yueBaoListTemplate" type="text/x-handlebars-template">
<tr>
	<td>{{date}}</td>
	<td>
		<a class="label label-primary" onclick="editYueBaoManage(this);">修改</a>
	</td>
</tr>
</script>
<script id="yueCountTemplate" type="text/x-handlebars-template">
<tr class="text-primary">
	<th>合计</th>
        <td>{{this.removedLandArea}}</td>
        <td>{{this.removedBuildings}}</td>
        <td>{{this.rmovedHouses}}</td>
        <td>{{this.removedLegalArea}}</td>
        <td>{{this.removedIllegalArea}}</td>
        <td>{{this.movedPopulation}}</td>
        <td>{{this.paidMoney}}</td>
        <td>{{this.yearDeadlineFile}}</td>
        <td>{{this.yearCourtExecute}}</td>
		<td>{{this.yearLegalRemoved}}</td>
</tr>
</script>
<script id="editYueBaoTemplate" type="text/x-handlebars-template">
<h4 class="ui header text-center text-primary">
	<strong id="announceInfoName">{{date}}</strong>
</h4>
<div class="row">
<div class="col-md-6">
	<div class="form-group">
		<label class="control-label" >已拆除栋数<span class="text-danger">*</span></label>
		<input type="text" maxlength="10" value="{{removedBuildings}}" name="removedBuildings" class="form-control" placeholder="请输入拆除栋数" value="">
	</div>
</div>
<div class="col-md-6">
	<div class="form-group">
		<label class="control-label" >已腾地数（亩）<span class="text-danger">*</span></label>
		<input type="text" maxlength="10" value="{{removedLandArea}}" name="removedLandArea" class="form-control" placeholder="请输入腾地数" value="">
	</div>
</div>
<div class="col-md-6">
	<div class="form-group">
		<label class="control-label" >已拆除户数<span class="text-danger">*</span></label>
		<input type="text" maxlength="10" value="{{rmovedHouses}}" name="rmovedHouses" class="form-control" placeholder="请输入除户数">
	</div>
</div>
<div class="col-md-6">
	<div class="form-group">
		<label class="control-label" >已拆除面积（合法）（平方米）<span class="text-danger">*</span></label>
		<input type="text" maxlength="10" value="{{removedLegalArea}}" name="removedLegalArea" class="form-control" placeholder="请输入拆除面积（合法）">
	</div>
</div>
<div class="col-md-6">
	<div class="form-group">
		<label class="control-label" >已拆除面积（违章）（平方米）<span class="text-danger">*</span></label>
		<input type="text" maxlength="10" value="{{removedIllegalArea}}" name="removedIllegalArea" class="form-control" placeholder="请输入拆除面积（违章）">
	</div>
</div>
<div class="col-md-6">
	<div class="form-group">
		<label class="control-label" >已动迁的人口<span class="text-danger">*</span></label> <input
			type="text" maxlength="10" value="{{movedPopulation}}" name="movedPopulation" class="form-control" placeholder="请输入动迁的人口">
	</div>
</div>
<div class="col-md-6">
	<div class="form-group">
		<label class="control-label" >已付补偿款（万元）<span class="text-danger">*</span></label>
		<input type="text" maxlength="15" value="{{paidMoney}}" name="paidMoney" class="form-control" placeholder="请输入所付补偿款">
	</div>
</div>
<div class="col-md-6">
	<div class="form-group">
		<label class="control-label">已下达期限腾地决定书<span class="text-danger">*</span></label>
		<input type="text" maxlength="10" value="{{yearDeadlineFile}}" name="yearDeadlineFile" class="form-control" placeholder="请输入下达期限腾地决定书">
	</div>
</div>
<div class="col-md-6">
	<div class="form-group">
		<label class="control-label">已申请法院执行数<span class="text-danger">*</span></label>
		<input type="text" maxlength="10" value="{{yearCourtExecute}}" name="yearCourtExecute" class="form-control" placeholder="请输入下达期限腾地决定书数">
	</div>
</div>
<div class="col-md-6">
	<div class="form-group">
		<label class="control-label">已发实施强制户数<span class="text-danger">*</span></label>
		<input type="text" class="form-control" value="{{yearLegalRemoved}}" maxlength="10" name="yearLegalRemoved" placeholder="请输入申请法院执行数" value="">
	</div>
</div>
<div class="col-md-6 col-md-offset-6">
	<div class="form-group">
		<div class="form-control-static">
			<div class="checkbox-custom">
				<input type="checkbox"  name="isBenYueJieSuan" value="true"> 
				<label>是否为本月完成结算项目</label>
			</div>
		</div>
	</div>
</div>
</div>
</script>
<script id="entrytemplate" type="text/x-handlebars-template">
    <tr proname="{{proName}}" approvalNumber="{{approvalNumber}}" protype="{{proTypeStr}}" proid="{{id}}" startDate="{{startDate}}" address="{{totalAddress}}" announceName="{{sequenceStr}}">
        <td>
            <div class="checkbox-custom">
                <input type="checkbox" name="checkPro"><label></label>
            </div>
        </td>
        <td>
            <a href="javascript:;" class="bk-fg-primary" onclick="showInfo(this);">
                {{proName}}
            </a>
        </td>
		<td>{{proTypeStr}}</td>
        <td>
            <a href="javascript:;" class="bk-fg-primary" onclick="showAnnouncementInfo(this);">{{sequenceStr}}</a>
        </td>
        <td>{{requisitionArea}}</td>
        <td>{{shouldRemoveBuildings}}</td>
        <td>{{shouldRemoveHouses}}</td>
        <td>{{totalAddress}}</td>
        <td>
            <a class="label label-dark" onclick="showInfo(this);">查看</a>
            <a class="label label-info" onclick="inputMonthProces(this);">录入月报</a>
            <a class="label label-success" onclick="addAnnouncement(this);">添加公告</a>
			<a class="label label-primary" onclick="yueBaoManage(this);">管理月报</a>
        </td>
    </tr>
</script>
<script id="entryInfoTemplate" type="text/x-handlebars-template">
{{#each this}}
   <tr>
        <td>{{this.date}}</td>
        <td>{{this.removedLandArea}}</td>
        <td>{{this.removedBuildings}}</td>
        <td>{{this.rmovedHouses}}</td>
        <td>{{this.removedLegalArea}}</td>
        <td>{{this.removedIllegalArea}}</td>
        <td>{{this.movedPopulation}}</td>
        <td>{{this.paidMoney}}</td>
        <td>{{this.yearDeadlineFile}}</td>
        <td>{{this.yearCourtExecute}}</td>
		<td>{{this.yearLegalRemoved}}</td>
    </tr>
{{/each}}
</script>
<script id="announceInfoTemplate" type="text/x-handlebars-template">
{{#each this}}
    <tr>
        <td>{{this.name}}</td>
        <td>{{this.number}}</td>
        <td>{{this.date}}</td>
        <td><a target="_blank" href="{{filePath}}" class="text-primary">{{fileName}}</a></td>
    </tr>
{{/each}}
</script>
<script id="AddAnnounceInfoTemplateOne" type="text/x-handlebars-template">
	<form class="tab-pane" id="announce{{index}}" action="projectManagement/pmProgressEditAnnouncement" onsubmit="return false;">
		<input type="hidden" name="id" value="{{id}}">
		<input type="hidden" name="proId" value="{{proId}}">
		<input type="hidden" name="sequence" value="{{sequence}}" />
		<div class="form-group">
			<label>公告文号</label>
			<input type="text" name="number" value="{{number}}" class="form-control" placeholder="请输入公告文号" maxlength="20">
		</div>
		<div class="form-group">
			<label>公告时间<span class="text-danger">*</span></label>
			<input type="text" name="date" class="form-control" value="{{date}}" data-plugin-datepicker  data-plugin-masked-input data-input-mask="9999/99/99" placeholder="____/__/__" />
		</div>
		<div class="form-group">
			<label>公告批文</label>
			<div class="controls">
				<div class="input-group upLoadFile" style="width:100%;">
					<input type="hidden" class="upFileHideVal" name="fdocVal" id="docPath" value="{{docPath}}" />
					<input class="form-control showUpFileName" type="text" disabled placeholder="请上传公告批文" value="{{fileName}}">
					<span class="input-group-btn upFileOperation" style="width:210px;">
						<button class="btn btn-default upFileSelectBtn" type="button" id="xzWJ">选择文件</button>
						<input type="file" class="upFileVal" style="display:none;" />
						<button class="btn btn-default upFileUpBtn" type="button" id="scWJ">上传文件</button>
						<span class="btn btn-link upFileLogin" style="display:none;cursor: auto;"><img src="assets/img/login.gif" /></span>
						<span class="btn btn-link upFileSuccess" style="display:none;cursor: auto;"><i class="fa fa-check text-success"></i></span>
						<span class="btn btn-link upFileError" style="display:none;cursor: auto;"><i class="fa fa-times text-danger"></i></span>
					</span>
				</div>
			</div>
		</div>
		<div class="modal-footer" style="margin-top: 40px;">
			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			<button type="submit" class="btn btn-primary" id="subFile">修改</button>
		</div>
	</form>
</script>
<script id="AddAnnounceInfoTemplateTwo" type="text/x-handlebars-template">
	<form class="tab-pane active addAnno" id="announce{{index}}" action="projectManagement/pmProgressAddAnnouncement" onsubmit="return false;">
		<input type="hidden" name="sequence" value="{{index}}" />
		<input type="hidden" name="proId" value="{{proId}}">
		<div class="form-group">
			<label>公告文号</label> 
			<input type="text" name="number" class="form-control" placeholder="请输入公告文号" maxlength="20" />
		</div>
		<div class="form-group">
			<label>公告时间<span class="text-danger">*</span></label>
			<input type="text" name="date" class="form-control" data-plugin-datepicker  data-plugin-masked-input data-input-mask="9999/99/99" placeholder="____/__/__" />
		</div>
		<div class="form-group">
			<label>公告批文</label>
			<div class="controls">
				<div class="input-group upLoadFile" style="width:100%;">
					<input type="hidden" class="upFileHideVal" name="fdocVal" id="docPath" />
					<input class="form-control showUpFileName" type="text" disabled placeholder="请上传公告批文">
					<span class="input-group-btn upFileOperation" style="width:210px;">
						<button class="btn btn-default upFileSelectBtn" type="button" id="xzWJ">选择文件</button>
						<input type="file" class="upFileVal" style="display:none;" />
						<button class="btn btn-default upFileUpBtn" type="button" id="scWJ">上传文件</button>
						<span class="btn btn-link upFileLogin" style="display:none;cursor: auto;"><img src="assets/img/login.gif" /></span>
						<span class="btn btn-link upFileSuccess" style="display:none;cursor: auto;"><i class="fa fa-check text-success"></i></span>
						<span class="btn btn-link upFileError" style="display:none;cursor: auto;"><i class="fa fa-times text-danger"></i></span>
					</span>
				</div>
			</div>
		</div>
		<div class="modal-footer" style="margin-top: 40px;">
			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			<button type="submit" class="btn btn-primary" id="subFile">保存</button>
		</div>
	</form>
</script>
<script id="queryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{proName}}</a></li>
</script>
<script id="daYinTableTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{proName}}</a></li>
</script>
<script type="text/javascript" src="assets/pageJs/projectManagement/proExcelHead.js" charset="UTF-8"></script>
<script type="text/javascript" src="assets/pageJs/projectManagement/pmProgress.js"></script>