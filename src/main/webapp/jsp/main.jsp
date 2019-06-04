<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%

	String path = request.getContextPath();
String basePath2 = request.getServerName() + ":"+ request.getServerPort() + path + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>标题</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="css/fontastic.css">
    <!-- Google fonts - Poppins -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.ico">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    <script type="text/javascript" src="js/jquery-2.1.4.js"> </script>
    <script type="text/javascript">

	 var path = '<%=basePath2%>';
	alert("ws://" + path + "ws.lovo");
	var websocket;
	
	if ('WebSocket' in window) {
		websocket = new WebSocket("ws://" + path + "ws.lovo");
	} else if ('MozWebSocket' in window) {
		websocket = new MozWebSocket("ws://" + path + "ws.lovo");
	} else {
		websocket = new SockJS("http://" + path + "ws/sockjs.lovo");
	}
	websocket.onopen = function(event) {
		alert("WebSocket:已连接");

	};
	//接收服务器发送回来的消息
	websocket.onmessage = function(event) {
	
		if (event.data=="收到续报信息") {
		alert("收到续报信息")
		  location.reload(true);
		}else  {

if (event.data=="{'name:'已经与后台建立连接'}") {
	alert("已经与后台建立连接")
}else{
	alert("收到主报信息")
	 location.reload(true);
}

}	 
		
	};
	websocket.onerror = function(event) {
		alert("WebSocket:发生错误 ");
		alert(event);
	};
	/** websocket.onclose = function(event) {
		alert("WebSocket:已关闭");
		alert(event);
	} **/
	function sendMsg(){
	websocket.send("我是前台");
	} 
	
    $(function(){
    	
    	var $page=1
    	var $opentime=$("input[name=opentime]").val()
    	var $endtime=$("input[name=endtime]").val()
    	var $type=$("input[name=type]").val()
    	var $eventid=$("input[name=eventid]").val()
    	var  $status= $("select[name=account]").val()
     
       		$.post("<%=basePath%>event/eventmain.lovo",{page:$page,opentime:$opentime,endtime:$endtime,type:$type,eventid:$eventid,status:$status},function(data){
    			if (data.pages=="0") {
    				$("#totalPage").text(1)
				}else {
					$("#totalPage").text(data.pages)
				}
       			
    			 $("#tbody1").empty()
    			 if ($status=="待处理") {
    			
    				 $.each(data.list,function(i,e){
    	       
    	        		 	 if (e.fkType=="1") {
    	        		  		 $("#tbody1").append("<tr><td>*</td><td>"+e.fOccurtime+"</td><td>"+e.fName+"</td><td>"+e.fThingnum+"</td><td>"+e.fkLevel+"</td><td>"+e.fAdress+"</td><td>"+e.fField+"</td><td>火灾</td><td>"+e.fStatus+"</td><td><a href=manage.jsp?eventid="+e.fThingnum+">调度</a>&nbsp;&nbsp;&nbsp; <button type=button  id="+e.fThingnum+" name=but1 class=btn btn-primary data-toggle=modal data-target=.bs-example-modal-lg value=btn11> 事件详情</button></td></tr>")
    	        	    	       		
			}
    		 else{
    	  		 $("#tbody1").append("<tr><td>*</td><td>"+e.fOccurtime+"</td><td>"+e.fName+"</td><td>"+e.fThingnum+"</td><td>"+e.fkLevel+"</td><td>"+e.fAdress+"</td><td>"+e.fField+"</td><td>房屋倒塌</td><td>"+e.fStatus+"</td><td><a href=manage.jsp?eventid="+e.fThingnum+">调度</a>&nbsp;&nbsp;&nbsp; <button type=button  id="+e.fThingnum+" name=but1 class=btn btn-primary data-toggle=modal data-target=.bs-example-modal-lg value=btn11> 事件详情</button></td></tr>")
      	       
    		 }
    	        	 })
$("button[value=btn11]").click(function(){
		var $thingmun = this.id
		var name = this.name
		 $("#model1").append("<a href=manage.jsp?eventid="+$thingmun+">调度</a>")
		$("th[name=head]").text(name+"事件详情")
		$.post("<%=basePath%>event/event.lovo",{thingnum:$thingmun},function(data){
			$("#eventname").text(data.fName)
			$("#level").text(data.fkLevel)
				 if (data.fkType=="1") {
    					 $("#type").text("火灾")
			}
    		 else{
    			 $("#type").text("房屋倒塌")
    	 }
			$("#reportpeople").text(data.fReportpeople)
			$("#time").text(data.fOccurtime)
			$("#status").text(data.fStatus)
			$("#address").text(data.fAdress)
			$("#area").text(data.fField)
			$("#alarmpeople").text(data.fAlarmpeople)
			$("#alarmphone").text(data.fAlarmphone)
		})
		$.post("<%=basePath%>xu/eventxu.lovo",{eventid:$thingmun},function(data){
			    	$("#xu").empty();
			    	$.each(data,function(g,c){
			    		$("#xu").append("<tr><td>"+c.pkContinueId+"</td><td>"+c.fContinuetime+"</td><td>"+c.fkLevel+"</td><td>"+c.fAdress+"</td><td>"+c.fkType+"</td><td>"+c.fAlarmpeople+"</td><td>"+c.fAlarmphone+"</td></tr>")
			    	})
		})
	})
				}
    			 else if($status=="正在处理"){
    			
    				 $.each(data.list,function(i,e){
    	        		 	 if (e.fkType=="1") {
    	        		 		 $("#tbody1").append("<tr><td>*</td><td>"+e.fOccurtime+"</td><td>"+e.fName+"</td><td>"+e.fThingnum+"</td><td>"+e.fkLevel+"</td><td>"+e.fAdress+"</td><td>"+e.fField+"</td><td>火灾</td><td>"+e.fStatus+"</td><td><button type=button  id="+e.fThingnum+" name=but1 class=btn btn-primary data-toggle=modal data-target=.bs-example-modal-lg value=btn11> 事件详情</button>&nbsp;&nbsp;&nbsp; <a href=dd-thingsjincheng.jsp?thingsId="+e.fThingnum+" name=zc>查看进程</a></td></tr>")
    	     	             		    	       		
			}
    		 else{
    			 $("#tbody1").append("<tr><td>*</td><td>"+e.fOccurtime+"</td><td>"+e.fName+"</td><td>"+e.fThingnum+"</td><td>"+e.fkLevel+"</td><td>"+e.fAdress+"</td><td>"+e.fField+"</td><td>房屋倒塌</td><td>"+e.fStatus+"</td><td><button type=button  id="+e.fThingnum+" name=but1 class=btn btn-primary data-toggle=modal data-target=.bs-example-modal-lg value=btn11> 事件详情</button>&nbsp;&nbsp;&nbsp; <a href=dd-thingsjincheng.jsp?thingsId="+e.fThingnum+" name=zc>查看进程</a></td></tr>")
	             	 
    		 }
    	        	 })
    	        	   $("button[value=btn11]").click(function(){
		var $thingmun = this.id
		var name = this.name
		$("#model1").empty();
		 $("#model1").append("<a href=manage.jsp?eventid="+$thingmun+">增派调度</a><a href=<%=basePath%>event/update.lovo?eventid="+$thingmun+"&status=处理完毕>结束事件</a>")
		
		$("th[name=head]").text(name+"事件详情")
		$.post("<%=basePath%>event/event.lovo",{thingnum:$thingmun},function(data){
			$("#eventname").text(data.fName)
			$("#level").text(data.fkLevel)
				 if (data.fkType=="1") {
    					 $("#type").text("火灾")
			}
    		 else{
    			 $("#type").text("房屋倒塌")
    	 }
			$("#reportpeople").text(data.fReportpeople)
			$("#time").text(data.fOccurtime)
			$("#status").text(data.fStatus)
			$("#address").text(data.fAdress)
			$("#area").text(data.fField)
			$("#alarmpeople").text(data.fAlarmpeople)
			$("#alarmphone").text(data.fAlarmphone)
		})
		$.post("<%=basePath%>xu/eventxu.lovo",{eventid:$thingmun},function(data){
			    	$("#xu").empty();
			    	$.each(data,function(g,c){
			    		$("#xu").append("<tr><td>"+c.pkContinueId+"</td><td>"+c.fContinuetime+"</td><td>"+c.fkLevel+"</td><td>"+c.fAdress+"</td><td>"+c.fkType+"</td><td>"+c.fAlarmpeople+"</td><td>"+c.fAlarmphone+"</td></tr>")
			    	})
		})
	})
    			 }
    			 else if($status=="处理完毕"){
    				
    				 $.each(data.list,function(i,e){
    	        	 	 if (e.fkType=="1") {
    	           		 	 $("#tbody1").append("<tr><td>*</td><td>"+e.fOccurtime+"</td><td>"+e.fName+"</td><td>"+e.fThingnum+"</td><td>"+e.fkLevel+"</td><td>"+e.fAdress+"</td><td>"+e.fField+"</td><td>火灾</td><td>"+e.fStatus+"</td><td><button type=button  id="+e.fThingnum+" name=but1 class=btn btn-primary data-toggle=modal data-target=.bs-example-modal-lg value=btn11> 事件详情</button></td></tr>")
    	     	           	    		    	       		
			}
    		 else{
    			 $("#tbody1").append("<tr><td>*</td><td>"+e.fOccurtime+"</td><td>"+e.fName+"</td><td>"+e.fThingnum+"</td><td>"+e.fkLevel+"</td><td>"+e.fAdress+"</td><td>"+e.fField+"</td><td>房屋倒塌</td><td>"+e.fStatus+"</td><td><button type=button  id="+e.fThingnum+" name=but1 class=btn btn-primary data-toggle=modal data-target=.bs-example-modal-lg value=btn11> 事件详情</button></td></tr>")
 	           	 	 
    		 }
    	        	 })
    	        	         	   $("button[value=btn11]").click(function(){
		var $thingmun = this.id
		var name = this.name
		$("th[name=head]").text(name+"事件详情")
		$.post("<%=basePath%>event/event.lovo",{thingnum:$thingmun},function(data){
			$("#eventname").text(data.fName)
			$("#level").text(data.fkLevel)
					 if (data.fkType=="1") {
    					 $("#type").text("火灾")
			}
    		 else{
    			 $("#type").text("房屋倒塌")
    	 }
			$("#reportpeople").text(data.fReportpeople)
			$("#time").text(data.fOccurtime)
			$("#status").text(data.fStatus)
			$("#address").text(data.fAdress)
			$("#area").text(data.fField)
			$("#alarmpeople").text(data.fAlarmpeople)
			$("#alarmphone").text(data.fAlarmphone)
		})
		$.post("<%=basePath%>xu/eventxu.lovo",{eventid:$thingmun},function(data){
			    	$("#xu").empty();
			    	$.each(data,function(g,c){
			    		$("#xu").append("<tr><td>"+c.pkContinueId+"</td><td>"+c.fContinuetime+"</td><td>"+c.fkLevel+"</td><td>"+c.fAdress+"</td><td>"+c.fkType+"</td><td>"+c.fAlarmpeople+"</td><td>"+c.fAlarmphone+"</td></tr>")
			    	})
		})
	})
    			 }
    		})
     $("button[name=find]").click(function(){
    	
    	$("input[type=number]").val(1);
    	var $page=1
    	var $opentime=$("input[name=opentime]").val()
    	var $endtime=$("input[name=endtime]").val()
    	var $type=$("input[name=type]").val()
    	var $eventid=$("input[name=eventid]").val()
    	var  $status= $("select[name=account]").val()
       		$.post("<%=basePath%>event/eventmain.lovo",{page:$page,opentime:$opentime,endtime:$endtime,type:$type,eventid:$eventid,status:$status},function(data){
    			 
    			 if (data.pages=="0") {
    				 $("#totalPage").text(1) 
				}else {
					$("#totalPage").text(data.pages)
				}
    			 $("#tbody1").empty()
    			 if ($status=="待处理") {
    			
    				 $.each(data.list,function(i,e){
    	       
    	        		 	 if (e.fkType=="1") {
    	        		  		 $("#tbody1").append("<tr><td>*</td><td>"+e.fOccurtime+"</td><td>"+e.fName+"</td><td>"+e.fThingnum+"</td><td>"+e.fkLevel+"</td><td>"+e.fAdress+"</td><td>"+e.fField+"</td><td>火灾</td><td>"+e.fStatus+"</td><td><a href=manage.jsp?eventid="+e.fThingnum+">调度</a>&nbsp;&nbsp;&nbsp; <button type=button  id="+e.fThingnum+" name=but1 class=btn btn-primary data-toggle=modal data-target=.bs-example-modal-lg value=btn11> 事件详情</button></td></tr>")
    	        	    	       		
			}
    		 else{
    	  		 $("#tbody1").append("<tr><td>*</td><td>"+e.fOccurtime+"</td><td>"+e.fName+"</td><td>"+e.fThingnum+"</td><td>"+e.fkLevel+"</td><td>"+e.fAdress+"</td><td>"+e.fField+"</td><td>房屋倒塌</td><td>"+e.fStatus+"</td><td><a href=manage.jsp?eventid="+e.fThingnum+">调度</a>&nbsp;&nbsp;&nbsp; <button type=button  id="+e.fThingnum+" name=but1 class=btn btn-primary data-toggle=modal data-target=.bs-example-modal-lg value=btn11> 事件详情</button></td></tr>")
      	       
    		 }
    	        	 })
$("button[value=btn11]").click(function(){
		var $thingmun = this.id
		var name = this.name
		 $("#model1").append("<a href=manage.jsp?eventid="+$thingmun+">调度</a>")
		$("th[name=head]").text(name+"事件详情")
		$.post("<%=basePath%>event/event.lovo",{thingnum:$thingmun},function(data){
			$("#eventname").text(data.fName)
			$("#level").text(data.fkLevel)
				 if (data.fkType=="1") {
    					 $("#type").text("火灾")
			}
    		 else{
    			 $("#type").text("房屋倒塌")
    	 }
			$("#reportpeople").text(data.fReportpeople)
			$("#time").text(data.fOccurtime)
			$("#status").text(data.fStatus)
			$("#address").text(data.fAdress)
			$("#area").text(data.fField)
			$("#alarmpeople").text(data.fAlarmpeople)
			$("#alarmphone").text(data.fAlarmphone)
		})
		$.post("<%=basePath%>xu/eventxu.lovo",{eventid:$thingmun},function(data){
			    	$("#xu").empty();
			    	$.each(data,function(g,c){
			    		$("#xu").append("<tr><td>"+c.pkContinueId+"</td><td>"+c.fContinuetime+"</td><td>"+c.fkLevel+"</td><td>"+c.fAdress+"</td><td>"+c.fkType+"</td><td>"+c.fAlarmpeople+"</td><td>"+c.fAlarmphone+"</td></tr>")
			    	})
		})
	})
				}
    			 else if($status=="正在处理"){
    			
    				 $.each(data.list,function(i,e){
    	        		 	 if (e.fkType=="1") {
    	        		 		 $("#tbody1").append("<tr><td>*</td><td>"+e.fOccurtime+"</td><td>"+e.fName+"</td><td>"+e.fThingnum+"</td><td>"+e.fkLevel+"</td><td>"+e.fAdress+"</td><td>"+e.fField+"</td><td>火灾</td><td>"+e.fStatus+"</td><td><button type=button  id="+e.fThingnum+" name=but1 class=btn btn-primary data-toggle=modal data-target=.bs-example-modal-lg value=btn11> 事件详情</button>&nbsp;&nbsp;&nbsp; <a href=dd-thingsjincheng.jsp?thingsId="+e.fThingnum+" name=zc>查看进程</a></td></tr>")
    	     	             		    	       		
			}
    		 else{
    			 $("#tbody1").append("<tr><td>*</td><td>"+e.fOccurtime+"</td><td>"+e.fName+"</td><td>"+e.fThingnum+"</td><td>"+e.fkLevel+"</td><td>"+e.fAdress+"</td><td>"+e.fField+"</td><td>房屋倒塌</td><td>"+e.fStatus+"</td><td><button type=button  id="+e.fThingnum+" name=but1 class=btn btn-primary data-toggle=modal data-target=.bs-example-modal-lg value=btn11> 事件详情</button>&nbsp;&nbsp;&nbsp; <a href=dd-thingsjincheng.jsp?thingsId="+e.fThingnum+" name=zc>查看进程</a></td></tr>")
	             	 
    		 }
    	        	 })
    	        	   $("button[value=btn11]").click(function(){
		var $thingmun = this.id
		var name = this.name
		$("#model1").empty();
		 $("#model1").append("<a href=manage.jsp?eventid="+$thingmun+">增派调度</a><a href=<%=basePath%>event/update.lovo?eventid="+$thingmun+"&status=处理完毕>结束事件</a>")
		
		$("th[name=head]").text(name+"事件详情")
		$.post("<%=basePath%>event/event.lovo",{thingnum:$thingmun},function(data){
			$("#eventname").text(data.fName)
			$("#level").text(data.fkLevel)
				 if (data.fkType=="1") {
    					 $("#type").text("火灾")
			}
    		 else{
    			 $("#type").text("房屋倒塌")
    	 }
			$("#reportpeople").text(data.fReportpeople)
			$("#time").text(data.fOccurtime)
			$("#status").text(data.fStatus)
			$("#address").text(data.fAdress)
			$("#area").text(data.fField)
			$("#alarmpeople").text(data.fAlarmpeople)
			$("#alarmphone").text(data.fAlarmphone)
		})
		$.post("<%=basePath%>xu/eventxu.lovo",{eventid:$thingmun},function(data){
			    	$("#xu").empty();
			    	$.each(data,function(g,c){
			    		$("#xu").append("<tr><td>"+c.pkContinueId+"</td><td>"+c.fContinuetime+"</td><td>"+c.fkLevel+"</td><td>"+c.fAdress+"</td><td>"+c.fkType+"</td><td>"+c.fAlarmpeople+"</td><td>"+c.fAlarmphone+"</td></tr>")
			    	})
		})
	})
    			 }
    			 else if($status=="处理完毕"){
    				
    				 $.each(data.list,function(i,e){
    	        	 	 if (e.fkType=="1") {
    	           		 	 $("#tbody1").append("<tr><td>*</td><td>"+e.fOccurtime+"</td><td>"+e.fName+"</td><td>"+e.fThingnum+"</td><td>"+e.fkLevel+"</td><td>"+e.fAdress+"</td><td>"+e.fField+"</td><td>火灾</td><td>"+e.fStatus+"</td><td><button type=button  id="+e.fThingnum+" name=but1 class=btn btn-primary data-toggle=modal data-target=.bs-example-modal-lg value=btn11> 事件详情</button></td></tr>")
    	     	           	    		    	       		
			}
    		 else{
    			 $("#tbody1").append("<tr><td>*</td><td>"+e.fOccurtime+"</td><td>"+e.fName+"</td><td>"+e.fThingnum+"</td><td>"+e.fkLevel+"</td><td>"+e.fAdress+"</td><td>"+e.fField+"</td><td>房屋倒塌</td><td>"+e.fStatus+"</td><td><button type=button  id="+e.fThingnum+" name=but1 class=btn btn-primary data-toggle=modal data-target=.bs-example-modal-lg value=btn11> 事件详情</button></td></tr>")
 	           	 	 
    		 }
    	        	 })
    	        	         	   $("button[value=btn11]").click(function(){
		var $thingmun = this.id
		var name = this.name
		$("th[name=head]").text(name+"事件详情")
		$.post("<%=basePath%>event/event.lovo",{thingnum:$thingmun},function(data){
			$("#eventname").text(data.fName)
			$("#level").text(data.fkLevel)
					 if (data.fkType=="1") {
    					 $("#type").text("火灾")
			}
    		 else{
    			 $("#type").text("房屋倒塌")
    	 }
			$("#reportpeople").text(data.fReportpeople)
			$("#time").text(data.fOccurtime)
			$("#status").text(data.fStatus)
			$("#address").text(data.fAdress)
			$("#area").text(data.fField)
			$("#alarmpeople").text(data.fAlarmpeople)
			$("#alarmphone").text(data.fAlarmphone)
		})
		$.post("<%=basePath%>xu/eventxu.lovo",{eventid:$thingmun},function(data){
			    	$("#xu").empty();
			    	$.each(data,function(g,c){
			    		$("#xu").append("<tr><td>"+c.pkContinueId+"</td><td>"+c.fContinuetime+"</td><td>"+c.fkLevel+"</td><td>"+c.fAdress+"</td><td>"+c.fkType+"</td><td>"+c.fAlarmpeople+"</td><td>"+c.fAlarmphone+"</td></tr>")
			    	})
		})
	})
    			 }
    		})
     $("button[value=btn11]").click(function(){
 		var $thingmun = this.id
		var name = this.name

		 $("#model1").append("<a href=manage.jsp?eventid="+$thingmun+">调度</a>")
		
		$("th[name=head]").text(name+"事件详情")
		$.post("<%=basePath%>event/event.lovo",{thingnum:$thingmun},function(data){
			$("#eventname").text(data.fName)
			$("#level").text(data.fkLevel)
				 if (data.fkType=="1") {
    					 $("#type").text("火灾")
			}
    		 else{
    			 $("#type").text("房屋倒塌")
    	 }
			$("#reportpeople").text(data.fReportpeople)
			$("#time").text(data.fOccurtime)
			$("#status").text(data.fStatus)
			$("#address").text(data.fAdress)
			$("#area").text(data.fField)
			$("#alarmpeople").text(data.fAlarmpeople)
			$("#alarmphone").text(data.fAlarmphone)
		})
		$.post("<%=basePath%>xu/eventxu.lovo",{eventid:$thingmun},function(data){
			    	$("#xu").empty();
			    	$.each(data,function(g,c){
			    		$("#xu").append("<tr><td>"+c.pkContinueId+"</td><td>"+c.fContinuetime+"</td><td>"+c.fkLevel+"</td><td>"+c.fAdress+"</td><td>"+c.fkType+"</td><td>"+c.fAlarmpeople+"</td><td>"+c.fAlarmphone+"</td></tr>")
			    	})
		})
    	})
     })
     
    	$("button[name=ye]").click(function(){
    		var $pages=$("input[type=number]").val();
    		var $page =parseInt($pages) 
    		 var $ye=this.value
    		if($ye=="上一页"){
    			$page=$page-1
    		}
    		else if($ye=="下一页"){
    			$page=$page+1
    		}
    		else if($ye=="首页"){
    			$page=1
    		}
    		else if($ye=="尾页"){
    			$page=$("#totalPage").text()
    		}
    		if ($page<1) {
    			$page=1
			}
    		if ($page>$("#totalPage").text()) {
    			$page=$("#totalPage").text()
			}
    		var $opentime=$("input[name=opentime]").val()
        	var $endtime=$("input[name=endtime]").val()
        	var $type=$("input[name=type]").val()
        	var $eventid=$("input[name=eventid]").val()
        	var  $status= $("select[name=account]").val()
    		$("input[type=number]").val($page);
    		$.post("<%=basePath%>event/eventmain.lovo",{page:$page,opentime:$opentime,endtime:$endtime,type:$type,eventid:$eventid,status:$status},function(data){
    			 $("#totalPage").text(data.pages)
    			 $("#tbody1").empty()
    			 if ($status=="待处理") {
    			
    				 $.each(data.list,function(i,e){
    	        		 	 if (e.fkType=="1") {
    	        		 		 $("#tbody1").append("<tr><td>*</td><td>"+e.fOccurtime+"</td><td>"+e.fName+"</td><td>"+e.fThingnum+"</td><td>"+e.fkLevel+"</td><td>"+e.fAdress+"</td><td>"+e.fField+"</td><td>火灾</td><td>"+e.fStatus+"</td><td><a href=manage.jsp?eventid="+e.fThingnum+">调度</a>&nbsp;&nbsp;&nbsp; <button type=button  id="+e.fThingnum+" name=but1 class=btn btn-primary data-toggle=modal data-target=.bs-example-modal-lg value=btn11> 事件详情</button></td></tr>")
    	        	                    	    		    	       		
			}
    		 else{
    			 $("#tbody1").append("<tr><td>*</td><td>"+e.fOccurtime+"</td><td>"+e.fName+"</td><td>"+e.fThingnum+"</td><td>"+e.fkLevel+"</td><td>"+e.fAdress+"</td><td>"+e.fField+"</td><td>房屋倒塌</td><td>"+e.fStatus+"</td><td><a href=manage.jsp?eventid="+e.fThingnum+">调度</a>&nbsp;&nbsp;&nbsp; <button type=button  id="+e.fThingnum+" name=but1 class=btn btn-primary data-toggle=modal data-target=.bs-example-modal-lg value=btn11> 事件详情</button></td></tr>")
	             	 	 
    		 }
    	        	 })
$("button[value=btn11]").click(function(){
		var $thingmun = this.id
		var name = this.name
		 $("#model1").append("<a href=manage.jsp?eventid="+$thingmun+">调度</a>")
		$("th[name=head]").text(name+"事件详情")
		$.post("<%=basePath%>event/event.lovo",{thingnum:$thingmun},function(data){
			$("#eventname").text(data.fName)
			$("#level").text(data.fkLevel)
				 if (data.fkType=="1") {
    					 $("#type").text("火灾")
			}
    		 else{
    			 $("#type").text("房屋倒塌")
    	 }
			$("#reportpeople").text(data.fReportpeople)
			$("#time").text(data.fOccurtime)
			$("#status").text(data.fStatus)
			$("#address").text(data.fAdress)
			$("#area").text(data.fField)
			$("#alarmpeople").text(data.fAlarmpeople)
			$("#alarmphone").text(data.fAlarmphone)
		})
		$.post("<%=basePath%>xu/eventxu.lovo",{eventid:$thingmun},function(data){
			    	$("#xu").empty();
			    	$.each(data,function(g,c){
			    		$("#xu").append("<tr><td>"+c.pkContinueId+"</td><td>"+c.fContinuetime+"</td><td>"+c.fkLevel+"</td><td>"+c.fAdress+"</td><td>"+c.fkType+"</td><td>"+c.fAlarmpeople+"</td><td>"+c.fAlarmphone+"</td></tr>")
			    	})
		})
	})
				}
    			 else if($status=="正在处理"){
    			
    				 $.each(data.list,function(i,e){
    	        			 	 if (e.fkType=="1") {
    	             		 		 $("#tbody1").append("<tr><td>*</td><td>"+e.fOccurtime+"</td><td>"+e.fName+"</td><td>"+e.fThingnum+"</td><td>"+e.fkLevel+"</td><td>"+e.fAdress+"</td><td>"+e.fField+"</td><td>火灾</td><td>"+e.fStatus+"</td><td><button type=button  id="+e.fThingnum+" name=but1 class=btn btn-primary data-toggle=modal data-target=.bs-example-modal-lg value=btn11> 事件详情</button>&nbsp;&nbsp;&nbsp; <a href=dd-thingsjincheng.jsp?thingsId="+e.fThingnum+" name=zc>查看进程</a></td></tr>")
    	         	             	                	    		    	       		
			}
    		 else{
    			 $("#tbody1").append("<tr><td>*</td><td>"+e.fOccurtime+"</td><td>"+e.fName+"</td><td>"+e.fThingnum+"</td><td>"+e.fkLevel+"</td><td>"+e.fAdress+"</td><td>"+e.fField+"</td><td>房屋倒塌</td><td>"+e.fStatus+"</td><td><button type=button  id="+e.fThingnum+" name=but1 class=btn btn-primary data-toggle=modal data-target=.bs-example-modal-lg value=btn11> 事件详情</button>&nbsp;&nbsp;&nbsp; <a href=dd-thingsjincheng.jsp?thingsId="+e.fThingnum+" name=zc>查看进程</a></td></tr>")
	             		 	 
    		 }
    	        	 })
    	        	   $("button[value=btn11]").click(function(){
		var $thingmun = this.id
		var name = this.name
		$("#model1").empty();
		 $("#model1").append("<a href=manage.jsp?eventid="+$thingmun+">增派调度</a><a href=<%=basePath%>event/update.lovo?eventid="+$thingmun+"&status=处理完毕>结束事件</a>")
		$("th[name=head]").text(name+"事件详情")
		$.post("<%=basePath%>event/event.lovo",{thingnum:$thingmun},function(data){
			$("#eventname").text(data.fName)
			$("#level").text(data.fkLevel)
				 if (data.fkType=="1") {
    					 $("#type").text("火灾")
			}
    		 else{
    			 $("#type").text("房屋倒塌")
    	 }
			$("#reportpeople").text(data.fReportpeople)
			$("#time").text(data.fOccurtime)
			$("#status").text(data.fStatus)
			$("#address").text(data.fAdress)
			$("#area").text(data.fField)
			$("#alarmpeople").text(data.fAlarmpeople)
			$("#alarmphone").text(data.fAlarmphone)
		})
		$.post("<%=basePath%>xu/eventxu.lovo",{eventid:$thingmun},function(data){
			    	$("#xu").empty();
			    	$.each(data,function(g,c){
			    		$("#xu").append("<tr><td>"+c.pkContinueId+"</td><td>"+c.fContinuetime+"</td><td>"+c.fkLevel+"</td><td>"+c.fAdress+"</td><td>"+c.fkType+"</td><td>"+c.fAlarmpeople+"</td><td>"+c.fAlarmphone+"</td></tr>")
			    	})
		})
	})
    			 }
    			 else if($status=="处理完毕"){
    				
    				 $.each(data.list,function(i,e){
    	        	 			 	 if (e.fkType=="1") {
    	      	 $("#tbody1").append("<tr><td>*</td><td>"+e.fOccurtime+"</td><td>"+e.fName+"</td><td>"+e.fThingnum+"</td><td>"+e.fkLevel+"</td><td>"+e.fAdress+"</td><td>"+e.fField+"</td><td>火灾</td><td>"+e.fStatus+"</td><td><button type=button  id="+e.fThingnum+" name=but1 class=btn btn-primary data-toggle=modal data-target=.bs-example-modal-lg value=btn11> 事件详情</button></td></tr>")
    	        	    	                         	                	    		    	       		
			}
    		 else{
    			 $("#tbody1").append("<tr><td>*</td><td>"+e.fOccurtime+"</td><td>"+e.fName+"</td><td>"+e.fThingnum+"</td><td>"+e.fkLevel+"</td><td>"+e.fAdress+"</td><td>"+e.fField+"</td><td>房屋倒塌</td><td>"+e.fStatus+"</td><td><button type=button  id="+e.fThingnum+" name=but1 class=btn btn-primary data-toggle=modal data-target=.bs-example-modal-lg value=btn11> 事件详情</button></td></tr>")
	               		 	 
    		 }
    	        	 })
   $("button[value=btn11]").click(function(){
		var $thingmun = this.id
		var name = this.name
		$("th[name=head]").text(name+"事件详情")
		$.post("<%=basePath%>event/event.lovo",{thingnum:$thingmun},function(data){
			$("#eventname").text(data.fName)
			$("#level").text(data.fkLevel)
					 if (data.fkType=="1") {
    					 $("#type").text("火灾")
			}
    		 else{
    			 $("#type").text("房屋倒塌")
    	 }
			$("#reportpeople").text(data.fReportpeople)
			$("#time").text(data.fOccurtime)
			$("#status").text(data.fStatus)
			$("#address").text(data.fAdress)
			$("#area").text(data.fField)
			$("#alarmpeople").text(data.fAlarmpeople)
			$("#alarmphone").text(data.fAlarmphone)
		})
		$.post("<%=basePath%>xu/eventxu.lovo",{eventid:$thingmun},function(data){
			    	$("#xu").empty();
			    	$.each(data,function(g,c){
			    		$("#xu").append("<tr><td>"+c.pkContinueId+"</td><td>"+c.fContinuetime+"</td><td>"+c.fkLevel+"</td><td>"+c.fAdress+"</td><td>"+c.fkType+"</td><td>"+c.fAlarmpeople+"</td><td>"+c.fAlarmphone+"</td></tr>")
			    	})
		})
	})
    			 }
    		})
    		$("button[value=btn11]").click(function(){
        		var $thingmun = this.id
        		var name = this.name
        		$("th[name=head]").text(name+"事件详情")
        		$.post("<%=basePath%>event/event.lovo",{thingnum:$thingmun},function(data){
        			$("#eventname").text(data.fName)
        			$("#level").text(data.fkLevel)
        					 if (data.fkType=="1") {
    					 $("#type").text("火灾")
			}
    		 else{
    			 $("#type").text("房屋倒塌")
    	 }
        			$("#reportpeople").text(data.fReportpeople)
        			$("#time").text(data.fOccurtime)
        			$("#status").text(data.fStatus)
        			$("#address").text(data.fAdress)
        			$("#area").text(data.fField)
        			$("#alarmpeople").text(data.fAlarmpeople)
        			$("#alarmphone").text(data.fAlarmphone)
        		})
        		$.post("<%=basePath%>xu/eventxu.lovo",{eventid:$thingmun},function(data){
        			    	$("#xu").empty();
        			    	$.each(data,function(g,c){
        			    		$("#xu").append("<tr><td>"+c.pkContinueId+"</td><td>"+c.fContinuetime+"</td><td>"+c.fkLevel+"</td><td>"+c.fAdress+"</td><td>"+c.fkType+"</td><td>"+c.fAlarmpeople+"</td><td>"+c.fAlarmphone+"</td></tr>")
        			    	})
        		})
    	})
    		
    	})
    	$("select[name=account]").change(function(){
    	   	$("input[type=number]").val(1);
        	var $page=1
        	var $opentime=$("input[name=opentime]").val()
        	var $endtime=$("input[name=endtime]").val()
        	var $type=$("input[name=type]").val()
        	var $eventid=$("input[name=eventid]").val()
        	var  $status= $("select[name=account]").val()
        	     $.post("<%=basePath%>event/eventmain.lovo",{page:$page,opentime:$opentime,endtime:$endtime,type:$type,eventid:$eventid,status:$status},function(data){
        	    	 if (data.pages=="0") {
         				$("#totalPage").text(1)
     				}else {
     					$("#totalPage").text(data.pages)
     				}
        			 $("#tbody1").empty()
        			 if ($status=="待处理") {
        			 $.each(data.list,function(i,e){
        				 if (e.fkType=="1") {
        	    			 $("#tbody1").append("<tr><td>*</td><td>"+e.fOccurtime+"</td><td>"+e.fName+"</td><td>"+e.fThingnum+"</td><td>"+e.fkLevel+"</td><td>"+e.fAdress+"</td><td>"+e.fField+"</td><td>火灾</td><td>"+e.fStatus+"</td><td><a href=manage.jsp?eventid="+e.fThingnum+">调度</a>&nbsp;&nbsp;&nbsp; <button type=button class=btn btn-primary  id="+e.fThingnum+" name="+e.fName+"  data-toggle=modal data-target=.bs-example-modal-lg value=btn11> 事件详情</button></td></tr>")
        	    		    		
        				}
        	    		 else{
        	    		 $("#tbody1").append("<tr><td>*</td><td>"+e.fOccurtime+"</td><td>"+e.fName+"</td><td>"+e.fThingnum+"</td><td>"+e.fkLevel+"</td><td>"+e.fAdress+"</td><td>"+e.fField+"</td><td>房屋倒塌</td><td>"+e.fStatus+"</td><td><a href=manage.jsp?eventid="+e.fThingnum+">调度</a>&nbsp;&nbsp;&nbsp; <button type=button class=btn btn-primary  id="+e.fThingnum+" name="+e.fName+"  data-toggle=modal data-target=.bs-example-modal-lg value=btn11> 事件详情</button></td></tr>")
        	    		 }
        	        	 })
  $("button[value=btn11]").click(function(){
	  
    		var $thingmun = this.id
    		var name = this.name
    		 $("#model1").append("<a href=manage.jsp?eventid="+$thingmun+">调度</a>")
    		$("th[name=head]").text(name+"事件详情")
    		$.post("<%=basePath%>event/event.lovo",{thingnum:$thingmun},function(data){
    			$("#eventname").text(data.fName)
    			$("#level").text(data.fkLevel)
    					 if (data.fkType=="1") {
    					 $("#type").text("火灾")
			}
    		 else{
    			 $("#type").text("房屋倒塌")
    	 }
    			$("#reportpeople").text(data.fReportpeople)
    			$("#time").text(data.fOccurtime)
    			$("#status").text(data.fStatus)
    			$("#address").text(data.fAdress)
    			$("#area").text(data.fField)
    			$("#alarmpeople").text(data.fAlarmpeople)
    			$("#alarmphone").text(data.fAlarmphone)
    		})
    		$.post("<%=basePath%>xu/eventxu.lovo",{eventid:$thingmun},function(data){
    			    	$("#xu").empty();
    			    	$.each(data,function(g,c){
    			    		$("#xu").append("<tr><td>"+c.pkContinueId+"</td><td>"+c.fContinuetime+"</td><td>"+c.fkLevel+"</td><td>"+c.fAdress+"</td><td>"+c.fkType+"</td><td>"+c.fAlarmpeople+"</td><td>"+c.fAlarmphone+"</td></tr>")
    			    	})
    		})
    	})
					}
        			 else if($status=="正在处理"){
        		 $.each(data.list,function(i,e){
        	        			 			 	 if (e.fkType=="1") {
        	  		 $("#tbody1").append("<tr><td>*</td><td>"+e.fOccurtime+"</td><td>"+e.fName+"</td><td>"+e.fThingnum+"</td><td>"+e.fkLevel+"</td><td>"+e.fAdress+"</td><td>"+e.fField+"</td><td>火灾</td><td>"+e.fStatus+"</td><td><button type=button  id="+e.fThingnum+" name=but1 class=btn btn-primary data-toggle=modal data-target=.bs-example-modal-lg value=btn11> 事件详情</button>&nbsp;&nbsp;&nbsp; <a href=dd-thingsjincheng.jsp?thingsId="+e.fThingnum+" name=zc>查看进程</a></td></tr>")
        	        	        	                	   	            		    	                         	                	    		    	       		
			}
    		 else{
    			 $("#tbody1").append("<tr><td>*</td><td>"+e.fOccurtime+"</td><td>"+e.fName+"</td><td>"+e.fThingnum+"</td><td>"+e.fkLevel+"</td><td>"+e.fAdress+"</td><td>"+e.fField+"</td><td>房屋倒塌</td><td>"+e.fStatus+"</td><td><button type=button  id="+e.fThingnum+" name=but1 class=btn btn-primary data-toggle=modal data-target=.bs-example-modal-lg value=btn11> 事件详情</button>&nbsp;&nbsp;&nbsp; <a href=dd-thingsjincheng.jsp?thingsId="+e.fThingnum+" name=zc>查看进程</a></td></tr>")
             	 	  		 	 
    		 }
        	        	 })
        	        	   $("button[value=btn11]").click(function(){
    		var $thingmun = this.id
    		var name = this.name
    		 $("#model1").empty();
    		 $("#model1").append("<a href=manage.jsp?eventid="+$thingmun+">增派调度</a><a href=<%=basePath%>event/update.lovo?eventid="+$thingmun+"&status=处理完毕>结束事件</a>")
    		$("th[name=head]").text(name+"事件详情")
    		$.post("<%=basePath%>event/event.lovo",{thingnum:$thingmun},function(data){
    			$("#eventname").text(data.fName)
    			$("#level").text(data.fkLevel)
    					 if (data.fkType=="1") {
    					 $("#type").text("火灾")
			}
    		 else{
    			 $("#type").text("房屋倒塌")
    	 }
    			$("#reportpeople").text(data.fReportpeople)
    			$("#time").text(data.fOccurtime)
    			$("#status").text(data.fStatus)
    			$("#address").text(data.fAdress)
    			$("#area").text(data.fField)
    			$("#alarmpeople").text(data.fAlarmpeople)
    			$("#alarmphone").text(data.fAlarmphone)
    		})
    		$.post("<%=basePath%>xu/eventxu.lovo",{eventid:$thingmun},function(data){
    			    	$("#xu").empty();
    			    	$.each(data,function(g,c){
    			    		$("#xu").append("<tr><td>"+c.pkContinueId+"</td><td>"+c.fContinuetime+"</td><td>"+c.fkLevel+"</td><td>"+c.fAdress+"</td><td>"+c.fkType+"</td><td>"+c.fAlarmpeople+"</td><td>"+c.fAlarmphone+"</td></tr>")
    			    	})
    		})
    	})
        			 }
        			 else if($status=="处理完毕"){
        		 $.each(data.list,function(i,e){
        	       if (e.fkType=="1") {
        	    		 $("#tbody1").append("<tr><td>*</td><td>"+e.fOccurtime+"</td><td>"+e.fName+"</td><td>"+e.fThingnum+"</td><td>"+e.fkLevel+"</td><td>"+e.fAdress+"</td><td>"+e.fField+"</td><td>火灾</td><td>"+e.fStatus+"</td><td><button type=button  id="+e.fThingnum+" name=but1 class=btn btn-primary data-toggle=modal data-target=.bs-example-modal-lg value=btn11> 事件详情</button></td></tr>")
             	     	  	        	                	   	            		    	                         	                	    		    	       		
			}
    		 else{
    	  		 $("#tbody1").append("<tr><td>*</td><td>"+e.fOccurtime+"</td><td>"+e.fName+"</td><td>"+e.fThingnum+"</td><td>"+e.fkLevel+"</td><td>"+e.fAdress+"</td><td>"+e.fField+"</td><td>房屋倒塌</td><td>"+e.fStatus+"</td><td><button type=button  id="+e.fThingnum+" name=but1 class=btn btn-primary data-toggle=modal data-target=.bs-example-modal-lg value=btn11> 事件详情</button></td></tr>")
     	     	 	  		 	 
    		 }    
        	        	 })
        	        	         	   $("button[value=btn11]").click(function(){
    		var $thingmun = this.id
    		var name = this.name
    		$("th[name=head]").text(name+"事件详情")
    		$.post("<%=basePath%>event/event.lovo",{thingnum:$thingmun},function(data){
    			$("#eventname").text(data.fName)
    			$("#level").text(data.fkLevel)
    					 if (data.fkType=="1") {
    					 $("#type").text("火灾")
			}
    		 else{
    			 $("#type").text("房屋倒塌")
    	 }
    			$("#reportpeople").text(data.fReportpeople)
    			$("#time").text(data.fOccurtime)
    			$("#status").text(data.fStatus)
    			$("#address").text(data.fAdress)
    			$("#area").text(data.fField)
    			$("#alarmpeople").text(data.fAlarmpeople)
    			$("#alarmphone").text(data.fAlarmphone)
    		})
    		$.post("<%=basePath%>xu/eventxu.lovo",{eventid:$thingmun},function(data){
    			    	$("#xu").empty();
    			    	$.each(data,function(g,c){
    			    		$("#xu").append("<tr><td>"+c.pkContinueId+"</td><td>"+c.fContinuetime+"</td><td>"+c.fkLevel+"</td><td>"+c.fAdress+"</td><td>"+c.fkType+"</td><td>"+c.fAlarmpeople+"</td><td>"+c.fAlarmphone+"</td></tr>")
    			    	})
    		})
    	})
        			 }
        	
         })
    	})
    	

    })
   
    </script>
