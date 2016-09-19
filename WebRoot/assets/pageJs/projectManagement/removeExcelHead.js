function exportRemoveExcel(){
	var vals = [];
	$("#selectExportModal input[type='checkbox']:not(:checked)").each(function(){
		vals.push($(this).val());
	});
	var model = exportModol();
	var checkModels = [];
	for (var i = 0; i < model.length; i++) {
		var d = model[i];
		var state = true;
		for (var j = 0; j < vals.length; j++) {
			var val = vals[j];
			if(val == d.id){
				state = false;
			}
		}
		if(state){
			checkModels.push(d);
		}
	}
	var heads = [];
	var keys = [];
	var x = 0;
	var y = 0;
	for (var i = 0; i < checkModels.length; i++) {
		var d = checkModels[i];
		var t = d.fn(x,y);
		y = t.y;
		for (var j = 0; j < t.celData.length; j++) {
			var c = t.celData[j];
			heads.push(c);
		}
		for (var j = 0; j < t.celKey.length; j++) {
			var c = t.celKey[j];
			keys.push({
				attrName:c,
				colIndex:keys.length
			});
		}
	}
	return {heads:heads,keys:keys};
}

function getHuZhuNameHead(x,y){
	var celData = {
		value:"户主姓名",
		colspan:0,
		rowspan:0,
		x:x,
		y:y
	};
	return {
		y:y + 1,
		celData:[celData],
		celKey:["headName"]
	};
}
function getProjectNameHead(x,y){
	var celData = {
		value:"所属项目",
		colspan:0,
		rowspan:0,
		x:x,
		y:y
	};
	return {
		y:y + 1,
		celData:[celData],
		celKey:["proName"]
	};
}
function getHeFaMiHead(x,y){
	var celData = {
		value:"房屋合法面积（平方米）",
		colspan:0,
		rowspan:0,
		x:x,
		y:y
	};
	return {
		y:y + 1,
		celData:[celData],
		celKey:["houseLegalArea"]
	};
}
function getWeiZhangeMiHead(x,y){
	var celData = {
		value:"房屋违章面积（平方米）",
		colspan:0,
		rowspan:0,
		x:x,
		y:y
	};
	return {
		y:y + 1,
		celData:[celData],
		celKey:["houseIllegalArea"]
	};
}
function getDiZhiHead(x,y){
	var celData = {
		value:"所属地址",
		colspan:0,
		rowspan:0,
		x:x,
		y:y
	};
	return {
		y:y + 1,
		celData:[celData],
		celKey:["address"]
	};
}
function getShenPiShuoMingHead(x,y){
	var celData = {
		value:"批证及其他情况说明",
		colspan:0,
		rowspan:0,
		x:x,
		y:y
	};
	return {
		y:y + 1,
		celData:[celData],
		celKey:["satuationDesc"]
	};
}
function getChuLiFangAnHead(x,y){
	var celData = {
		value:"拟定处理方案",
		colspan:0,
		rowspan:0,
		x:x,
		y:y
	};
	return {
		y:y + 1,
		celData:[celData],
		celKey:["dealSolution"]
	};
}
function getHuiShenYiJianHead(x,y){
	var celData = {
		value:"联合会审意见",
		colspan:0,
		rowspan:0,
		x:x,
		y:y
	};
	return {
		y:y + 1,
		celData:[celData],
		celKey:["unionSuggestion"]
	};
}
function getHuBeiZhuHead(x,y){
	var celData = {
		value:"备注",
		colspan:0,
		rowspan:0,
		x:x,
		y:y
	};
	return {
		y:y + 1,
		celData:[celData],
		celKey:["familyRemark"]
	};
}
function getRenYuanNumHead(x,y){
	var celData = {
		value:"家庭成员数",
		colspan:0,
		rowspan:0,
		x:x,
		y:y
	};
	return {
		y:y + 1,
		celData:[celData],
		celKey:["fmlNumber"]
	};
}
function getNameHead(x,y){
	var celData = {
		value:"姓名",
		colspan:0,
		rowspan:0,
		x:x,
		y:y
	};
	return {
		y:y + 1,
		celData:[celData],
		celKey:["name"]
	};
}
function getShenFenZhengHead(x,y){
	var celData = {
		value:"身份证",
		colspan:0,
		rowspan:0,
		x:x,
		y:y
	};
	return {
		y:y + 1,
		celData:[celData],
		celKey:["idNumber"]
	};
}
function getXingBieHead(x,y){
	var celData = {
		value:"性别",
		colspan:0,
		rowspan:0,
		x:x,
		y:y
	};
	return {
		y:y + 1,
		celData:[celData],
		celKey:["gender"]
	};
}
function getXingZhiHead(x,y){
	var celData = {
		value:"户口性质",
		colspan:0,
		rowspan:0,
		x:x,
		y:y
	};
	return {
		y:y + 1,
		celData:[celData],
		celKey:["householdStr"]
	};
}
function getShengRiHead(x,y){
	var celData = {
		value:"出生日期",
		colspan:0,
		rowspan:0,
		x:x,
		y:y
	};
	return {
		y:y + 1,
		celData:[celData],
		celKey:["birthday"]
	};
}
function getWenHuaHead(x,y){
	var celData = {
		value:"文化程度",
		colspan:0,
		rowspan:0,
		x:x,
		y:y
	};
	return {
		y:y + 1,
		celData:[celData],
		celKey:["educationLevel"]
	};
}
function getDuShuHead(x,y){
	var celData = {
		value:"在读情况",
		colspan:0,
		rowspan:0,
		x:x,
		y:y
	};
	return {
		y:y + 1,
		celData:[celData],
		celKey:["currentEducationSituation"]
	};
}
function getLaoDongTimeHead(x,y){
	var celData = {
		value:"从事农业劳动",
		colspan:0,
		rowspan:0,
		x:x,
		y:y
	};
	return {
		y:y + 1,
		celData:[celData],
		celKey:["farmingTime"]
	};
}
function getFLLTimeHead(x,y){
	var celData = {
		value:"服兵役/劳改/劳教情况及时间起止段",
		colspan:0,
		rowspan:0,
		x:x,
		y:y
	};
	return {
		y:y + 1,
		celData:[celData],
		celKey:["serveArmySituation"]
	};
}
function getPhoneHead(x,y){
	var celData = {
		value:"联系电话",
		colspan:0,
		rowspan:0,
		x:x,
		y:y
	};
	return {
		y:y + 1,
		celData:[celData],
		celKey:["tel"]
	};
}
function getDuShengNumHead(x,y){
	var celData = {
		value:"独生子女证件号",
		colspan:0,
		rowspan:0,
		x:x,
		y:y
	};
	return {
		y:y + 1,
		celData:[celData],
		celKey:["onlyChildNumber"]
	};
}
function getIsBanBianHead(x,y){
	var celData = {
		value:"是否半边户",
		colspan:0,
		rowspan:0,
		x:x,
		y:y
	};
	return {
		y:y + 1,
		celData:[celData],
		celKey:["half"]
	};
}
function getIsSheBaoHead(x,y){
	var celData = {
		value:"是否参加过社会保险",
		colspan:0,
		rowspan:0,
		x:x,
		y:y
	};
	return {
		y:y + 1,
		celData:[celData],
		celKey:["userdSocialsecurity"]
	};
}
function getBeiZhuHead(x,y){
	var celData = {
		value:"备注",
		colspan:0,
		rowspan:0,
		x:x,
		y:y
	};
	return {
		y:y + 1,
		celData:[celData],
		celKey:["remark"]
	};
}

