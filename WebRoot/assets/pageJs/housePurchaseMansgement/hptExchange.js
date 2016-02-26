setPersonListModal("#selectPerson",function(data){
	if(data){
		$("#idNumber").val(data.idNumber);
		$("#queryBtn").click();
	}
});
$("#queryData").validate({
	submitHandler:function(form){
		var idNumber = $("[name='idNumber']",form).val();
		var ticketNumber = $("[name='quanNumber']",form).val();
		if(!idNumber && !ticketNumber){
			$(form).validate().showErrors({
				"idNumber" : "身份证和券号必须填写一个",
				"quanNumber": "身份证和券号必须填写一个"
			});
			return;
		}
		$.post("housePurchaseMansgement/hptExchangeGet",{
			idNumber:idNumber,
			ticketNumber:ticketNumber
		},function(data){
			actionFormate(data, true,function(type,msg,datas){
				datas.ticketName = toTicketStr(datas.ticketState);
				datas.ticketIndex = toTicketNumber(datas.ticketState);
				var template = Handlebars.compile($("#entrytemplate").html());
				var html = template(datas);
				var rHtml = $(html);
				$('[data-plugin-datepicker]',rHtml).each(function() {
					var $this = $(this), opts = {};
					$this.themePluginDatePicker(opts);
				});
				$('[data-plugin-masked-input]',rHtml).each(function() {
					var $this = $(this), opts = {};

					var pluginOptions = $this.data('plugin-options');
					if (pluginOptions)
						opts = pluginOptions;
					$this.themePluginMaskedInput(opts);
				});
				$("#yuLanBtn",rHtml).click(function(){
					var img = $(this).data("img");
					if(!img) return;
					$.initShowImage([img]);
				});
				$("#upFile",rHtml).change(function(){
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
				$("#selectHPTList").data("data",datas);
				$("#selectHPTList").html(rHtml);
			});
		},"json");
    }
});
$("#selectHPTList").validate({
	rules: {
		quanNum: {
			required: true
		}, quanNewMoney: {
			required: true,
			number:true,
			min:0
		},name: {
			required: true
		},time: {
			required: true
		}, zTime: {
			required: true
		}
	}, submitHandler:function(form){
		var data = $("#selectHPTList").data("data");
		var hptExchangeInfo = {};
//		/**所有者id*/
		hptExchangeInfo.ownerId = data.fmlItemId;
//		/**换发日期*/
		hptExchangeInfo.exchengeDate = $("#selectHPTList [name='time']").val();
//		/**领用证明*/
		hptExchangeInfo.evidencePath = $("#yuLanBtn").data("img");
//		/**老券id*/
		hptExchangeInfo.oldTicketId = data.hptId;
//		/**领用人*/
		hptExchangeInfo.gettingUser = $("#selectHPTList [name='name']").val();
		var housePuraseTicket = {};
//		/** 补贴金额 */
		housePuraseTicket.bonus = $("#selectHPTList [name='quanNewMoney']").val();
//		/** 制券日期 */
		housePuraseTicket.makeDate = $("#selectHPTList [name='zTime']").val();
//		/** 券号 */
		housePuraseTicket.ticketNumber = $("#selectHPTList [name='quanNum']").val();
//		/** 购房券状态 */
		housePuraseTicket.state = data.ticketIndex;
//		/** 购房券所有者id */
		housePuraseTicket.fmlItemId = data.fmlItemId;
//		/** 购房券所有者身份证 */
		housePuraseTicket.idNumber = data.idNumber;
//		/** 姓名 */
		housePuraseTicket.name = $("#selectHPTList [name='name']").val();
		$.post("housePurchaseMansgement/hptExchangeAdd",{
			hptExchangeInfo:JSON.stringify(hptExchangeInfo),
			housePuraseTicket:JSON.stringify(housePuraseTicket)
		},function(data){
			actionFormate(data, true,function(){
				operationLog("购房券换发","购房券换发");
				$("#selectHPTList").html("");
			});
		},"json");
    }
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
		$("#zhaoBtn,#yuLanBtn,#paiZhaoFileCheckState").css("display","none");
		//提交数据
		$.post("share/saveFile",{
			baseSFFile:imgData
		},function(data){
			actionFormate(data, true, function(type, msg, data) {
				$("#yuLanBtn").data("img",data);
			});
			$("#paiZhaoFileLoginState").css("display","none");
			$("#zhaoBtn,#yuLanBtn,#paiZhaoFileCheckState").css("display","inline");
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
function paiZhao(){
	$.get("share/photographs",function(html){
		$("#phonePaiZhaoBody").html(html);
		$("#phonePaiZhaoModal").modal("show");
	});
}
function upFileZhaoPian(){
	$("#upFile").click();
}