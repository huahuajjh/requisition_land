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
	url : "housePurchaseMansgement/hptExchangeBillList",
	firstFn : function(data) {
		data.pageNum = $("#dataPageCount").val();
		var queryPrName =  $("#queryPrName");
		if(queryPrName.data("data")){
			var state = queryPrName.data("data").proName == queryPrName.val();
			if(state){
				data.proId = queryPrName.data("data").id;
			}
		}
		var num = $("#queryQuanNum").val();
		if(num){
			data.num = num;
		}
		var idNumber = $("#queryIdNumber").val();
		if(idNumber){
			data.idNumber = idNumber;
		}
		var name = $("#queryName").val();
		if(name){
			data.name = name;
		}
	}, lastFn : function(data) {
		var tempData = actionFormate(data, false);
		$("#countArea").html(tempData.totalCount);
		return tempData;
	}, domFn:function(dom){
		$('[data-toggle="tooltip"]',dom).tooltip();
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
	lastFn:function(data){
		return actionFormate(data,false);
	},itemClick:function(data){
		$("#queryPrName").data("data",data);
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