<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
	.jHead{
	display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;
	}
	.jBody{
		overflow:hidden; 
		height: 15px;
		display: block;
	}
</style>
<div id="tabOneArea">
	<div class="panel">
		<div class="panel-heading bk-bg-primary">
			<h6>查询项目</h6>
			<div class="panel-actions">
				<a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
			</div>
		</div>
		<div class="panel-body">
			<form>
				<div class="row">
					<div class="col-md-3">
						<div class="form-group downImput">
							<label>项目名称</label>
							<input type="text" id="queryPrName" maxlength="20" class="form-control" placeholder="请输入要查询的项目名称">
							<ul class="dropdown-menu" id="queryPrDown"></ul>
						</div>
					</div>
					<div class="col-md-3">
						<div class="form-group">
							<label>项目类型</label>
							<select id="queryProType" class="form-control" size="1">
								<option value="">所有项目类型</option>
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
							<label>项目进度</label>
							<select id="queryPrJD" class="form-control" size="1">
								<option value="0">所有进度</option>
								<option value="1">一公告</option>
								<option value="2">二公告</option>
								<option value="3">三公共</option>
							</select>
						</div>
					</div>
					<div class="col-md-2">
						<div class="form-group">
							<label>镇(街道)</label>
							<select id="queryProStreet" class="form-control" size="1">
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
							<label>村（社区）</label>
							<select id="queryProCommunity" class="form-control" size="1">
								<option value="">所有社区</option>
							</select>
						</div>
					</div>
					<div class="col-md-12">
						<hr>
						<input type="button" class="btn btn-primary pull-right" value="查询" onclick="queryProtableData.goPage(1); ">
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<div class="panel">
		<div class="panel-heading bk-bg-primary">
			<div class="row">
				<div class="col-xs-5 text-left bk-vcenter">
					<h6>项目综合浏览</h6>
				</div>
				<div class="col-xs-7 bk-vcenter text-right">
					每页显示<select class="select_top" id="queryProDataPageCount">
						<option value="10">10</option>
						<option value="20">20</option>
						<option selected value="30">30</option>
						<option value="40">40</option>
						<option value="50">50</option>
					</select>条数据,总共有<span id="queryProCountArea">0</span>个项目。
				</div>
			</div>
		</div>
		<div class="panel-body">
			<div class="table-responsive">
				<table
					class="table table-striped table-bordered bootstrap-datatable datatable">
					<thead>
						<tr>
							<th>项目名称</th>
							<th>项目类型</th>
							<th>项目进度</th>
							<th>项目审批号</th>
							<th>项目地址</th>
							<th>启动时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="queryProDataTbody">
					</tbody>
					<tfoot>
						<tr>
							<td colspan="10">
								<div class="bk-margin-5 btn-group pull-right" id="queryProPageArea">
								</div>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="showProInfoModal">
	<div class="modal-dialog" style="width:1200px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title bk-fg-primary">项目详细信息</h4>
			</div>
			<div class="modal-body" id="proInfoArea">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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
<script id="queryProEntrytemplate" type="text/x-handlebars-template">
<tr>
	<td>
		<a href="javascript:;" class="bk-fg-primary" onclick="showProInfoMsg(this);">{{proName}}</a>
	</td>
	<td>{{proTypeStr}}</td>
	<td><a class="bk-fg-primary" href="javascript:;" onclick="showAnnouncementInfo(this);">{{sequenceStr}}</a></td>
	<td>{{approvalNumber}}</td>
	<td>{{totalAddress}}</td>
	<td>{{startDate}}</td>
	<td>
		<a class="label label-dark" onclick="showProInfoMsg(this)">查看</a>
	</td>
</tr>
</script>
<script id="proInfoModalEntrytemplate" type="text/x-handlebars-template">
<h4 class="ui header text-center text-primary">
	<strong>{{proName}}</strong>
