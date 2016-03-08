$("#addRemoveInfo").validate({
	rules: {
		name: {
		    required: true
		}, idNumber:{
			required: true,
			minlength:18
		}, birthday:{
			required: true
		}, removeDate:{
			required: true
		}, street:{
			required: true
		}, community:{
			required: true
		}, zu:{
			required: true
		}
	},  submitHandler:function(form){
		var subData ={};
		subData.name = $("[name='name']",form).val();
		subData.idNumber = $("[name='idNumber']",form).val();
		subData.birthday = $("[name='birthday']",form).val();
		subData.removeDate = $("[name='removeDate']",form).val();
		subData.streetId = $("[name='street']",form).val();
		subData.communityId = $("[name='community']",form).val();
		//subData.groupId = $("[name='zu']",form).val();
		subData.address = $("[name='street'] option:selected",form).html();
		subData.address += $("[name='community'] option:selected",form).html();
		//subData.address += $("[name='zu'] option:selected",form).html();
		subData.address += "," + $("[name='other']",form).val();
		
		subData.suitPolicy = $("[name='suitPolicy']",form).val();
		
		$.post(sendUrl.removedInfo_add,{
			entity:JSON.stringify(subData)
		},function(data){
			actionFormate(data, true,function(){
				 operationLog("手工添加已拆迁户","手工添加已拆迁户");
				$("#addRemoveInfo")[0].reset();
			});
		},"json");
    }
});
//new bindingSelect({
//	masterSelect:"#community",
//	childSelect:"#zu",
//	childDefalueVal:"请选择组",
//	url:"share/address",
//	afterFn:function(data){
//		return actionFormate(data, false);
//	}
//});
new bindingSelect({
	masterSelect:"#street",
	childSelect:"#community",
	childDefalueVal:"请选择社区",
	url:"share/address",
	afterFn:function(data){
		return actionFormate(data, false);
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
		actionFormate(data, true,function(){},function(type,msg,data){
		operationLog("导入拆迁户","导入拆迁户信息");
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
	},"removedDocManagement/removedInfoAddUpFile");
});