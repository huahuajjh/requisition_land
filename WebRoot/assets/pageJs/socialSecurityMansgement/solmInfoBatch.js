setProListModal("#selectProInfoModal",function(data){
	if(data){
		$("#queryPrName").data("data",data);
		$("#queryPrName").val(data.proName);
	}
});
var tableData = $.generateData({
	pageArea : "#pageArea",
	dataAreaId : "#entrytemplate",
	dataArea : "#dataTbody",
	url : "socialSecurityMansgement/solmInfoBatchList",
	firstFn : function(data) {
		data.pageNum = $("#dataPageCount").val();
		var queryPrName =  $("#queryPrName");
		if(queryPrName.data("data")){
			var state = queryPrName.data("data").proName == queryPrName.val();
			if(state){
				data.proId = queryPrName.data("data").id;
			}
		}
		data.streetId = $("#street").val();
		data.communityId = $("#community").val();
		data.idNumber = $("#idNumber").val();
		data.zuId = $("#zu").val();
	},
	lastFn : function(data) {
		var tempData = actionFormate(data, false,function(type,msg,d){
			var data = d.datas;
			for (var i = 0; i < data.length; i++) {
				var ageDuan = ageCalculate(data[i].birthday);
				data[i].ageDuan = ageDuan;
				
			}
			console.log(data);
		});
		$("#countArea").html(tempData.totalCount);
		console.log(tempData);
		return tempData;
	}, domFn:function(dom){
		initStreetAndCommunityAndClick(dom);
		$('[data-plugin-datepicker]',dom).each(function() {
			var $this = $(this), opts = {};
			$this.themePluginDatePicker(opts);
		});
		$('[data-plugin-masked-input]',dom).each(function() {
			var $this = $(this), opts = {};

			var pluginOptions = $this.data('plugin-options');
			if (pluginOptions)
				opts = pluginOptions;

			$this.themePluginMaskedInput(opts);
		});
	}
});
$("#dataPageCount").change(function() {
	tableData.setPageNum(parseInt($(this).val()));
	tableData.refreshData();
});
$.dropDownInput({
	inputId : "#queryPrName",
	dropDownId : "#queryPrDown",
	url : "projectManagement/pmProgressNames",
	templateId : "#queryPrDownTemplate",
	lastFn : function(data) {
		return actionFormate(data, false);
	},itemClick:function(data){
		$("#queryPrName").data("data",data);
	}
});
new bindingSelect({
	masterSelect:"#community",
	childSelect:"#zu",
	childDefalueVal:"所有组",
	url:"share/address",
	afterFn:function(data){
		return actionFormate(data, false);
	}
});
new bindingSelect({
	masterSelect:"#street",
	childSelect:"#community",
	childDefalueVal:"所有社区",
	url:"share/address",
	afterFn:function(data){
		return actionFormate(data, false);
	}
});
$("#selectAll").change(function() {
	var thisCheck = $(this).prop("checked");
	$("#dataTbody input[name='isCheck']").prop("checked", thisCheck);
});
$("#isSheBao input[type='radio']").change(function() {
	var thisVal = $(this).val();
	var thisCheck = $(this).prop("checked");
	$("#dataTbody input[name='isSheBao'][value='" + thisVal + "']").prop("checked", thisCheck);
	$("#dataTbody input[name='isSheBao'][value='" + thisVal + "']").change();
});
$("#time").change(function() {
	var thisVal = $(this).val();
	$("#dataTbody input[name='time']:not(:disabled)").val(thisVal);
});
$("#sbType").change(function() {
	var thisVal = $(this).val();
	$("#dataTbody select[name='sbType']:not(:disabled) option[value='"+ thisVal + "']").prop("selected", true);
});
$("#sendDataBtn").click(function() {
	var datas = getData();
	if (datas == null) {
		$('#sendDataBtn').popover({
			content : "请把数据填写完整"
		});
		$('#sendDataBtn').popover('show');
		setTimeout(function() {
			$("#sendDataBtn").popover('destroy');
		}, 1000);
	} else if (datas.length <= 0) {
		return;
	} else {
		$.post("socialSecurityMansgement/solmInfoBatchAdd",{
			dataJson:JSON.stringify(datas)
		},function(data){
			actionFormate(data, true,function(){
				operationLog("批量录入社保信息","批量录入社保信息");
				tableData.refreshData();
			 });
		},"json");
	}
});