</h4>
<table class="table table-striped">
	<tbody>
		<tr>
			<td class="active text-right"><strong>审批号：</strong></td>
			<td>{{approvalNumber}}</td>
			<td class="active text-right"><strong>项目地址：</strong></td>
			<td>{{totalAddress}}</td>
			<td class="active text-right"><strong>项目类型：</strong></td>
			<td>{{proTypeStr}}</td>
		</tr>
		<tr>
			<td class="active text-right"><strong>征地面积(亩)：</strong></td>
			<td>{{requisitionArea}}</td>
			<td class="active text-right"><strong>应拆栋数：</strong></td>
			<td>{{shouldRemoveBuildings}}</td>
			<td class="active text-right"><strong>应拆户数：</strong></td>
			<td>{{shouldRemoveHouses}}</td>
		</tr>
		<tr>
			<td class="active text-right"><strong>应动迁人口：</strong></td>
			<td>{{shouldMovePopulation}}</td>
			<td class="active text-right"><strong>应拆面积（合法）(平方米)：</strong></td>
			<td>{{shouldRemoveLegalArea}}</td>
			<td class="active text-right"><strong>应拆面积（违章）(平方米)：</strong></td>
			<td>{{shouldRemoveIllegalArea}}</td>
		</tr>
		<tr>
		<td class="active text-right"><strong>所处公告：</strong></td>
			<td>{{sequenceStr}}</td>
			<td class="active text-right"><strong>应付补偿款(万元)：</strong></td>
			<td>{{shouldPayMoney}}</td>
			<td class="active text-right"><strong>启动时间：</strong></td>
			<td>{{startDate}}</td>
		</tr>
		<td class="active text-right"><strong>项目分类：</strong></td>
			<td>{{categoryStr}}</td>
			<td class="active text-right"><strong>六前项目：</strong></td>
			<td>{{sixForward}}</td>
		</tr>
	</tbody>
</table>
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
		<tbody id="proInfoAnnListInfo">
		</tbody>
	</table>
</div>
<div class="panel panel-default">
	<div class="panel-heading">
		<h6>项目每月台账详细信息</h6>
	</div>
	<table class="table table-striped table-bordered bootstrap-datatable datatable">
		<thead>
			<tr>
				<th>月份</th>
				<th>本月腾地数(亩)</th>
				<th>本月拆栋数</th>
				<th>本月拆合法面积<br>(平方米)</th>
				<th>本月动迁人口</th>
				<th>下达限期腾地决定书</th>
				<th>申请法院执行</th>
				<th>依法实施强制腾地户数</th>
				<th>是否为本月完成结算项目</th>
				<th>本月新启动项目</th>
			</tr>
		</thead>
		<tbody id="showProMonthProces">
		</tbody>
		<tfoot id="proYurBaoHejiArea">
		</tfoot>
	</table>
</div>
<div class="panel panel-default">
	<div class="panel-heading">
		<div class="row">
			<div class="col-xs-5 text-left bk-vcenter">
				<h6>拆迁户列表</h6>
			</div>
			<div class="col-xs-7 bk-vcenter text-right">
				总共有<span id="huCountArea">0</span>个拆迁户。
			</div>
		</div>
	</div>
    <table class="table table-bordered bootstrap-datatable datatable table-hover">
    	<thead>
    		<tr>
    			<th><span class="jHead">户主姓名</span></th>
    			<th><span class="jHead">房屋合法面积<br>(平方米)</span></th>
    			<th><span class="jHead">房屋违章面积<br>(平方米)</span></th>
    			<th><span class="jHead">房屋照片</span></th>
				<th><span class="jHead">高拍仪照片</span></th>
    			<th><span class="jHead">地址</span></th>
    			<th><span class="jHead">批证及其他情况说明</span></th>
    			<th><span class="jHead">拟定处理方案</span></th>
    			<th><span class="jHead">联合会审意见</span></th>
    			<th><span class="jHead">联合会审附件</span></th>
    			<th><span class="jHead">备注</span></th>
    			<th style="width: 100px;"><span class="jHead">操作</span></th>
    		</tr>
    	</thead>   
    	<tbody id="huDataTbody">
    	</tbody>
    </table>
	<div class="panel-footer text-right">
		<div class="bk-margin-5 btn-group" id="huPageArea">
		</div>
	</div>
