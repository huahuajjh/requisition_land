$("#addProform").validate({
	rules : {
		approvalNumber : {
			required : true,
			maxlength : 20
		},
		proName : {
			required : true,
			maxlength : 20
		},
		proTypeCode : {
			required : true
		},proCategory:{
			required : true
		}, requisitionArea : {
			required : true,
			number : true,
			maxlength : 10,
			min : 0
		},
		shouldRemoveBuildings : {
			required : true,
			maxlength : 10,
			digits : true,
			min : 0
		},
		shouldRemoveHouses : {
			required : true,
			maxlength : 10,
			digits : true,
			min : 0
		},
		shouldMovePopulation : {
			required : true,
			maxlength : 10,
			digits : true,
			min : 0
		},
		shouldRemoveLegalArea : {
			required : true,
			maxlength : 10,
			number : true,
			min : 0
		},
		shouldRemoveIllegalArea : {
			required : true,
			maxlength : 10,
			number : true,
			min : 0
		},
		shouldPayMoney : {
			required : true,
			maxlength : 15,
			number : true,
			min : 0
		},sixForwardPro:{
			required : true
		}
	},
	submitHandler : function(form) {
		var subData = {};
		subData.proName = $("[name='proName']",form).val();//项目名称
		subData.proCategory = $("[name='proCategory']",form).val();//项目分类
		subData.approvalNumber = $("[name='approvalNumber']",form).val();//项目审批号
		subData.requisitionArea = $("[name='requisitionArea']",form).val();//征地面积
		subData.shouldRemoveBuildings = $("[name='shouldRemoveBuildings']",form).val();//应拆栋数
		subData.shouldRemoveHouses = $("[name='shouldRemoveHouses']",form).val();//应拆户数
		subData.shouldRemoveLegalArea = $("[name='shouldRemoveLegalArea']",form).val();//应拆合法总面积
		subData.shouldRemoveIllegalArea = $("[name='shouldRemoveIllegalArea']",form).val();//应拆违章总面积
		subData.shouldMovePopulation = $("[name='shouldMovePopulation']",form).val();//应动迁人口
		subData.shouldPayMoney = $("[name='shouldPayMoney']",form).val();//项目应付补偿款
		subData.proType = $("[name='proTypeCode']",form).val();//項目類型id
		subData.proTypeStr = $("[name='proTypeCode'] option:selected",form).html();//項目類型文本
		subData.sixForwardPro = $("[name='sixForwardPro']",form).val();//是否六前项目
		
		var address = [];
		var street = [];
		var community = [];
		$("> .tag","#addressItems").each(function(){
			var datas = $(this).data("datas");
			var addressVal = "";
			for (var i = 0; i < datas.length; i++) {
				var d = datas[i];
				if(i == 0){
					addressVal = addressVal + d.name;
					street.push(d.id);
				} else if(i == 1){
					addressVal = addressVal + d.name;
					community.push(d.id);
				}
			}
			address.push(addressVal);
		});
		var addressOrder = $('[name="addressOrder"]',form).val();
		if(addressOrder){
			address.push(addressOrder);
		}
		subData.address =  address.join(",");
		subData.street = street.join(",");
		subData.community = community.join(",");

		$.post("projectManagement/pmAddProAdd",{
			dataJson:JSON.stringify(subData)
		},function(data){
			actionFormate(data, true, function() {
				
				var template = Handlebars.compile($("#logItemTemplate").html());
				var logHtml = template(subData);
				operationLog("手工添加项目信息","手工添加项目信息",logHtml);
				
				$(form)[0].reset();
				$("#addressItems").empty();
				$("#selectType").mSelect().init();
			});
		},"json");
	}
});
$("#selectType").mSelect({
	url:"share/address",
	onAfterRequest:function(data){
		return actionFormate(data, false,function(type,msg,data){
			for (var i = 0; i < data.length; i++) {
				var d = data[i];
				$("> .tag","#addressItems").each(function(){
					if($(this).data("data").id == d.id){
						d.isDisabled = true;
					}
				});
			}
		});
	}, onClickItem:function(data,state){
		var datas = $("#selectType").mSelect().getDatas();
		var tempState = false;
		if(!state){
			tempState = true;
		} else if(datas.length > 1){
			tempState = true;
		}
		if(tempState){
			var nameArr = [];
			for (var i = 0; i < datas.length; i++) {
				var d = datas[i];
				nameArr.push(d.name);
			}
			$("#selectType").mSelect().hide();
			$("#selectType").mSelect().init();
			var tempData = $.extend({}, data);
			tempData.name = nameArr.join("");
			var template = Handlebars.compile($("#addreddItemTemplate").html());
			var html = $(template(tempData));
			html.data("data",data);
			html.data("datas",datas);
			$("> span",html).click(deleteAddressItem);
			$("#addressItems").append(html);
			return false;
		}
	}
});
$("#addressItems").click(function(){
	$("#selectType").mSelect().toggleShow();
});
function addYear(){
	var date = new Date();
    var year = date.getFullYear() - 1;
	for (var i = year; i < year + 3; i++) {
		$("#addYearSelect").append('<option value="'+i+'">'+i+'</option>');
	}
}
addYear();
function deleteAddressItem(event){
	$(this).closest(".tag").remove();
	event.stopPropagation();
}
$("#filePath").change(function(){
	var val = $(this).val();
	var pos=val.lastIndexOf("\\");
	$("#fileName").html(val.substring(pos+1));
});
$("#upLoadeFile").click(function(){
	var filePath = $("#filePath").val();
	if(!filePath) return;
	$("#filePath").prop("disabled",true);
	$(this).prop("disabled",true);
	$("span",this).html("正在上传");
	$("#errorBtn > span").html(0);
	$("#bulletList").html("");
	submitFile($("#filePath")[0],{
		year:$('#addYearSelect').val(),
		month:$('#addMonthSelect').val(),
	},"json",function(data){
		actionFormate(data, true,function(type,msg,data){
			var template = Handlebars.compile($("#logImportItemTemplate").html());
			var html = template({
				time:$('#addYearSelect').val() + "/" +$('#addMonthSelect').val() ,
				list:data
			});
			operationLog("导入项目信息","导入项目信息",html);
		},function(type,msg,data){
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
	},"projectManagement/pmAddProUpFile");
});