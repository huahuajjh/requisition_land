function setProListModal(id,fn){
	$.get("share/projectList",function(html){
		$(".modal-content",id).html(html);
	});
	$(id).on('show.bs.modal', function (e) {
		$(id).data("selectData",null);
	});
	$(id).on('hidden.bs.modal', function (e) {
		  var selectData = $(this).data("selectData");
		  if ($.isFunction(fn)) {
			  fn(selectData);
			}
	});
}
function setPersonListModal(id,fn){
	$.get("share/personList",function(html){
		$(".modal-content",id).html(html);
	});
	$(id).on('show.bs.modal', function (e) {
		$(id).data("selectData",null);
	});
	$(id).on('hidden.bs.modal', function (e) {
		  var selectData = $(this).data("selectData");
		  if ($.isFunction(fn)) {
			  fn(selectData);
			}
	});
}
function setHuListModal(id,fn){
	$.get("share/huList",function(html){
		$(".modal-content",id).html(html);
	});
	$(id).on('show.bs.modal', function (e) {
		$(id).data("selectData",null);
	});
	$(id).on('hidden.bs.modal', function (e) {
		  var selectData = $(this).data("selectData");
		  if ($.isFunction(fn)) {
			  fn(selectData);
			}
	});
}
