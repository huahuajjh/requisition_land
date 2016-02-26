setPersonListModal("#selectPerson",function(data){
	if(data){
		$("#idNumber").val(data.idNumber);
		$("#queryBtn").click();
	}
});
$("#queryData").validate({
	rules:{
		idNumber:{
			required: true
		}
	}, submitHandler:function(form){
		$.post("housePurchaseMansgement/hptUseAndCashGet",$("#queryData").serialize(),function(data){
			actionFormate(data, true,function(type,msg,datas){
				datas.ticketName = toTicketStr(datas.ticketState);
				datas.ticketIndex = toTicketNumber(datas.ticketState);
				var template = Handlebars.compile($("#entrytemplate").html());
				var html = template(datas);
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
				$("#goufangQuanShiYong").data("data",datas);
				$("#goufangQuanShiYong").html(rHtml);
				submitFileStyle("#upLoadFile","EVIDENCE_FILE",function(data){
					return actionFormate(data, true);
				});
			});
		},"json");
    }
});

$("#goufangQuanShiYong").validate({
	rules:{
		time:{
			required:true
		}, type:{
			required:true
		}
	}, submitHandler:function(form){
		var data = $("#goufangQuanShiYong").data("data");
		var subData = {};
//		/**购房券所有者id*/
		subData.ownerId = data.fmlItemId;
//		/**购房券id*/
		subData.ticketId = data.hptId;
//		/**使用日期*/
		subData.usingDate = $("#goufangQuanShiYong [name='time']").val();
//		/**使用类型*/
		subData.usingType= $("#goufangQuanShiYong [name='type']").val();
//		/**使用去向*/
		subData.usingToWhere = $("#goufangQuanShiYong [name='quXiang']").val();
//		/**情况说明*/
		subData.situationExplain = $("#goufangQuanShiYong [name='shuoMing']").val();
//		/**相关凭证*/
		subData.evidencePath = $("#goufangQuanShiYong [name='evidencePath']").val();
		$.post("housePurchaseMansgement/hptUseAndCashAdd",{
			dataJson:JSON.stringify(subData)
		},function(data){
	      	actionFormate(data, true, function(type, msg, data) {
	      		operationLog("购房券的使用与兑现","购房券的使用与兑现");
	      		$("#goufangQuanShiYong").html("");
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