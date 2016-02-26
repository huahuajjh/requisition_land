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
		<h6 class="bk-margin-off">项目统计</h6>
	</div>
	<form class="panel-body" id="pro_form">
		<div class="col-md-3">
			<div class="form-group">
				<label>项目类型</label>
				<select class="form-control" size="1">
					<option value="">所有项目类型</option>
					<s:iterator id="dto" value="proTypeDtos">
						<option value="<s:property value='#dto.getCode()' />"><s:property value='#dto.getName()' /></option>
					</s:iterator>
				</select>
			</div>
		</div>
		<div class="col-md-2">
			<div class="form-group">
				<label>项目进度</label>
				<select class="form-control" size="1">
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
				<select class="form-control" size="1" id="queryStreet_pro">
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
				<select class="form-control" size="1" id="queryCommunity_pro">
					<option value="">所有社区</option>
				</select>
			</div>
		</div>
		<div class="col-md-2">
			<input type="submit" class="btn btn-primary" value="查询" style="margin-top: 20px;" />
		</div>
	</form>
	<hr>
	<div class="panel-body">
		<table class="table table-striped table-bordered bootstrap-datatable datatable">
			<thead>
				<tr>
					<th>项目总数</th>
					<th>总征地数（亩）</th>
					<th>总拆栋数</th>
					<th>总拆户数</th>
					<th>总动迁人口</th>
					<th>总拆面积（合法）（平方米）</th>
					<th>总拆面积（违章）（平方米）</th>
					<th>总补偿款（万元）</th>
				</tr>
			</thead>   
			<tbody id="pro_statistics_data">
				<tr>
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
					<td>5</td>
					<td>6</td>
					<td>7</td>
					<td>8</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<script id="proTemplate" type="text/x-handlebars-template">
<tr>
	<td>1</td>
	<td>2</td>
	<td>3</td>
	<td>4</td>
	<td>5</td>
	<td>6</td>
	<td>7</td>
	<td>8</td>
</tr>
</script>
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6 class="bk-margin-off">拆迁户统计</h6>
	</div>
	<form class="panel-body" id="cqh_form">
		<div class="col-md-4">
			<div class="form-group downImput">
				<label>项目</label>
				<div class="input-group" style="width: 100%;">
					<input type="text" id="queryPrName_cqh" maxlength="20" class="form-control" placeholder="请输入要查询的项目名称" autocomplete="OFF">
					<span class="input-group-btn" style="width:81px;">
						<button class="btn btn-default" type="button" onclick="selectPro('#queryPrName_cqh');">选择项目</button>
					</span>
				 </div>
				<ul class="dropdown-menu" id="queryPrDown" style="display: none;"></ul>
			</div>
		</div>
		<div class="col-md-2">
			<div class="form-group">
				<label>镇(街道)</label> 
				<select class="form-control" size="1" id="queryStreet_cqh">
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
				<select class="form-control" size="1" id="queryCommunity_cqh">
					<option value="">所有社区</option>
				</select>
			</div>
		</div>
		<div class="col-md-2">
			<div class="form-group">
				<label>组</label>
				<select class="form-control" size="1" id="queryZu_cqh">
					<option value="">所有组</option>
				</select>
			</div>
		</div>
		<div class="col-md-2">
			<input type="submit" class="btn btn-primary" value="查询" style="margin-top: 20px;" />
		</div>
	</form>
	<hr>
	<div class="panel-body">
		<table class="table table-striped table-bordered bootstrap-datatable datatable">
			<thead>
				<tr>
					<th>拆迁户总户数</th>
					<th>拆迁户总人数</th>
					<th>独生子女总数</th>
					<th>半边户总数</th>
					<th>已转户人数</th>
					<th>未转户人数</th>
					<th>已纳入社保人数</th>
					<th>未纳入社保人数</th>
				</tr>
			</thead>   
			<tbody id="cqh_statistics_data">
				<tr>
	<td>1</td>
	<td>2</td>
	<td>3</td>
	<td>4</td>
	<td>5</td>
	<td>6</td>
	<td>7</td>
</tr>
			</tbody>
		</table>
	</div>
</div>
<script id="cqhTemplate" type="text/x-handlebars-template">
<tr>
	<td>1</td>
	<td>2</td>
	<td>3</td>
	<td>4</td>
	<td>5</td>
	<td>6</td>
	<td>7</td>
</tr>
</script>
<div class="row">
	<div class="col-md-6">
		<div class="panel">
			<div class="panel-heading bk-bg-primary">
				<h6 class="bk-margin-off">转户统计</h6>
			</div>
			<form class="panel-body" id="zh_form">
				<div class="col-md-8">
					<div class="form-group downImput">
						<label>项目</label>
						<div class="input-group" style="width: 100%;">
							<input type="text" id="queryPrName_zh" maxlength="20" class="form-control" placeholder="请输入要查询的项目名称" autocomplete="OFF">
							<span class="input-group-btn" style="width:81px;">
								<button class="btn btn-default" type="button" onclick="selectPro('#queryPrName_zh');">选择项目</button>
							</span>
						 </div>
						<ul class="dropdown-menu" id="queryPrDown" style="display: none;"></ul>
					</div>
				</div>
				<div class="col-md-3">
					<input type="submit" class="btn btn-primary" value="查询" style="margin-top: 20px;" />
				</div>
			</form>
			<div class="panel-body">
				<table class="table table-striped table-bordered bootstrap-datatable datatable">
					<thead>
						<tr>
							<th>转户总数</th>
							<th>已转户总数</th>
							<th>未转户总数</th>
						</tr>
					</thead>   
					<tbody id="zh_statistics_data">
					<tr>
	<td>1</td>
	<td>2</td>
	<td>3</td>
