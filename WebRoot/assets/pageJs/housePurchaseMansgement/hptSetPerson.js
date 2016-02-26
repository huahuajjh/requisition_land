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
		$.post("housePurchaseMansgement/hptSetPersonGet",$("#queryData").serialize(),function(data){
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
				$("#showQueryDataArea").data("data",datas);
				$("#showQueryDataArea").html(rHtml);
			});
		},"json");
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
$("#showQueryDataArea").validate({
	rules: {
		name: {
			required: true
		}, idNumber: {
			required: true
		}, time: {
			required: true
		}
	}, submitHandler:function(form){
		var data = $("#showQueryDataArea").data("data");
		var subData = {};
//		/**购房券id*/
		subData.ticketId = data.hptId;
//		/**购房券所有者*/
		subData.ownerId = data.fmlItemId;
//		/**领取凭证*/
		subData.evidenceOfGetting = $("#yuLanBtn").data("img");
//		/**领用人姓名*/
		subData.name = $("#showQueryDataArea [name='name']").val();
//		/**领用人身份证*/
		subData.idNumber = $("#showQueryDataArea [name='idNumber']").val();
//		/**领用时间*/
		subData.gettingDate = $("#showQueryDataArea [name='time']").val();
		$.post("housePurchaseMansgement/hptSetPersonAdd",{
			dataJson:JSON.stringify(subData)
		},function(data){
			actionFormate(data, true, function(type, msg, data) {
				operationLog("购房券个人发放","购房券个人发放");
				$("#showQueryDataArea").html("");
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