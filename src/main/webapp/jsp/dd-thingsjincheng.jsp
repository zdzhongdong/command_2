<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <%
	String path = request.getContextPath();
	String basePath = request.getServerName() + ":"
			+ request.getServerPort() + path + "/";
	String basePath2 = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
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
  
    <style>
    #context{

        width:100%;
        margin: 50px auto;
        text-align: center;
    }
    #xiala{
        width: 150px;

    }
        #xx td{
            width: 200px;
            text-align: left;
        }

    </style>
 <script type="text/javascript" src="js/jquery-2.1.4.js"></script>
   
    
    <script type="text/javascript">
    
	var path = '<%=basePath%>';
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
		  alert(event.data)
	  location.reload(true);
	
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
    	var thingsId='<%=request.getParameter("thingsId")%>';
    	$("#things").val(thingsId);
            	 var currpage=1;
              $.getJSON("../things/managershow.lovo",{'currpage':currpage,'thingsId':thingsId},show);   
              
              $("[type=button]").click(function(){
            	  var opera=this.value;
            	 var thispage=$("#thispage").val();
            	 var totalpage=$("#totalpage").text();
            	 var type=$("[name=tp] option:selected").val();
            	 if(opera=="shou"){
            		 currpage=1;
            	 }else if(opera=="shang"){
            		 currpage-=1;
            	 }
            	 else if(opera=="xia"){
            		 currpage+=1;
            	 }else if(opera=="wei"){
            		 currpage=totalpage;
            	 }
            	 if(currpage<1){
            		currpage=1;
            	}if(currpage>totalpage){
            		currpage=totalpage;
            	}
            	
            	$.getJSON("../things/managershow.lovo",{'zyType':type,'currpage':currpage,'thingsId':thingsId},show); 
              });
              
              
              $("a[name=a]").click(function(){
            	  var id=$("#hid").val();
            	
            	  var op=this.id;
            	  var thispage=$("#thispage2").val();
             	 var totalpage=$("#totalpage2").text();
             	 
             	 if(op=="shou2"){
             		 currpage=1;
             	 }else if(op=="shang2"){
             		 currpage-=1;
             	 }
             	 else if(op=="xia2"){
             		 currpage+=1;
             	 }else if(op=="wei2"){
             		 currpage=totalpage;
             	 }
             	 if(currpage<1){
             		currpage=1;
             	}if(currpage>totalpage){
             		currpage=totalpage;
             	}
             	
             	$.getJSON("../manage/findbyzyid.lovo",{'zyId':id,'currpage':currpage},show2); 
            	  
              });
    })
    
    function show(data){
    	 var str="";
    	
    	 $.each(data.list,function(i,e){
   		  str+="<tr>";
       	  str+="<td><font style='vertical-align: inherit;'><font style='vertical-align: inherit;'>"+e.fHosname+"</font></font></td>";
       	  str+="<td><font style='vertical-align: inherit;'><font style='vertical-align: inherit;'>"+e.fPeonum+"</font></font></td>";
       	  str+="<td><font style='vertical-align: inherit;'><font style='vertical-align: inherit;'>"+e.fCarnum+"</font></font></td>";
       	  str+="<td><font style='vertical-align: inherit;'><font style='vertical-align: inherit;'>"+e.fMainpeo+"</font></font></td>";
       	  str+="<td><font style='vertical-align: inherit;'><font style='vertical-align: inherit;'>"+e.fMainpeotel+"</font></font></td>";
       	  str+="<td><font style='vertical-align: inherit;'><font style='vertical-align: inherit;'>"+e.fYardman+"</font></font></td>";
       	  str+="<td><font style='vertical-align: inherit;'><font style='vertical-align: inherit;'>"+e.fTime+"</font></font></td>";
       	  str+="<td><font style='vertical-align: inherit;'><font style='vertical-align: inherit;'>"+e.fDealtype+"</font></font></td>";
       	  str+="<td><font style='vertical-align: inherit;'><font style='vertical-align: inherit;'>"+e.fZytype+"</font></font></td>";
       	  str+="<td><font style='vertical-align: inherit;'><font style='vertical-align: inherit;'><a data-toggle=modal data-target=#myModal onclick=find("+e.pkTid+")>查看详情</a></font></font></td>";
             str+="</tr>";
          
          $("#zyname").text(e.fHosname);
          $("#zyadd").text(e.fAdd);
          $("#mainpeo").text(e.fMainpeo);
          $("#tel").text(e.fMainpeotel);
          $("#totalpeo").text(e.fPeonum);
          $("#totalcar").text(e.fCarnum);
          $("#yard").text(e.fYardman);
          $("#yardtime").text(e.fTime);
        
             
   	  });
    	 $("#tb").html(str);
    	 $("#thispage").val(data.pageNum);
    	 $("#totalpage").text(data.pages);
    	 $("#thispage").attr("max",data.pages);
    }
    function test(aa){
    	var thingsId=$("#things").val();
    	var currpage=1;
	 $.post("../things/managershow.lovo",{'zyType':aa,'currpage':currpage,'thingsId':thingsId},show);
    }
    function testnum(bb){
 	   var type=$("[name=tp] option:selected").val();
 	  var thingsId=$("#things").val();
 	   $.post("../things/managershow.lovo",{'zyType':type,'currpage':bb,'thingsId':thingsId},show);
    }
    function find(id){
 
    	$("#hid").val(id);
    	curr=1;
    	$.getJSON("../manage/findbyzyid.lovo",{'currpage':curr,'zyId':id},show2);
    }
    function show2(data){
    	var str="";
		$.each(data.list,function(i,e){
			str+="<tr>";
			 str+="<td><font style='vertical-align: inherit;'><font style='vertical-align: inherit;'>"+e.fZyname+"</font></font></td>";
	       	  str+="<td><font style='vertical-align: inherit;'><font style='vertical-align: inherit;'>"+e.fTimeout+"</font></font></td>";
	       	  str+="<td><font style='vertical-align: inherit;'><font style='vertical-align: inherit;'>"+e.fTimeback+"</font></font></td>";
	       	 
			str+="</tr>";
		})
		$("#tby").html(str);
		$("#thispage2").val(data.pageNum);
   	 $("#totalpage2").text(data.pages);
   	 $("#thispage2").attr("max",data.pages);
    }
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

        <div id="context">
			<input type="hidden" id="things">
            <h1>XX事件进程信息</h1><br><br>
            <!-- 、下拉列表 -->
            <div class="col-sm-9" id="xiala">
                <select name="tp" class="form-control mb-3" onchange="test(this.value)">
                    <option value="">全部</option>
                    <option value="医院">医院</option>
                    <option value="消防">消防</option>
                </select>
            </div>
            <!-- 展示表格 -->
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-sm">
                        <thead>
                        <tr>
                            <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">资源名称</font></font></th>
                            <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">派出总人数</font></font></th>
                            <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">派出车辆数</font></font></th>
                            <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">负责人</font></font></th>
                            <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">负责人电话</font></font></th>
                            <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">调派人</font></font></th>
                            <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">调派时间</font></font></th>
                            <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">处理状态</font></font></th>
                            <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">资源类型</font></font></th>
                            <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">详情展示</font></font></th>
                        </tr>
                        </thead>
                        <tbody id="tb">
                      
                        </tbody>
                    </table>
                </div>
            </div>
            <!--分页-->
            <div>

                <button type="button" class="btn btn-primary" value="shou"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">首页</font></font></button>
                <button type="button" class="btn btn-primary" value="shang"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">上一页</font></font></button>
                 <input type="number" style="width:50px" value="1" id="thispage" min="1" max="" onchange="testnum(this.value)">/ <span id="totalpage">10</span>
                <button type="button" class="btn btn-primary" value="xia"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">下一页</font></font></button>
                <button type="button" class="btn btn-primary" value="wei"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">尾页</font></font></button>
            </div>
            <!-- Button trigger modal -->
           <!--  <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
                模态框查看权限详情
            </button> -->

            <!-- Modal -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <form action="#" method="post">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h2 class="modal-title" id="myModalLabel">XX事件资源详情展示</h2>
                            </div>
                            <div class="modal-body">

                                <table id="xx" >
                                    <tr>
                                        <td>资源名称：</td><td id="zyname">XX</td><td>资源地址：</td><td id="zyadd">XX</td>
                                    </tr>
                                    <tr>
                                        <td>负责人：</td><td id="mainpeo">XX</td><td>负责人电话：</td><td id="tel">XX</td>
                                    </tr>
                                    <tr>
                                        <td>派出总人数：</td><td id="totalpeo">XX</td><td>派出车辆数：</td><td id="totalcar">XX</td>
                                    </tr>
                                    <tr>
                                        <td>调度人：</td><td id="yard">XX</td><td>调度时间：</td><td id="yardtime">XX</td>
                                    </tr>

                                </table>

                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-sm">
                                            <thead>
                                            <tr>
                                                <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">派出资源名</font></font></th>
                                                <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">派出时间</font></font></th>
                                                <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">回归时间</font></font></th>

                                            </tr>
                                            </thead>
                                            <tbody id="tby">
                                            
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <!--分页-->
                                  <div>
				<input type="hidden" id="hid">
                <a name="a" class="btn btn-primary" id="shou2"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">首页</font></font></a>
                <a name="a" class="btn btn-primary" id="shang2"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">上一页</font></font></a>
                 <input type="number" style="width:50px" value="1" id="thispage2" min="1" onchange="testnum2(this.value)">/ <span id="totalpage2">10</span>
                <a name="a" class="btn btn-primary" id="xia2"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">下一页</font></font></a>
                <a name="a" class="btn btn-primary" id="wei2"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">尾页</font></font></a>
            </div>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
                                
                            </div>
                        </form>
                    </div>
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
</body>
</html>