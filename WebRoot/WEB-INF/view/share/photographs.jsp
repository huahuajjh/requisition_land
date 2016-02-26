<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="panel panel-default">
	<div class="panel-body">
		<div id="paiZhaoArea">
			<video id="showPaiZhao" autoplay="autoplay" style="width: 100%;height: 627px;"></video>
		</div>
		<div id="showImageArea" style="display: none;">
			<div id="paiZhaoVal">
				<canvas id="paiZhaoCanvas" style="width: 100%;height: 627px;"></canvas>
			</div>
		</div>
	</div>
	<div class="panel-footer text-right">
		<button type="button" disabled class="bk-margin-5 btn btn-default btn-sm" id="chongPaiBtn">重新拍照</button>
		<button type="button" disabled class="bk-margin-5 btn btn-success btn-sm" id="shiYongBtn">使用照片</button>
		<button type="button" disabled class="bk-margin-5 btn btn-primary btn-sm" id="paiZhaoBtn" >拍照</button>
	</div>
</div>
<script type="text/javascript">
	{
		var localMediaStream = null;
		$("#paiZhaoArea").closest(".modal").data("btnState",false);
		if(!navigator){
			error();
		}
		navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia;
		if(!navigator.getUserMedia){
			error();
		}
        navigator.getUserMedia({video:true}, success, error); 
        
        function success(stream) {
        	$("#paiZhaoBtn").prop("disabled",false);
        	localMediaStream = stream;
            $("#showPaiZhao").attr("src", window.webkitURL.createObjectURL(stream));
			$("#showPaiZhao")[0].play();
        }
        function error(error) {
			alert("当前浏览器不支持拍照，请把浏览器更新到最新版本");
		}
        function shoot() {
            var video = $("#showPaiZhao")[0];
            var canvas = capture(video);
            var imgData = canvas.toDataURL("image/jpg");
            var base64String = imgData.substr(22); 
            $("#paiZhaoArea").closest(".modal").data("imgData",base64String);
        }
        function capture(video) {
            var paiZhaoCanvas = $("#paiZhaoCanvas")[0];
            paiZhaoCanvas.width = video.videoWidth;
            paiZhaoCanvas.height = video.videoHeight;
            var ctx = paiZhaoCanvas.getContext('2d');
            ctx.drawImage(video, 0, 0);		 
            return paiZhaoCanvas;
        }
        $("#paiZhaoBtn").click(function(){
        	$("#chongPaiBtn,#shiYongBtn").prop("disabled",false);
        	$("#paiZhaoBtn").prop("disabled",true);
        	$("#paiZhaoArea").css("display","none");
        	$("#showImageArea").css("display","block");
        	shoot();
        });
        $("#chongPaiBtn").click(function(){
        	$("#chongPaiBtn,#shiYongBtn").prop("disabled",true);
        	$("#paiZhaoBtn").prop("disabled",false);
        	$("#paiZhaoArea").css("display","block");
        	$("#showImageArea").css("display","none");
        });
        $("#shiYongBtn").click(function(){
        	$("#paiZhaoArea").closest(".modal").data("btnState",true);
        	$("#paiZhaoArea").closest(".modal").modal("hide");
        });
        $("#paiZhaoArea").closest(".modal").on("hide.bs.modal",function(){
        	if(localMediaStream)
        		localMediaStream.stop();
        });
	}
</script>