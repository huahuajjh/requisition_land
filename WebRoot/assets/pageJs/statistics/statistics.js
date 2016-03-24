var tableData = $.generateData({	
	pageArea : "#pageArea",
	dataAreaId : "#entrytemplate",
	dataArea : "#dataTbody",
	url : sendUrl.statistics_getData,
	urlType : "get",
	firstFn : function(data) {
		data.pageSize = 30;
		var startDate = $("#startDate").val();
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
		var tempData = actionFormate(data, false) || {datas:[],totalCount:0};
		for (var i = 0; i < tempData.datas.length; i++) {
			var d = tempData.datas[i];
			
			var template = Handlebars.compile($("#algorithmTemplate").html());
			var moneyUnitMsg = template({
				name:"拆迁人员",
				num:d.totalPopu,
				money:d.personalSubsidyStd,
				countMoney:d.totalPopu * d.personalSubsidyStd
			});
			d.moneyUnitMsg = moneyUnitMsg;
			var onlyChildMsg =  template({
				name:"独生子女",
				num:d.onlyChildCount,
				money:d.nonLrbStd,
				countMoney:d.onlyChildCount * d.nonLrbStd
			});
			var halfMsg =  template({
				name:"半边户",
				num:d.halfCount,
				money:d.nonLrbStd,
				countMoney:d.halfCount * d.nonLrbStd
			});
			var notHalfMsg =  template({
				name:"非半边户",
				num:d.totalPopu - d.halfCount,
				money:d.nonLrbStd,
				countMoney:(d.totalPopu - d.halfCount) * d.nonLrbStd
			});
			d.otherMoneyUnitMsg = onlyChildMsg + halfMsg + notHalfMsg;
		}
		return tempData;
	}
});