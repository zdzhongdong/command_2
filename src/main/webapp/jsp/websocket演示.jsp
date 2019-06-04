<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getServerName() + ":"
			+ request.getServerPort() + path + "/";
	String basePath2 = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
"http://www.w3.org/TR/html4/strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<script type="text/javascript" src="js/jquery-2.1.4.js"></script>

<script type="text/javascript">

		var path = '<%=basePath%>';
		alert("ws://" + path + "ws.lovo");
		var websocket;
		
		if ('WebSocket' in window) {
			websocket = new WebSocket("ws://localhost:8080/Command_2/ws.lovo");
		} else if ('MozWebSocket' in window) {
			websocket = new MozWebSocket("ws://127.0.0.1:8080/Command_2 Maven Webapp/ws.lovo");
		} else {
			websocket = new SockJS("http://127.0.0.1:8080/Command_2 Maven Webapp/ws/sockjs.lovo");
		}
		websocket.onopen = function(event) {
			alert("WebSocket:已连接");

		};
		//接收服务器发送回来的消息
		websocket.onmessage = function(event) {
			  alert(event.data)
		   $("#xxid").html(event.data);
		
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
		</script>
</head>
<body>
<div id="xxid"></div>
sdddddddddddddddddd
	<input type="button" value="发送" class="send" onclick="sendMsg()" >
</body>
</html>
