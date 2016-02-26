$.dropDownInput({
	inputId : "#idNumberOrName",
	dropDownId : "#queryDown",
	url : sendUrl.onekeyQuery_getFuzzy,
	urlType:"get",
	valName:"fuzzy",
	selectVal:"valName",
	templateId : "#queryDownTemplate",
	lastFn:function(data){
		return actionFormate(data,false,function(type,msg,data){
			if(data){
				for (var i = 0; i < data.length; i++) {
					var d = data[i];
					d.valName = d.name + "-" + d.idNumber;
				}
			}
		}) || [];
	},itemClick:function(data){
		$("#idNumberOrName").val(data.name);
		$("#idNumberOrName").data("data",data);
	}
});
setPersonListModal("#selectPerson",function(data){
	if(data){
		$("#name").val(data.name);
		$("#idNumber").val(data.idNumber);
		initDom(data);
	}
});
$("#idNumberBtn").click(function() {
	var data = $("#idNumberOrName").data("data");
	if(!data) return;
	$.post("housePurchaseMansgement/hptAddGet", {
		idNumber : data.idNumber,
		name : data.name
	}, function(data) {
		actionFormate(data, true, function(type, msg, data) {
			initDom(data);
		},function(){
			resestData();
		});
	}, "json");
});
$("#addHPT").validate({
	rules: {
		money: {
			required: true,
			number:true,
			maxlength:15,
			min:0
		}, quanNumber: {
			required: true
		}
	}, submitHandler:function(form){
		var data = $("#showinfo").data("data");
        var subData = {};
        subData.bonus = $("#addHPT [name='money']").val();//补贴金额
        subData.makeDate = $("#addHPT [name='time']").val();//制券日期
        subData.ticketNumber = $("#addHPT [name='quanNumber']").val();//券号
        subData.fmlItemId = data.id;//购房券所有者id
        subData.idNumber = data.idNumber;//持有者身份证
        subData.name = data.name;//持有者姓名
        $.post("housePurchaseMansgement/hptAddAdd",{
        	dataJson:JSON.stringify(subData)
        },function(data){
        	actionFormate(data, true, function(type, msg, data) {
        		operationLog("手工添加购房券信息","手工添加购房券信息");
        		resestData();
    		});
        },"json");
    }
});
function initDom(data){
	var template = Handlebars.compile($("#showInfoTemplate").html());
	var html = template(data);
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
	$("#showinfo").data("data",data);
	$("#showinfo").html(rHtml);
}
function resestData(){
	$("#showinfo").html("");
}
function showProInfo(id){
	$.get("share/projectInfo",{
		id:id
	},function(html){
		$("#showProInfoArea").html(html);
		$("#showProInfoModal").modal("show");
	});
}
$("#filePath").change(function(){
	var val = $(this).val();
	var pos=val.lastIndexOf("\\");
	$("#fileName").html(val.substring(pos+1));
});
$("#upLoadeFile").click(function(){
	var filePath = $("#filePath").val();
	if(!filePath){
		return;
	}
	$("#filePath").prop("disabled",true);
	$(this).prop("disabled",true);
	$("span",this).html("正在上传");
	$("#errorBtn > span").html(0);
	$("#bulletList").html();
	submitFile($("#filePath")[0],{},"json",function(data){
		actionFormate(data, true,function(){},function(type,msg,data){
			operationLog("导入购房券信息","导入购房券信息");
			if(data){
				var template = Handlebars.compile($("#errorItemTemplate").html());
				var html = $(template(data));
				$("#errorBtn > span").html(data.length);
				$("#bulletList").html(html);
			}
		});
		$("#filePath").val("").change().prop("disabled",false);
		$("#upLoadeFile").prop("disabled",false);
		$("span","#upLoadeFile").html("上传");
	},function(){
		$("#filePath").prop("disabled",false);
		$("#upLoadeFile").prop("disabled",false);
		$("span","#upLoadeFile").html("上传");
	},"housePurchaseMansgement/hptAddUpFile");
});