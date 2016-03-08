submitFileStyle("#upLoadFile","POLICY_FILE",function(data){
		return actionFormate(data, true);
});
$("#addVisitForm").validate({
	rules: {
		name: {
		    required: true
		}, phone:{
			required: true
		}, address:{
			required: true
		}, proName:{
			required: true
		}, time:{
			required: true
		}
	},  submitHandler:function(form){
		var proData  = $("#proData").data("data") || {};
		if(!$("#proName").val()){
			$("#proData").popover({
				content : "请选择上访项目",
				placement : "left"
			});
			$("#proData").popover("show");
			setTimeout(function() {
				$("#proData").popover("destroy");
			}, 1000);
			return;
		}
		var subData ={};
		subData.visitorName = $("[name='name']",form).val();
		subData.visitorTel = $("[name='phone']",form).val();
		subData.visitorAddr = $("[name='address']",form).val();
		subData.otherMsg = $("[name='otherMsg']",form).val();
		subData.visitProId = proData.id || null;
		subData.visitReason = $("[name='reasonMsg']",form).val();
		subData.visitTime = $("[name='time']",form).val();
		subData.visitMaterialPath = $("[name='fileVal']",form).val();
		subData.proName = $("#proName").val();
		subData.img = $("#yuLanBtn").data("img");
		
		subData.source = $("[name='source']",form).val();
		
		$.post(sendUrl.visits_add,{
			visits:JSON.stringify(subData)
		},function(data){
			actionFormate(data, true,function(){
				operationLog("添加上访上信息","添加上访上信息");
				$("#addVisitForm")[0].reset();
				$("#proData").data("data",null);
				$("#yuLanBtn,#paiZhaoFileCheckState").css("display","none");
			});
		},"json");
    }
});
var tableData = $.generateData({
	pageArea : "#pageArea",
	dataAreaId : "#entrytemplate",
	dataArea : "#dataTbody",
	url : "projectManagement/pmQueryProList",
	firstFn : function(data) {
		data.pageNum = 10;
		var queryPrName =  $("#queryPrName");
		if(queryPrName.data("data")){
			var state = queryPrName.data("data").proName == queryPrName.val();
			if(state){
				data.proId = queryPrName.data("data").id;
			}
		}
		data.annouceQueue = $("#queryPrJD").val();
		data.typeId = $("#queryProType").val();
		data.streetId = $("#proStreet").val();
		data.communityId = $("#proCommunity").val();
	},
	lastFn : function(data) {
		var tempData = actionFormate(data, false);
		$("#countArea").html(tempData.totalCount);
		return tempData;
	}
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
$("#proStreet").change(function() {
	var thisVal = $(this).val();
	$("#proCommunity").empty();
	$("#proCommunity").append('<option value="">所有社区</option>');
	if (!thisVal)
		return;
	$.post("share/address", {
		id : thisVal
	}, function(data) {
		var datas = actionFormate(data, false);
		for ( var d in datas) {
			$("#proCommunity").append('<option value="' + datas[d].id + '">' + datas[d].name + '</option>');
		}
	}, "json");
});
$("#upFile").change(function(){
	var val = $(this).val();
	if(!val) return;
	$("#paiZhaoFileLoginState").css("display","inline");
	$("#zhaoBtn,#yuLanBtn,#paiZhaoFileCheckState,#upBtn").css("display","none");
	submitFile(this,{
		fileType:"EVIDENCE_FILE"
	},"json",function(data){
		actionFormate(data, true, function(type, msg, data) {
			data = data.substring(data.indexOf("/")+1);
			$("#yuLanBtn").data("img",data);
		});
		$("#paiZhaoFileLoginState").css("display","none");
		$("#zhaoBtn,#yuLanBtn,#paiZhaoFileCheckState,#upBtn").css("display","inline");
	},function(e){
		$("#paiZhaoFileLoginState").css("display","none");
		$("#zhaoBtn,#yuLanBtn,#paiZhaoFileCheckState,#upBtn").css("display","inline");
	});
});
$("#phonePaiZhaoModal").modal({
	show:false, 
	keyboard:false,
	backdrop:"static",
});
$("#phonePaiZhaoModal").on("hidden.bs.modal",function(){
	if($(this).data("btnState") == true){
		var imgData = $(this).data("imgData");
		$("#paiZhaoFileLoginState").css("display","inline");
		$("#zhaoBtn,#yuLanBtn,#paiZhaoFileCheckState,#upBtn").css("display","none");
		$.post("share/saveFile",{
			baseSFFile:imgData
		},function(data){
			actionFormate(data, true, function(type, msg, data) {
				$("#yuLanBtn").data("img",data);
			});
			$("#paiZhaoFileLoginState").css("display","none");
			$("#zhaoBtn,#yuLanBtn,#paiZhaoFileCheckState,#upBtn").css("display","inline");
		},"json");
	}
});
$("#yuLanBtn").click(function(){
	var img = $(this).data("img");
	if(!img) return;
	$.initShowImage([img]);
});
function upFileZhaoPian(){
	$("#upFile").click();
}
function paiZhao(){
	$.get("share/photographs",function(html){
		$("#phonePaiZhaoBody").html(html);
		$("#phonePaiZhaoModal").modal("show");
	});
}
function selectProInfo(dom){
	var tr = $(dom).closest("tr");
	var data = tr.data("data");
	$("#proData").data("data",data);
	$("#proName").val(data.proName);
	$("#showProInfoModal").modal("hide");
}