</tr>
					</tbody>
				</table>
			</div>
		</div>	
	</div>
	<div class="col-md-6">
		<div class="panel">
			<div class="panel-heading bk-bg-primary">
				<h6 class="bk-margin-off">纳入社保统计</h6>
			</div>
			<form class="panel-body" id="sb_form">
				<div class="col-md-8">
					<div class="form-group downImput">
						<label>项目</label>
						<div class="input-group" style="width: 100%;">
							<input type="text" id="queryPrName_sb" maxlength="20" class="form-control" placeholder="请输入要查询的项目名称" autocomplete="OFF">
							<span class="input-group-btn" style="width:81px;">
								<button class="btn btn-default" type="button" onclick="selectPro('#queryPrName_sb');">选择项目</button>
							</span>
						 </div>
						<ul class="dropdown-menu" id="queryPrDown" style="display: none;"></ul>
					</div>
				</div>
				<div class="col-md-3">
					<input type="submit" class="btn btn-primary" value="查询" style="margin-top: 20px;" />
				</div>
			</form>
			<div class="panel-body">
				<table class="table table-striped table-bordered bootstrap-datatable datatable">
					<thead>
						<tr>
							<th>纳入社保总数</th>
							<th>已纳入社保总数</th>
							<th>未纳入社保总数</th>
						</tr>
					</thead>   
					<tbody id="sb_statistics_data">
						<tr>
	<td>1</td>
	<td>2</td>
	<td>3</td>
</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<script id="zhTemplate" type="text/x-handlebars-template">
<tr>
	<td>1</td>
	<td>2</td>
	<td>3</td>
</tr>
</script>
<script id="sbTemplate" type="text/x-handlebars-template">
<tr>
	<td>1</td>
	<td>2</td>
	<td>3</td>
</tr>
</script>
<div class="panel">
	<div class="panel-heading bk-bg-primary">
		<h6 class="bk-margin-off">购房券统计</h6>
	</div>
	<form class="panel-body" id="gfq_form">
		<div class="col-md-4">
			<div class="form-group downImput">
				<label>项目</label>
				<div class="input-group" style="width: 100%;">
					<input type="text" id="queryPrName_gfq" maxlength="20" class="form-control" placeholder="请输入要查询的项目名称" autocomplete="OFF">
					<span class="input-group-btn" style="width:81px;"><button class="btn btn-default" type="button" onclick="selectPro('#queryPrName_gfq');">选择项目</button></span>
				 </div>
				<ul class="dropdown-menu" id="queryPrDown" style="display: none;"></ul>
			</div>
		</div>
		<div class="col-md-2">
			<div class="form-group">
				<label>镇(街道)</label> 
				<select class="form-control" size="1" id="queryStreet_gfq">
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
				<select class="form-control" size="1" id="queryCommunity_gfq">
					<option value="">所有社区</option>
				</select>
			</div>
		</div>
		<div class="col-md-2">
			<div class="form-group">
				<label>组</label>
				<select class="form-control" size="1" id="queryZu_gfq">
					<option value="">所有组</option>
				</select>
			</div>
		</div>
		<div class="col-md-2">
			<input type="submit" class="btn btn-primary" value="查询" style="margin-top: 20px;" />
		</div>
	</form>
	<div class="panel-body">
		<table class="table table-striped table-bordered bootstrap-datatable datatable">
			<thead>
				<tr>
					<th>购房券总数</th>
					<th>购房券总金额（万元）</th>
					<th>购房券已领取总数</th>
					<th>购房券未领取总数</th>
					<th>购房券已领金额（万元）</th>
					<th>购房券未领金额（万元）</th>
					<th>购房券正常使用的总数</th>
					<th>购房券兑现的总数</th>
				</tr>
			</thead>   
			<tbody id="gfq_statistics_data">
			<tr>
	<td>0</td>
	<td>1</td>
	<td>2</td>
	<td>3</td>
	<td>4</td>
	<td>5</td>
	<td>6</td>
	<td>7</td>
</tr>
			</tbody>
		</table>
	</div>
</div>
<script id="gfqTemplate" type="text/x-handlebars-template">
<tr>
	<td>0</td>
	<td>1</td>
	<td>2</td>
	<td>3</td>
	<td>4</td>
	<td>5</td>
	<td>6</td>
	<td>7</td>
</tr>
</script>
<div class="modal fade" id="selectProInfoModal">
  <div class="modal-dialog">
    <div class="modal-content">
    </div>
  </div>
</div>

<script type="text/javascript" src="assets/pageJs/statistics/statistics.js"></script>