function showProInfo(id){
	$.get("share/projectInfo",{
		id:id
	},function(html){
		$("#showProInfoArea").html(html);
		$("#showProInfoModal").modal("show");
	});
}
function initStreetAndCommunityAndClick(dom) {
	var thisDom = dom;
	var isSheBao = $(".isSheBao [name='isSheBao']", dom);
	isSheBao.change(function() {
		var thisVal = $(this).val();
		if (thisVal == "true") {
			$("input[type='text'],select",dom).prop("disabled", false);
		} else {
			$("input[type='text'],select",dom).prop("disabled", true);
			$("input[type='text'],select",dom).val("");
		}
	});
	$("*", dom).click(function() {
		$(this).removeClass("errorBorder");
	});
}
function getData() {
	if (!isPassValidate())
		return null;
	var datas = [];
	$("[name='isSheBao']:checked", "#dataTbody").each(function() {
		var tr = $(this).closest("tr");
		var isSheBao = $(this).val();
		var time = $("[name='time']", tr).val();
		var sbType = $("[name='sbType']", tr).val();
		var data = tr.data("data");
		var subData = {};
		subData.socialsecurityDate = time;
		subData.socialsecurityTypeId = sbType;
		subData.fmlItemId = data.fmlItemId;
		subData.community = $("[name='community']",tr).val();
		subData.serveArmyTime = $("[name='serveArmyTime']",tr).val() || 0;
		subData.endowmentInsuranceYear = $("[name='endowmentInsuranceYear']",tr).val() || 0;
		subData.medicalInsuranceMonth = $("[name='medicalInsuranceMonth']",tr).val() || 0;
		subData.joinWhichMedicalInsurance = $("[name='joinWhichMedicalInsurance']",tr).val();
		subData.prisonTime = $("[name='prisonTime']",tr).val() || 0;
		subData.ageRange = data.ageDuan;
		if (isSheBao == "true")
			datas.push(subData);
	});
	return datas;
}
function isPassValidate() {
	var state = true;
	$("#dataTbody *").removeClass("errorBorder");
	$("[name='isSheBao']:checked", "#dataTbody").each(function() {
		var tr = $(this).closest("tr");
		var isSheBao = $(this).val();
		if (isSheBao == "false")
			return;
		var time = $("[name='time']", tr);
		if (!time.val()){
			time.addClass("errorBorder");
			state = false;
		}
		var sbType = $("[name='sbType']", tr);
		if (!sbType.val()){
			sbType.addClass("errorBorder");
			state = false;
		}
		//判断是否数字
		var reg = new RegExp("^[0-9]*$");
		var serveArmyTime =  $("[name='serveArmyTime']",tr).val();
		if(serveArmyTime && !reg.test(serveArmyTime)){
			$("[name='serveArmyTime']",tr).addClass("errorBorder");
			state = false;
		}
		var endowmentInsuranceYear =  $("[name='endowmentInsuranceYear']",tr).val();
		if(endowmentInsuranceYear && !reg.test(endowmentInsuranceYear)){
			$("[name='endowmentInsuranceYear']",tr).addClass("errorBorder");
			state = false;
		}
		var medicalInsuranceMonth =  $("[name='medicalInsuranceMonth']",tr).val();
		if(medicalInsuranceMonth && !reg.test(medicalInsuranceMonth)){
			$("[name='medicalInsuranceMonth']",tr).addClass("errorBorder");
			state = false;
		}
		var prisonTime =  $("[name='prisonTime']",tr).val();
		if(prisonTime && !reg.test(prisonTime)){
			$("[name='prisonTime']",tr).addClass("errorBorder");
			state = false;
		}
	});
	return state;
}