</div>
</script>
<script id="huEntrytemplate" type="text/x-handlebars-template">
<tr>
	<td>
		<span class="jBody"  data-toggle="tooltip" data-placement="top" title="{{headName}}">{{headName}}</span>
	</td>
	<td>
		<span class="jBody"  data-toggle="tooltip" data-placement="top" title="{{houseLegalArea}}">{{houseLegalArea}}</span>
	</td>
	<td>
		<span class="jBody"  data-toggle="tooltip" data-placement="top" title="{{houseIllegalArea}}">{{houseIllegalArea}}</span>
	</td>
	<td>
		<a href="javascript:;" class="text-primary" onclick="showHuImg(this);">点击查看</a>
	</td>
	<td>
		<a href="javascript:;" class="text-primary" onclick="showHuGPImg(this);">点击查看</a>
	</td>
	<td>
		<span class="jBody"  data-toggle="tooltip" data-placement="top" title="{{address}}">{{address}}</span>
	</td>
	<td>
		<span class="jBody"  data-toggle="tooltip" data-placement="top" title="{{satuationDesc}}">{{satuationDesc}}</span>
	</td>
	<td>
		<span class="jBody"  data-toggle="tooltip" data-placement="top" title="{{dealSolution}}">{{dealSolution}}</span>
	</td>
	<td><span class="jBody"  data-toggle="tooltip" data-placement="top" title="{{unionSuggestion}}">{{unionSuggestion}}</span></td>
	<td>
		<a target="_blank" {{#if unionSuggestionPathVal}}href="{{unionSuggestionPathVal}}"{{/if}} class="text-primary">点击下载</a>
	</td>
	<td>
		<span class="jBody"  data-toggle="tooltip" data-placement="top" title="{{remark}}">{{remark}}</span>
	</td>
	<td><a href="javascript:;" class="text-primary" onclick="showHuPersons(this);"><i class="fa fa-plus-square"></i> 查看详细</a></td>
</tr>
<tr style="display:none;" class="bk-bg-very-light-gray">
	<td colspan="12" style="box-shadow: 0px 0px 10px inset;">
		<table class="table table-bordered bootstrap-datatable datatable">
    		<thead>
    			<tr>
    				<th>姓名</th>
    				<th>与户主关系</th>
    				<th>性别</th>
    				<th>出生日期</th>
    				<th>身份证件</th>
    				<th>户口性质</th>
    				<th>半边户</th>
    				<th>独生子女证号</th>
    				<th style="width: 100px;">操作</th>
    			</tr>
    		</thead>
			<tbody class="huPersonDataTbody">
			</tbody>
		</table>
	</td>
</tr>
</script>
<script id="huPersonEntrytemplate" type="text/x-handlebars-template">
<tr>
	<td>{{name}}</td>
	<td>{{relationshipStr}}{{#if otherRelationship}}-{{otherRelationship}}{{/if}}</td>
	<td>{{#dengYu gender 1}}男{{else}}女{{/dengYu}}</td>
	<td>{{birthday}}</td>
	<td>{{idNumber}}</td>
	<td>{{householdStr}}</td>
	<td>{{#if half}}<i class="fa fa-check text-success"></i>{{else}}<i class="fa fa-times text-danger"></i>{{/if}}</td>
	<td>{{onlyChildNumber}}</td>
	<td><a href="javascript:;" class="text-primary" onclick="showPersonOtherData(this);"><i class="fa fa-plus-square showBtn"></i> 查看详细</a></td>
</tr>
<tr style="display:none;" class="bk-bg-very-light-gray">
	<td colspan="9" style="box-shadow: 0px 0px 10px inset;">
		<h3 style="display:none">转户信息</h3>
		<table class="table table-bordered" style="display:none">
			<tbody class="showZhuanHuArea">
			</tbody>
		</table>
		<h3>社保信息</h3>
		<table class="table table-bordered">
			<tbody class="perosonSheBaoInfoArea">
			</tbody>
		</table>
		<h3>购房券信息</h3>
		<div class="goufangquanInfoArea">
		</div>
	</td>
</tr>
</script>
<script id="zhuanHuMsgTemplate" type="text/x-handlebars-template">
<tr>
	<td>转户时间：<strong>{{transferDate}}</strong></td>
	<td>转户类型：<strong>{{houseHoldTypeStr}}</strong></td>
	<td>转户地址：<strong>{{address}}</strong></td>
</tr>
</script>
<script id="sheBaoMsgTemplate" type="text/x-handlebars-template">
<tr>
	<td class="active" style="width: 200px;">纳入社保日期</td>
	<td>{{socialsecurityDate}}</td>
	<td class="active" style="width: 200px;">社保类型</td>
	<td>{{typeStr}}</td>
</tr>
<tr>
	<td class="active">军队服役时间(月)</td>
	<td>{{serveArmyTime}}</td>
	<td class="active">养老保险补缴年限</td>
	<td>{{endowmentInsuranceYear}}</td>
</tr>
<tr>
	<td class="active">医疗保险视同缴费月数</td>
	<td>{{medicalInsuranceMonth}}</td>
	<td class="active">参加何种医疗保险</td>
	<td>{{joinWhichMedicalInsurance}}</td>
</tr>
<tr>
	<td class="active">所属社区</td>
	<td>{{community}}</td>
	<td class="active">服刑或劳动教养时间(月)</td>
	<td>{{prisonTime}}</td>
</tr>
</script>
<script id="gouFangQuanMsgTemplate" type="text/x-handlebars-template">
{{#each this}}
<table class="table table-bordered">
	<tbody>
		<tr>
			<td class="active" style="width: 160px;">购房券状态</td>
			<td>{{ticketState}}</td>
			<td class="active" style="width: 150px;">制券日期</td>
			<td>{{makeDate}}</td>
		</tr>
		<tr>
			<td class="active">补贴金额（万元）</td>
			<td>{{bonus}}</td>
			<td class="active">券号</td>
			<td>{{ticketNumber}}</td>
		</tr>
		<tr>
			<td class="active">领券时间</td>
			<td>{{gettingDate}}</td>
			<td class="active">领用凭证</td>
			<td>{{#if evidence}}<a class="text-primary" href="javascript:;" onclick="$.initShowImage(['{{evidence}}']);">点击查看</a>{{/if}}</td>
		</tr>
		<tr>
			<td class="active">领用人姓名</td>
			<td>{{name}}</td>
			<td class="active">领用身份证件</td>
			<td>{{idNumber}}</td>
		</tr>
		<tr>
			<td class="active">使用时间</td>
			<td>{{useDate}}</td>
			<td class="active">使用类型</td>
			<td>{{useType}}</td>
		</tr>
		<tr>
			<td class="active">使用去向</td>
			<td>{{useToWhere}}</td>
			<td class="active">情况说明</td>
			<td>{{explain}}</td>
		</tr>
		<tr>
			<td class="active">购房券使用凭证</td>
			<td colspan="3">
				{{#if evidencePathVal}}<a target="_blank" href="{{evidencePathVal}}" class="text-primary">点击下载</a>{{/if}}
			</td>
		</tr>
	</tbody>
</table>
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
<script id="entryInfoTemplate" type="text/x-handlebars-template">
{{#each this}}
   <tr>
        <td>{{this.date}}</td>
        <td>{{this.removedLandArea}}</td>
        <td>{{this.removedBuildings}}</td>
        <td>{{this.removedLegalArea}}</td>
        <td>{{this.movedPopulation}}</td>
        <td>{{this.yearDeadlineFile}}</td>
        <td>{{this.yearCourtExecute}}</td>
		<td>{{this.yearLegalRemoved}}</td>
		<td>{{this.curMonthComplete}}</td>
		<td>{{this.isStart}}</td>
    </tr>
	<tr>
		<td>备注:</td>
		<td colspan="9">{{this.remark}}</td>
	</tr>
{{/each}}
</script>
<script id="yueCountTemplate" type="text/x-handlebars-template">
<tr class="text-primary">
	<th>合计</th>
    <td>{{this.removedLandArea}}</td>
    <td>{{this.removedBuildings}}</td>
    <td>{{this.removedLegalArea}}</td>
    <td>{{this.movedPopulation}}</td>
    <td>{{this.yearDeadlineFile}}</td>
    <td>{{this.yearCourtExecute}}</td>
	<td>{{this.yearLegalRemoved}}</td>
	<td></td>
	<td></td>
</tr>
</script>
<script id="queryPrDownTemplate" type="text/x-handlebars-template">
    <li><a href="javascript:;">{{proName}}</a></li>
</script>
<script type="text/javascript" src="assets/pageJs/supervisionManagement/infoSummary.js"></script>