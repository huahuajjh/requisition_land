setPersonListModal("#selectPerson",function(data){
	if(data){
		$("#idNumber").val(data.idNumber);
		$("#queryBtn").click();
	}
});
$.dropDownInput({
	inputId : "#idNumber",
	dropDownId : "#idNumberQueryPrDown",
	url : sendUrl.onekeyQuery_getFuzzy,
	urlType:"get",
	valName:"fuzzy",
	selectVal:"idNumber",
	templateId : "#idNumberQueryPrDownTemplate",
	lastFn:function(data){
		return actionFormate(data,false);
	},itemClick:function(data){
		$("#idNumber").data("data",data);
	}
});
$("#queryData").validate({
	rules:{
		idNumber:{
			required: true
		}
	}, submitHandler:function(form){
		$.post("housePurchaseMansgement/hptLossAndMendGet",$("#queryData").serialize(),function(data){
			actionFormate(data, false,function(type,msg,datas){
				datas.ticketName = toTicketStr(datas.ticketState);
				datas.ticketIndex = toTicketNumber(datas.ticketState);
				if(datas.ticketIndex == 5){
					guaShi(datas);
				} else if(datas.ticketIndex == 1){
					buShi(datas);
				} else {
					showMsg("该券还未被领取，无法挂失或补失购房券","提示：");
					$("#showQueryDataArea").html("");
				}
			},function(type,msg,data){
				showMsg(msg,"提示：");
			});
		},"json");
    }
});
$('#showQueryDataArea').validate({
	rules:{
		time:{
			required: true
		}, quanNum:{
			required: true
		}, money:{
			required: true,
			number:true,
			min:0
		}, buShiTime:{
			required: true
		}
	}, submitHandler:function(form){
		var ticketIndex = $("#showQueryDataArea").data("data").ticketIndex;
		if(ticketIndex == 5){
			guaShiForm();
		} else if(ticketIndex == 1){
			buShiForm();
		}
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
function guaShi(data){
	var template = Handlebars.compile($("#guaShiTemplate").html());
	var html = template(data);
	var rHtml = $(html);
	$('[data-plugin-masked-input]',rHtml).each(function() {
		var $this = $(this), opts = {};
		var pluginOptions = $this.data('plugin-options');
		if (pluginOptions)
			opts = pluginOptions;

		$this.themePluginMaskedInput(opts);
	});
	$('[data-plugin-datepicker]',rHtml).each(function() {
		var $this = $(this), opts = {};
		$this.themePluginDatePicker(opts);
	});
	$("#showQueryDataArea").data("data",data);
	$("#showQueryDataArea").html(rHtml);
}
function buShi(data){
	var template = Handlebars.compile($("#buShiTemplate").html());
	var html = template(data);
	var rHtml = $(html);
	$('[data-plugin-masked-input]',rHtml).each(function() {
		var $this = $(this), opts = {};
		var pluginOptions = $this.data('plugin-options');
		if (pluginOptions)
			opts = pluginOptions;

		$this.themePluginMaskedInput(opts);
	});
	$('[data-plugin-datepicker]',rHtml).each(function() {
		var $this = $(this), opts = {};
		$this.themePluginDatePicker(opts);
	});
	$("#showQueryDataArea").data("data",data);
	$("#showQueryDataArea").html(rHtml);
}
function guaShiForm(){
	var data = $("#showQueryDataArea").data("data");
	var hptLossInfo = {};
//	/**挂失日期*/
	hptLossInfo.reportOfLossDate = $("#showQueryDataArea [name='time']").val();
//	/**挂失人*/
	hptLossInfo.fmlItemId = data.fmlItemId;
//	/**挂失的购房券*/
	hptLossInfo.ticketId = data.hptId;
	hptLossInfo.remark = $("#showQueryDataArea [name='remark']").val();
	
	var logData = {};
	logData.resideName = data.name;
	logData.resideIdNumber = data.idNumber;
	logData.ticketNumber = data.ticketNumber;
	logData.bonus = data.bonus;
	logData.makeTime = data.makeTime;
	logData.reportOfLossDate = hptLossInfo.reportOfLossDate;
	logData.remark = hptLossInfo.remark;
	$.post("housePurchaseMansgement/hptLossAndMendGuaShi",{
		hptLossInfo:JSON.stringify(hptLossInfo)
	},function(data){
		actionFormate(data, true, function(type, msg, data) {
			var template = Handlebars.compile($("#logGSItemTemplate").html());
			var logHtml = template(logData);
			operationLog("购房券挂失","购房券挂失",logHtml);
    		$("#showQueryDataArea").html("");
		});
	},"json");
}
function buShiForm(){
	var data = $("#showQueryDataArea").data("data");
	var htpMendInfo = {};
//	/**补券日期*/
	htpMendInfo.mendDate = $("#showQueryDataArea [name='buShiTime']").val();
//	/**补券人*/
	htpMendInfo.onwerId=data.fmlItemId;
//	/**找补的购房券*/
	htpMendInfo.ticketId = data.hptId;
	var housePuraseTicket = {};
//	/** 补贴金额 */
	housePuraseTicket.bonus = $("#showQueryDataArea [name='money']").val();
//	/** 制券日期 */
	housePuraseTicket.makeDate = $("#showQueryDataArea [name='time']").val();
//	/** 券号 */
	housePuraseTicket.ticketNumber =  $("#showQueryDataArea [name='quanNum']").val();
//	/** 购房券所有者id */
	housePuraseTicket.fmlItemId = data.fmlItemId;
//	/** 购房券所有者身份证 */
	housePuraseTicket.idNumber = data.idNumber;
//	/** 姓名 */
	housePuraseTicket.name = data.name;
	
	var logData = {};
	logData.resideName = data.name;
	logData.resideIdNumber = data.idNumber;
	logData.ticketNumber = data.ticketNumber;
	logData.bonus = data.bonus;
	logData.makeTime = data.makeTime;
	logData.newTicketNumber = housePuraseTicket.ticketNumber;
	logData.newBonus = housePuraseTicket.bonus;
	logData.newMakeTime = housePuraseTicket.makeDate;
	logData.mendDate = htpMendInfo.mendDate;

	$.post("housePurchaseMansgement/hptLossAndMendBuShi",{
		htpMendInfo:JSON.stringify(htpMendInfo),
		housePuraseTicket:JSON.stringify(housePuraseTicket)
	},function(data){
		actionFormate(data, true, function(type, msg, data) {
			var template = Handlebars.compile($("#logBQItemTemplate").html());
			var logHtml = template(logData);
			operationLog("购房券补券","购房券补券",logHtml);
    		$("#showQueryDataArea").html("");
		});
	},"json");
}