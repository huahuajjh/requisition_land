$("#organization").change(
		function() {
			var thisVal = $(this).val();
			$("#department").empty();
			$("#department").append('<option value="">请选择部门</option>');
			if (!thisVal)
				return;
			$.post("management/sysDeptManagementList", {
				orgId : thisVal
			}, function(data) {
				var datas = actionFormate(data, false);
				for ( var d in datas) {
					$("#department").append(
							'<option value="' + datas[d].id + '">' + datas[d].name + '</option>');
				}
			}, "json");
		});
var tableData = $.generateData({
	pageArea : "#pageArea",
	dataAreaId : "#entrytemplate",
	dataArea : "#dataTbody",
	url : "management/sysAccountQueryList",
	firstFn : function(data) {
		data.pageNum = $("#dataPageCount").val();
		data.account = $("#username").val();
		data.name = $("#name").val();
		data.orgId = $("#organization").val();
		data.deptId = $("#department").val();
	},
	lastFn : function(data) {
		var tempData = actionFormate(data, false);
		$("#accountCount").html(tempData.totalCount);
		return tempData;
	}
});
$("#dataPageCount").change(function() {
	tableData.setPageNum(parseInt($(this).val()));
	tableData.refreshData();
});
$('#editAccountModal').modal({
	backdrop : "static",
	keyboard : false,
	show : false
});
var tr = null;
var selectDepId = "";
function editAccount(dom) {
	tr = $(dom).closest("tr");
	var dataId = tr.attr("dataId");
	var dataAccount = tr.attr("dataAccount");
	var dataName = tr.attr("dataName");
	var dataDeptId = tr.attr("dataDeptId");
	var dataOrgId = tr.attr("dataOrgId");
	var dataRoleId = tr.attr("dataRoleId");
	$("#editId").val(dataId);
	$("#editAccount").html(dataAccount);
	$("#editName").val(dataName);
	$("option[value='" + dataOrgId + "']", "#editOrgId").prop("selected", true);
	$("option[value='" + dataRoleId + "']", "#editRoleId").prop("selected", true);
	selectDepId = dataDeptId;
	$("#editOrgId").change();
	$('#editAccountModal').modal('show');
}
function reset(id){
	if(!confirm("确定要重置密码？")) return;
	$.post("management/sysAccountQueryReset",{id:id},function(data){
		 actionFormate(data, true);
	},"json");
}
function disable(id){
	if(!confirm("确定要冻结用户？")) return;
	$.post("management/sysAccountQueryDisable",{id:id},function(data){
		 actionFormate(data, true);
		 tableData.refreshData();
	},"json");
}
$("#editOrgId").change(
		function() {
			var thisVal = $(this).val();
			$("#editDeptId").empty();
			$("#editDeptId").append('<option value="">请选择部门</option>');
			if (!thisVal)
				return;
			$.post("management/sysDeptManagementList", {
				orgId : thisVal
			}, function(data) {
				var datas = actionFormate(data, false);
				for ( var d in datas) {
					$("#editDeptId").append(
							'<option value="' + datas[d].id + '" '
									+ (datas[d].id == selectDepId ? "selected" : "")
									+ '>' + datas[d].name + '</option>');
				}
			}, "json");
		});
$("#editAccountModal").validate({
	rules : {
		name : {
			required : true,
			maxlength : 5
		},
		orgId : {
			required : true
		},
		roleId : {
			required : true
		}
	},
	messages : {
		name : {
			required : "姓名不能为空",
			maxlength : "姓名格式不正确"
		},
		orgId : {
			required : "请选择组织"
		},
		deptId : {
			required : "请选择部门"
		},
		roleId : {
			required : "请选择角色"
		}
	},
	submitHandler : function(form) {
		var subData = {};
		var data = tr.data("data");
//		/**账户id*/
		subData.id = data.id;
//		/**账户名*/
		subData.account = data.account;
//		/**账户密码*/
		subData.pwd = data.pwd;
//		/**姓名*/
		subData.name = $("#editName").val();
		if($("#editDeptId").val()){
	//		/**账户所属部门id*/
			subData.deptId = $("#editDeptId").val();
	//		/**账号所属部门名称*/
			subData.depName  = $("#editDeptId option:selected").html();
		}
//		/**账户所属组织id*/
		subData.orgId   = $("#editOrgId").val();
//		/**账号所属组织的名称*/
		subData.orgName  = $("#editOrgId option:selected").html();
//		/**账户角色id*/
		subData.roleId = $("#editRoleId").val();
//		/**账户角色名称*/
		subData.roleName = $("#editRoleId option:selected").html();
		$.post("management/sysAccountQueryEdit",{
			dataJson:JSON.stringify(subData)
		},function(data){
			actionFormate(data, true,function(){
				$("#editAccountModal").modal('hide');
			});
		},"json");
	}
});