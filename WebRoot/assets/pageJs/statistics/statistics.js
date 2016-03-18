var tableData = $.generateData({	
	pageArea : "#pageArea",
	dataAreaId : "#entrytemplate",
	dataArea : "#dataTbody",
	url : sendUrl.statistics_getData,
	urlType : "get",
	firstFn : function(data) {
		data.pageSize = 30;
		var startDate = $("#startDate").val();
		console.log(startDate);
		if(!startDate){
			startDate = "1900-1-1";
		}
		data.startDate = startDate;
		var endDate = $("#endDate").val();
		if(!endDate){
			endDate = "1900-1-1";
		}
		data.endDate = endDate;
	},
	lastFn : function(data) {
		var tempData = actionFormate(data, false);
		return tempData;
	}
});