</head>
<body>

<div class="page">
    <!-- Main Navbar-->
    <header class="header">
        <nav class="navbar">
            <!-- Search Box-->
            <div class="search-box">
                <button class="dismiss"><i class="icon-close"></i></button>
                <form id="searchForm" action="#" role="search">
                    <input type="search" placeholder="What are you looking for..." class="form-control">
                </form>
            </div>
            <div class="container-fluid">
                <div class="navbar-holder d-flex align-items-center justify-content-between">
                    <!-- Navbar Header-->
                    <div class="navbar-header">
                        <!-- Navbar Brand --><a href="index.html" class="navbar-brand d-none d-sm-inline-block">
                        <div class="brand-text d-none d-lg-inline-block"><span>Bootstrap </span><strong>Dashboard</strong></div>
                        <div class="brand-text d-none d-sm-inline-block d-lg-none"><strong>BD</strong></div></a>
                        <!-- Toggle Button--><a id="toggle-btn" href="#" class="menu-btn active"><span></span><span></span><span></span></a>
                    </div>
                    <!-- Navbar Menu -->
                    <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                        <!-- Search-->
                        <li class="nav-item d-flex align-items-center"><a id="search" href="#"><i class="icon-search"></i></a></li>
                        <!-- Notifications-->
                        <li class="nav-item dropdown"> <a id="notifications" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link"><i class="fa fa-bell-o"></i><span class="badge bg-red badge-corner">12</span></a>
                            <ul aria-labelledby="notifications" class="dropdown-menu">
                                <li><a rel="nofollow" href="#" class="dropdown-item">
                                    <div class="notification">
                                        <div class="notification-content"><i class="fa fa-envelope bg-green"></i>You have 6 new messages </div>
                                        <div class="notification-time"><small>4 minutes ago</small></div>
                                    </div></a></li>
                                <li><a rel="nofollow" href="#" class="dropdown-item">
                                    <div class="notification">
                                        <div class="notification-content"><i class="fa fa-twitter bg-blue"></i>You have 2 followers</div>
                                        <div class="notification-time"><small>4 minutes ago</small></div>
                                    </div></a></li>
                                <li><a rel="nofollow" href="#" class="dropdown-item">
                                    <div class="notification">
                                        <div class="notification-content"><i class="fa fa-upload bg-orange"></i>Server Rebooted</div>
                                        <div class="notification-time"><small>4 minutes ago</small></div>
                                    </div></a></li>
                                <li><a rel="nofollow" href="#" class="dropdown-item">
                                    <div class="notification">
                                        <div class="notification-content"><i class="fa fa-twitter bg-blue"></i>You have 2 followers</div>
                                        <div class="notification-time"><small>10 minutes ago</small></div>
                                    </div></a></li>
                                <li><a rel="nofollow" href="#" class="dropdown-item all-notifications text-center"> <strong>view all notifications                                            </strong></a></li>
                            </ul>
                        </li>
                        <!-- Messages                        -->
                        <li class="nav-item dropdown"> <a id="messages" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link"><i class="fa fa-envelope-o"></i><span class="badge bg-orange badge-corner">10</span></a>
                            <ul aria-labelledby="notifications" class="dropdown-menu">
                                <li><a rel="nofollow" href="#" class="dropdown-item d-flex">
                                    <div class="msg-profile"> <img src="img/avatar-1.jpg" alt="..." class="img-fluid rounded-circle"></div>
                                    <div class="msg-body">
                                        <h3 class="h5">Jason Doe</h3><span>Sent You Message</span>
                                    </div></a></li>
                                <li><a rel="nofollow" href="#" class="dropdown-item d-flex">
                                    <div class="msg-profile"> <img src="img/avatar-2.jpg" alt="..." class="img-fluid rounded-circle"></div>
                                    <div class="msg-body">
                                        <h3 class="h5">Frank Williams</h3><span>Sent You Message</span>
                                    </div></a></li>
                                <li><a rel="nofollow" href="#" class="dropdown-item d-flex">
                                    <div class="msg-profile"> <img src="img/avatar-3.jpg" alt="..." class="img-fluid rounded-circle"></div>
                                    <div class="msg-body">
                                        <h3 class="h5">Ashley Wood</h3><span>Sent You Message</span>
                                    </div></a></li>
                                <li><a rel="nofollow" href="#" class="dropdown-item all-notifications text-center"> <strong>Read all messages   </strong></a></li>
                            </ul>
                        </li>
                        <!-- Languages dropdown    -->
                        <li class="nav-item dropdown"><a id="languages" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link language dropdown-toggle"><img src="img/flags/16/GB.png" alt="English"><span class="d-none d-sm-inline-block">English</span></a>
                            <ul aria-labelledby="languages" class="dropdown-menu">
                                <li><a rel="nofollow" href="#" class="dropdown-item"> <img src="img/flags/16/DE.png" alt="English" class="mr-2">German</a></li>
                                <li><a rel="nofollow" href="#" class="dropdown-item"> <img src="img/flags/16/FR.png" alt="English" class="mr-2">French                                         </a></li>
                            </ul>
                        </li>
                        <!-- Logout    -->
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <div class="page-content d-flex align-items-stretch">
        <!-- Side Navbar -->
        <nav class="side-navbar">
            <!-- Sidebar Header-->
            <div class="sidebar-header d-flex align-items-center">
                <div class="avatar"><img src="img/avatar-1.jpg" alt="..." class="img-fluid rounded-circle"></div>
                <div class="title">
                    <h1 class="h4">Mark Stephen</h1>
                    <p>Web Designer</p>
                </div>
            </div>
            <!-- Sidebar Navidation Menus--><span class="heading">Main</span>
            <ul class="list-unstyled">
                <li class="active"><a href="index.html"> <i class="icon-home"></i>调度主页 </a></li>
                <li><a href="#thingLi" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>事件分类 </a>
                    <ul id="thingLi" class="collapse list-unstyled ">
                        <li><a href="#">待处理</a></li>
                        <li><a href="#">正在处理</a></li>
                        <li><a href="#">处理完毕</a></li>
                    </ul>
                </li>
                <li><a href="#dutyLi" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>模版管理 </a>
                    <ul id="dutyLi" class="collapse list-unstyled ">
                        <li><a href="dd-modeladd.jsp">添加模版</a></li>
                        <li><a href="dd-modelshow.jsp">模版一览</a></li>
                    </ul>
                </li>
                <li><a href="#sysLi" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>系统设置 </a>
                    <ul id="sysLi" class="collapse list-unstyled ">
                        <li><a href="#">用户管理</a></li>
                        <li><a href="#">日志管理</a></li>
                    </ul>
                </li>
                <li><a href="#totalLi" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>调派资源 管理 </a>
                    <ul id="totalLi" class="collapse list-unstyled ">
                        <li><a href="#">医院</a></li>
                        <li><a href="#">消防队</a></li>
                    </ul>
                </li>
                <li><a href=# aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>返回登陆 </a>

                </li>
            </ul><span class="heading">Extras</span>
            <ul class="list-unstyled">
                <li> <a href="#"> <i class="icon-flask"></i>Demo </a></li>
                <li> <a href="#"> <i class="icon-screen"></i>Demo </a></li>
                <li> <a href="#"> <i class="icon-mail"></i>Demo </a></li>
                <li> <a href="#"> <i class="icon-picture"></i>Demo </a></li>
            </ul>
        </nav>
        <div class="content-inner">
            <div class="card">
                <div class="card-close">
                    <div class="dropdown">
                        <button type="button" id="closeCard4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-ellipsis-v"></i></button>
                        <div aria-labelledby="closeCard4" class="dropdown-menu dropdown-menu-right has-shadow"><a href="#" class="dropdown-item remove"> <i class="fa fa-times"></i>Close</a><a href="#" class="dropdown-item edit"> <i class="fa fa-gear"></i>Edit</a></div>
                    </div>
                </div>
                <div class="card-header d-flex align-items-center">
                    <h3 class="h1"  style="margin-left: 40%">资源调度中心主页</h3>
                </div>

                <div class="card-body">
                    <select name="account" class="form-control mb-3" style="width: 20%">
                        <option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">待处理</font></font></option>
                        <option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">正在处理</font></font></option>
                        <option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">处理完毕</font></font></option>
                    </select>
                    <div class="table-responsive">
                        <table class="table table-striped table-sm">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>上报时间</th>
                                <th>事件名称</th>
                                <th>事件编号</th>
                                <th>事件等级</th>
                                <th>事件地点</th>
                                <th>发生区域</th>
                                <th>事件类型</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="tbody1">

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-close">
                    <div class="dropdown">
                        <button type="button" id="closeCard5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-ellipsis-v"></i></button>
                        <div aria-labelledby="closeCard5" class="dropdown-menu dropdown-menu-right has-shadow"><a href="#" class="dropdown-item remove"> <i class="fa fa-times"></i>Close</a><a href="#" class="dropdown-item edit"> <i class="fa fa-gear"></i>Edit</a></div>
                    </div>
                </div>

            </div>
            <div id="div1" style="margin-left: 30%">
                <!-- Button trigger modal -->
             
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg"> 事件详情模态框按钮</button>

                <button type="button" class="btn btn-primary" name="ye" value="首页">首页</button>
                <button type="button" class="btn btn-primary" name="ye" value="上一页">上一页</button>
                <input type="number" style="width:50px" value="1">/<label id="totalPage">10</label>
                <button type="button" class="btn btn-primary" name="ye" value="下一页">下一页</button>
                <button type="button" class="btn btn-primary" name="ye" value="尾页">尾页</button>
            </div>

            
            <div class="form-group row" style="margin-left:600px;margin-top: 50px;">
                <label style="width: 100px">事件编号：</label>
                <div class="col-sm-9">
                    <div class="col-md-7">
                        <input type="text" placeholder="事件编号" class="form-control" name="eventid" >
                    </div>
                </div>
            </div>

            <div class="form-group row" style="margin-left:600px">
                <label style="width: 100px">事件类型：</label>
                <div class="col-sm-9">
                    <div class="col-md-7">
                        <input type="text" placeholder="事件类型" class="form-control" name="type">
                    </div>
                </div>
            </div>
            <div class="form-group row" style="margin-left:600px">
                <label style="width: 100px">起始时间：</label>
                <div class="col-sm-9">
                    <div class="col-md-7">
                        <input type="date" placeholder="起始时间" class="form-control" name="opentime">
                    </div>
                </div>
            </div>
            <div class="form-group row" style="margin-left:600px">
                <label style="width: 100px">结束时间：</label>
                <div class="col-sm-9">
                    <div class="col-md-7">
                        <input type="date" placeholder="结束时间" class="form-control" name="endtime">
                    </div>
                    <button type="button"  name="find" class="btn btn-primary" style="margin-top: 50px;">查询</button>
                    <br>
                    <a href="poi.jsp">POI</a>
                </div>
            </div>
            
        </div>

    </div>