function exportModol(){
	return [{
		id:"0",
		fn:getHuZhuNameHead
	},{
		id:"1",
		fn:getProjectNameHead
	},{
		id:"2",
		fn:getHeFaMiHead
	}, {
		id:"3",
		fn:getWeiZhangeMiHead
	},{
		id:"4",
		fn:getDiZhiHead
	},{
		id:"5",
		fn:getShenPiShuoMingHead
	},{
		id:"6",
		fn:getChuLiFangAnHead
	},{
		id:"7",
		fn:getHuiShenYiJianHead
	},{
		id:"8",
		fn:getHuBeiZhuHead
	},{
		id:"9",
		fn:getRenYuanNumHead
	},{
		id: "10",
		fn: getNameHead
	},{
		id:"11",
		fn:getShenFenZhengHead
	},{
		id:"12",
		fn:getXingBieHead
	},{
		id:"13",
		fn:getXingZhiHead
	},{
		id:"14",
		fn:getShengRiHead
	},{
		id:"15",
		fn:getWenHuaHead
	},{
		id:"16",
		fn:getDuShuHead
	},{
		id:"17",
		fn:getLaoDongTimeHead
	},{
		id:"18",
		fn:getFLLTimeHead
	},{
		id:"19",
		fn:getPhoneHead
	},{
		id:"20",
		fn:getDuShengNumHead
	},{
		id:"21",
		fn:getIsBanBianHead
	},{
		id:"22",
		fn:getIsSheBaoHead
	},{
		id:"23",
		fn:getBeiZhuHead
	}];
}