var mainHtml = getShareData("uploadRemoveInfo");
if(mainHtml){
	setShareData("uploadRemoveInfo",null);
	$(".main").html(mainHtml);
} else {
	setShareData("uploadRemoveInfo",$(".main > *"));
	initDom();
}
function initDom(){
	new bindingSelect({
		masterSelect:"#community",
		childSelect:"#zu",
		childDefalueVal:"请选择组",
		url:"share/address",
		afterFn:function(data){
			return actionFormate(data, false);
		}
	});
	new bindingSelect({
		masterSelect:"#street",
		childSelect:"#community",
		childDefalueVal:"请选择社区",
		url:"share/address",
		afterFn:function(data){
			return actionFormate(data, false);
		}
	});
	submitFileStyle("#upLoadFile","HOUSE_IMG",function(data){
		actionFormate(data, true,function(type,msg,d){
			var file = {};
			file.fileValue = d;
			file.fileName = d.substring(0,d.indexOf("/"));
			file.filePath = d.substring(d.indexOf("/") + 1);
			var template = Handlebars.compile($("#fileItemTemplate").html());
			var html = template(file);
			$("#fileItems").append(html);
		});
	});
	submitFileStyle("#lHshFJDom","EVIDENCE_FILE",function(data){
		return actionFormate(data, true);
	});
	$("#personInfoModal").validate({
		rules:{
			name:{
				required : true
			},relationship:{
				required : true
			},idNumber:{
				required : true,
				minlength : 18
			},birthday:{
				required : true
			},gender:{
				required : true
			}, householdId:{
				required : true
			}
		}, submitHandler:function(form){
			var data = {};
			data.name = $("[name='name']",form).val();
			data.idNumber = $("[name='idNumber']",form).val();
			data.birthday = $("[name='birthday']",form).val();
			
			data.gender =  $("[name='gender']",form).val();
			data.genderStr =  $("[name='gender'] option:selected",form).html();
			if($("[name='onlyChildNumber']",form).val()){
				data.onlyChildNumber = $("[name='onlyChildNumber']",form).val();
			}
			data.half = $("[name='half']",form).prop("checked");
			
			data.relationshipId = $("[name='relationship']",form).val();
			data.relationshipStr = $("[name='relationship'] option:selected",form).html();

			data.householdId = $("[name='householdId']",form).val();
			data.householdStr = $("[name='householdId'] option:selected",form).html();

			data.educationLevel = $("[name='educationLevel']",form).val();
			data.currentEducationSituation = $("[name='currentEducationSituation']",form).val();
			data.farmingTime = $("[name='farmingTime']",form).val();
			data.serveArmySituation = $("[name='serveArmySituation']",form).val();
			data.tel = $("[name='tel']",form).val();
			data.userdSocialsecurity = $("[name='userdSocialsecurity']",form).prop("checked");
			data.remark = $("[name='remark']",form).val();
			
			var template = Handlebars.compile($("#familyItemTemplate").html());
			var html = $(template(data));
			html.attr("data",JSON.stringify(data));
			$("#familyItems").append(html);
			var dom = $("#personInfoModal").data("dom");
			if(dom){
				dom.remove();
			}
			$("#personInfoModal").modal("hide");
			initFamilyNum();
			$("#showHuZhuName").html(getHuZhuMing());
		}
	});
	$("#addForm").validate({
		rules : {
			houseLegalArea : {
				number : true,
				maxlength : 10,
				min : 0
			},
			houseIllegalArea : {
				number : true,
				maxlength : 10,
				min : 0
			},
			street : {
				required : true
			},
			community : {
				required : true
			},
			zu : {
				required : true
			},
			pzqksm : {
				maxlength : 140
			},
			ndclfa : {
				maxlength : 140
			},
			lhhsyj : {
				maxlength : 140
			},
			bz : {
				maxlength : 140
			}
		},
		submitHandler : function(form) {
			var proDataId = $("#proData").attr("proId");
			var proDataName = $("#proData").attr("proName");
			var proData  = {id:proDataId,proName:proDataName};
			if(!proDataName || !proDataId){
				$("#subDataBtn").popover({
					content : "请选择所属项目",
					placement : "left"
				});
				$("#subDataBtn").popover("show");
				setTimeout(function() {
					$("#subDataBtn").popover("destroy");
				}, 1000);
				return;
			}
			if (!isSelectedHuZhu()) {
				$("#subDataBtn").popover({
					content : "请录入户主信息",
					placement : "left"
				});
				$("#subDataBtn").popover("show");
				setTimeout(function() {
					$("#subDataBtn").popover("destroy");
				}, 1000);
				return;
			}
			//录入项目信息
			var removeInfo = {};
			removeInfo.headName = getHuZhuMing();
			removeInfo.proId = proData.id;
			removeInfo.streetId = $("#street").val();
			removeInfo.communityId = $("#community").val();
			removeInfo.address= addreddQuanMing();
			removeInfo.fmlNumber = parseInt($("> .row","#familyItems").size());
			if($("#houseLegalArea").val()){
				removeInfo.houseLegalArea = parseFloat($("#houseLegalArea").val());
			}
			if($("#houseIllegalArea").val()){
				removeInfo.houseIllegalArea = parseFloat($("#houseIllegalArea").val());
			}
			removeInfo.satuationDesc = $("#satuationDesc").val();
			removeInfo.dealSolution = $("#dealSolution").val();
			removeInfo.unionSuggestion = $("#unionSuggestion").val();
			removeInfo.remark = $("#remark").val();
			removeInfo.proName = proData.proName;
			removeInfo.groupId = $("#zu").val();
			removeInfo.unionSuggestionPath = $("#lianheVal").val();
			var fileItems = "";
			$("input[name='fileItem']","#fileItems").each(function(){
				fileItems = fileItems + $(this).val() + "|";
			});
			removeInfo.houseImgPath = fileItems.substring(0, fileItems.length - 1);
			removeInfo.items = [];
			var huZhuIdNumber = "";
			var yiQianHus = [];
			$("> .row", "#familyItems").each(function(){
				var item = JSON.parse($(this).attr("data"));
				item.streetId = $("#street").val();
				item.communityId = $("#community").val();
				item.groupId = $("#zu").val();
				item.address = addreddQuanMing();
				item.proId = proData.id;
				item.proName = proData.proName;
				if(item.relationshipStr == "户主"){
					huZhuIdNumber = item.idNumber;
				}
				removeInfo.items.push(item);
				var yiQianHu = {};
				yiQianHu.name = item.name;
				yiQianHu.idNumber = item.idNumber;
				yiQianHu.birthday = item.birthday;
				yiQianHu.address = item.address;
				yiQianHu.streetId = item.streetId;
				yiQianHu.communityId = item.communityId;
				yiQianHus.push(yiQianHu);
			});
			$.post("projectManagement/uploadRemoveInfoAdd",{
				dataJson:JSON.stringify(removeInfo)
			},function(data){
				 actionFormate(data, true,function(){
						$.post(sendUrl.removedInfo_addBatch,{
							list:JSON.stringify(yiQianHus)
						},function(data){
							actionFormate(data, true,function(){
								 operationLog("手工添加已拆迁户","手工添加已拆迁户");
								 resestData();
							 });
						},"json");
					operationLog("手工添加拆迁户","手工添加拆迁户");
				 });
			},"json");
		}
	});
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
			actionFormate(data, true,function(type,msg,data){
				operationLog("导入拆迁户","导入拆迁户信息");
				if(data){
					$.post(sendUrl.removedInfo_addBatch,{
						list:JSON.stringify(data)
					},function(data){
						actionFormate(data, true);
					},"json");
				}
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
		},"projectManagement/uploadRemoveInfoUpFile");
	});
}
setProListModal("#showProInfoModal",function(data){
	if(data){
		$("#proData").attr("proId",data.id);
		$("#proData").attr("proName",data.proName);
		$("#proName").html(data.proName);
	}
});
function resestData() {
	setShareData("uploadRemoveInfo",null);
	$("#showHuZhuName").html("");
	$("#addForm")[0].reset();
	$("> li","#fileItems").remove();
	$("#proName").html("");
	$("#proData").attr("proId","");
	$("#proData").attr("proName","");
	$("> .row","#familyItems").remove();
	initFamilyNum();
}
function addreddQuanMing(){
	var street = $("#street option:selected").html();
	var community = $("#community option:selected").html();
	var zu = $("#zu option:selected").html();
	return street+ community + zu;
}
function deleteFileItem(dom){
	$(dom).closest("li").remove();
}
function showImage(imgSrc){
	$.initShowImage([imgSrc]);
}
function isSelectedHuZhu(){
	var state = false;
	$("> .row","#familyItems").each(function(){
		var relationshipStr = JSON.parse($(this).attr("data")).relationshipStr;
		if(relationshipStr == "户主"){
			state = true;
		}
	});
	return state;
}
function getHuZhuMing(){
	var name = "";
	$("> .row","#familyItems").each(function(){
		var data = JSON.parse($(this).attr("data"));
		var relationshipStr = data.relationshipStr;
		if(relationshipStr == "户主"){
			name = data.name;
		}
	});
	return name;
}
function initFamilyNum(){
	$("#showHuZhuName").html(getHuZhuMing());
	$("[familyCount]").html($("> .row","#familyItems").size());
}
function deleteFimalyItem(dom){
	 $(dom).closest(".row").remove();
	 initFamilyNum();
}
function fimalyItem(dom){
	var data = {};
	if(dom){
		data = JSON.parse($(dom).closest(".row").attr("data"));
		$("#personInfoModal").data("dom",$(dom).closest(".row"));
	} else{
		$("#personInfoModal").data("dom",null);
	}
	var template = Handlebars.compile($("#fimalyItemEditTemplate").html());
	var html = $(template(data));
	$("[name='relationship']",html).val(data.relationshipId);
	$("[name='gender']",html).val(data.gender);
	$("[name='householdId']",html).val(data.householdId);
	$("[name='relationship']",html).val(data.relationshipId);
	$("[name='relationship']",html).val(data.relationshipId);
	$("[name='relationship']",html).val(data.relationshipId);
	$("[name='relationship']",html).val(data.relationshipId);
	$("[name='relationship']",html).val(data.relationshipId);
	$('[data-plugin-datepicker]',html).each(function() {
		var $this = $(this), opts = {};
		$this.themePluginDatePicker(opts);
	});
	$('[data-plugin-masked-input]',html).each(function() {
		var $this = $(this), opts = {};

		var pluginOptions = $this.data('plugin-options');
		if (pluginOptions)
			opts = pluginOptions;
		$this.themePluginMaskedInput(opts);
	});
	if(isSelectedHuZhu()){
		$('[name="relationship"] option',html).each(function(){
			if($(this).html() == "户主"){
				$(this).css("display","none");
			}
		});
	}else{
		$('[name="relationship"] option',html).css("display","block");
	}
	html.data("data",data);
	$("#fimalyItemInfoArea").html(html);
	$("#personInfoModal").modal("show");
}