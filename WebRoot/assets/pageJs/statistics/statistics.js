var queryPrNameDom = null;
setProListModal("#selectProInfoModal",function(data){
	if(data){
		$(queryPrNameDom).data("data",data);
		$(queryPrNameDom).val(data.proName);
	}
});

function selectPro(domName){
	queryPrNameDom = domName;
	$("#selectProInfoModal").modal("show");
}

new bindingSelect({
	masterSelect:"#queryStreet_pro",
	childSelect:"#queryCommunity_pro",
	childDefalueVal:"所有社区",
	url:"share/address",
	afterFn:function(data){
		return actionFormate(data, false);
	}
});

new bindingSelect({
	masterSelect:"#queryStreet_cqh",
	childSelect:"#queryCommunity_cqh",
	childDefalueVal:"所有社区",
	url:"share/address",
	afterFn:function(data){
		return actionFormate(data, false);
	}
});
new bindingSelect({
	masterSelect:"#queryCommunity_cqh",
	childSelect:"#queryZu_cqh",
	childDefalueVal:"所有组",
	url:"share/address",
	afterFn:function(data){
		return actionFormate(data, false);
	}
});

new bindingSelect({
	masterSelect:"#queryStreet_gfq",
	childSelect:"#queryCommunity_gfq",
	childDefalueVal:"所有社区",
	url:"share/address",
	afterFn:function(data){
		return actionFormate(data, false);
	}
});
new bindingSelect({
	masterSelect:"#queryCommunity_gfq",
	childSelect:"#queryZu_gfq",
	childDefalueVal:"所有组",
	url:"share/address",
	afterFn:function(data){
		return actionFormate(data, false);
	}
});

$("#gfq_form").submit(function(){
	$.post("",$(this).serialize(),function(data){
		actionFormate(data, false,function(type,msg,data){
			var template = Handlebars.compile($("#gfqTemplate").html());
			var html = $(template(data));
			$("#gfq_statistics_data").html(html);
		});
	},"json");
	return false;
});
$("#sb_form").submit(function(){
	$.post("",$(this).serialize(),function(data){
		actionFormate(data, false,function(type,msg,data){
			var template = Handlebars.compile($("#sbTemplate").html());
			var html = $(template(data));
			$("#sb_statistics_data").html(html);
		});
	},"json");
	return false;
});
$("#zh_form").submit(function(){
	$.post("",$(this).serialize(),function(data){
		actionFormate(data, false,function(type,msg,data){
			var template = Handlebars.compile($("#zhTemplate").html());
			var html = $(template(data));
			$("#zh_statistics_data").html(html);
		});
	},"json");
	return false;
});
$("#cqh_form").submit(function(){
	$.post("",$(this).serialize(),function(data){
		actionFormate(data, false,function(type,msg,data){
			var template = Handlebars.compile($("#cqhTemplate").html());
			var html = $(template(data));
			$("#cqh_statistics_data").html(html);
		});
	},"json");
	return false;
});
$("#pro_form").submit(function(){
	$.post("",$(this).serialize(),function(data){
		actionFormate(data, false,function(type,msg,data){
			var template = Handlebars.compile($("#proTemplate").html());
			var html = $(template(data));
			$("#pro_statistics_data").html(html);
		});
	},"json");
	return false;
});