</div>

<!-- JavaScript files-->
<script src="vendor/jquery/jquery.js"></script>
<script src="vendor/popper.js/umd/popper.min.js"> </script>
<script src="vendor/bootstrap/js/bootstrap.js"></script>
<script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
<script src="vendor/chart.js/Chart.min.js"></script>
<script src="vendor/jquery-validation/jquery.validate.min.js"></script>

<!-- Main File-->
<script src="js/front.js"></script>

<!-- Modal -->


<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h1 class="modal-title" id="myModalLabel">事件详情</h1>
            </div>
            <div class="modal-body">

                <div class="table-responsive">
                    <table class="table table-striped table-sm">
                        <thead>
                        <tr><th colspan="4" style="text-align: center;font-size: 20px" name="head">xx事件详情</th></tr>
                        </thead>


                        <tbody>
                        <tr><td >事件名称：</td><td id="eventname"></td><td>事件状态：</td><td id="status"></td></tr>
                        <tr><td >事件等级：</td><td id="level"></td><td>事件发生地：</td><td id="address"></td></tr>
                        <tr><td >事件类型：</td><td id="type"></td><td>事件发生区域：</td><td  id="area"></td></tr>
                        <tr><td >上报人：</td><td id="reportpeople"></td><td>报警人员：</td><td  id="alarmpeople"></td></tr>
                        <tr><td >上报时间：</td><td id="time"></td><td>报警人员电话：</td><td  id="alarmphone"></td></tr>
                        <tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table table-striped table-sm">
                    <thead>
                    <tr><th colspan="8" style="text-align: center;font-size: 20px">xx事件续报信息</th></tr>
                    <tr><th>续报编号</th><th>续报时间</th><th>等级</th><th>地点</th><th>类型</th><th>报警人员</th><th>报警人员电话</th></tr>
                    </thead>


                    <tbody id="xu">

                    </tbody>
                </table>
            </div>
            <div class="modal-footer" id="model1">
             
               
            </div>
        </div>
    </div>
</div>
</body>
</html>
