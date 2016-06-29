<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
</div>
</div>
</div>
<div class="clearfix"></div>
<form class="modal fade" id="editUserPassword" data-backdrop="static">
  <div class="modal-dialog" >
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">修改密码</h4>
      </div>
      <div class="modal-body">
        <div class="form-group">
			<label>旧密码<span class="text-danger">*</span></label>
			<input type="password"  name="oldPassword" maxlength="15" class="form-control" placeholder="请输入旧密码">
		</div>
		<hr/>
		<div class="form-group">
			<label>新密码<span class="text-danger">*</span></label>
			<input type="password" id="newPassword" name="newPassword"  maxlength="15"  class="form-control" placeholder="请输入新密码">
		</div>
		<div class="form-group">
			<label>再次输入新密码<span class="text-danger">*</span></label>
			<input type="password" name="repeatPassword"  maxlength="15"  class="form-control" placeholder="请重复输入新密码">
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn btn-primary">保存</button>
      </div>
    </div>
  </div>
</form>
<script id="leftMenuEntryTemplate" type="text/x-handlebars-template">
{{#each this}}
{{#if this.child}}
<li class="nav-parent" data-name="{{this.name}}" data-id="{{this.id}}">
	<a>
		<span>{{this.name}}</span>
	</a>
	<ul class="nav nav-children">
		{{#each this.child}}
		<li>
			<a href="{{this.link}}">
				<span class="text">{{this.name}}</span>
			</a>
		</li>
		{{/each}}
	</ul>
</li>
{{else}}
<li data-name="{{this.name}}" data-id="{{this.id}}">
	<a href="{{this.link}}">
		<span>{{this.name}}</span>
	</a>
</li>
{{/if}}
{{/each}}
 </script>
<script id="topMenuEntryTemplate" type="text/x-handlebars-template">
	<li role="presentation" thisId="{{id}}"><a href="javascript:;">{{name}}</a></li>
 </script>
<script type="text/javascript" src="assets/js/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/submitFile.js"></script>
<script type="text/javascript" src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/core.min.js"></script>
<script src="assets/plugins/jquery-validation/jquery.validate.js" type="text/javascript"></script>
<script src="assets/plugins/jquery-validation/messages_zh.min.js" type="text/javascript"></script>
<script src="assets/plugins/jqPaginator/jqPaginator.js" type="text/javascript"></script>
<script src="assets/plugins/jqPaginator/handlebars-v4.0.5.js" type="text/javascript"></script>
<script src="assets/plugins/jqPaginator/generateData.js" type="text/javascript"></script>
<script src="assets/plugins/JBox/jBox.min.js" type="text/javascript"></script>
<script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="assets/plugins/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
<script src="assets/js/date&timePicker.js" type="text/javascript"></script>
<script src="assets/plugins/maskedinput/js/jquery.maskedinput.js"></script>
<script src="assets/plugins/dropDownInput/dropDownInput.js"></script>
<script src="assets/plugins/zoom/js/zoom.js"></script>
<script src="assets/js/ticketState.js"></script>
<script src="assets/plugins/summernote/js/summernote.js"></script>
<script src="assets/js/pages/form-editors.js"></script>
<script src="assets/plugins/mSelect/mSelect.js"></script>
<script src="assets/plugins/summernote/js/summernote-zh-CN.js"></script>
<script src="assets/js/URL.js"></script>
<script type="text/javascript" src="assets/js/select.js"></script>
<script type="text/javascript" src="assets/js/showProListModal.js"></script>
<script type="text/javascript" src="assets/js/operationLog.js"></script>
<script type="text/javascript" src="assets/js/base64.js"></script>
<script type="text/javascript" src="assets/js/idNumberCheck.js"></script>
<script type="text/javascript" src="assets/js/jquery.nicescroll.js"></script>
<script type="text/javascript">
	Handlebars.registerHelper("dengYu",function(v1,v2,options){
		if(v1 == v2){
			return options.fn(this);
		}else{
			return options.inverse(this);
		}
	});
	Handlebars.registerHelper("dy",function(v1,v2,options){
		if((v1 || 0) > (v2 || 0)){
			return options.fn(this);
		}else{
			return options.inverse(this);
		}
	});
	Handlebars.registerHelper("dydy",function(v1,v2,options){
		if((v1 || 0) >= (v2 || 0)){
			return options.fn(this);
		}else{
			return options.inverse(this);
		}
	});
	Handlebars.registerHelper("xy",function(v1,v2,options){
		if((v1 || 0) < (v2 || 0)){
			return options.fn(this);
		}else{
			return options.inverse(this);
		}
	});
	Handlebars.registerHelper("xydy",function(v1,v2,options){
		if((v1 || 0) <= (v2 || 0)){
			return options.fn(this);
		}else{
			return options.inverse(this);
		}
	});
	$("#editUserPassword").on('hidden.bs.modal', function (e) {
		  this.reset();
	});
	$("#editUserPassword").validate({
				rules : {
					oldPassword : {
						required : true,
						minlength : 5
					}, newPassword : {
						required : true,
						minlength : 5
					}, repeatPassword : {
						required : true,
						minlength : 5,
						equalTo:"#newPassword"
					}
				}, submitHandler : function(form) {
					$.post("editPassword.do",$(form).serialize(),function(data){
						actionFormate(data, true,function(type,msg,datas){
							$("#editUserPassword").modal("hide");
						});
					},"json");
				}
			});
	function initMenuData(id, datas, dataTemp) {
		for ( var key in datas) {
			var data = datas[key];
			if (!id && !data.pId) {
				dataTemp.push(data) ;
				initMenuData(data.id, datas, data);
			} else if (id == data.pId) {
				if (!dataTemp.child)
					dataTemp.child = [];
				dataTemp.child.push(data);
				initMenuData(data.id, datas, data);
			}
		}
	}

	function initDomMenuLeft(menuDatas) {
		var leftMenuTemplate = Handlebars.compile($("#leftMenuEntryTemplate").html());
		$("li", "#menuLeftArea").remove();
		var html = leftMenuTemplate(menuDatas);
		$("#menuLeftArea").append(html);
	}

	function pageChange() {
		var val = location.hash;
		if (!val || val == "#")
			return;
		val = val.substring(1);
		$.get(val, function(html) {
			$(".nav-sidebar li").removeClass("active").removeClass("nav-expanded");
			$("a[href='" + location.hash + "']").parents("li").addClass("active");
			$("a[href='" + location.hash + "']").parents("li.nav-parent").addClass("nav-expanded");
			$(".main").html(html);
			initPageDom();
		});
	}
	
	function orderData(data){
		if(data.child){
			data.child.sort(by("order"));
			for ( var i in data.child) {
				var d = data.child[i];
				orderData(d);
			}
		}
	}
	
	function initPageLoad() {
		//初始化数据
		$.post("getRes.do",function(data){
			actionFormate(data, false,function(type,msg,datas){
				var menuData = [];
				initMenuData(null,datas,menuData);
				menuData.sort(by("order"));
				for ( var i in menuData) {
					orderData(menuData[i]);
				}
				initDomMenuLeft(menuData);
				pageChange();
			});
			initShowMenu();
		},"json");
	}
	
	function by(name, minor) {
        return function (o, p) {
            var a, b;
            if (typeof o === "object" && typeof p === "object" && o && p) {
                a = o[name];
                b = p[name];
                if (a === b) { return typeof minor === 'function' ? minor(o, p) : 0; }
                if (typeof a === typeof b) { return a < b ? -1 : 1; }
                return typeof a < typeof b ? -1 : 1;
            }
            else { throw ("error"); }
        }
    }
	initPageLoad();
</script>
</body>
</html>