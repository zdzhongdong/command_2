<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
    <link rel="stylesheet" href="css/city.css">
    <script src="js/jquery-2.1.4.js"></script>
    <!-- JavaScript files-->
<script src="vendor/jquery/jquery.js"></script>
<script src="vendor/popper.js/umd/popper.min.js"> </script>
<script src="vendor/bootstrap/js/bootstrap.js"></script>
<script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
<script src="vendor/chart.js/Chart.min.js"></script>
<script src="vendor/jquery-validation/jquery.validate.min.js"></script>
 
   

<!-- Main File-->
<script src="js/front.js"></script>
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
<script type="text/javascript">
    function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
        var r = window.location.search.substr(1).match(reg);  //匹配目标参数
        if (r != null) return unescape(r[2]); return null; //返回参数值

}
      $(function(){
    	
    	
    	  var a = getUrlParam("eventid")
var aa
    //<!--事件编号-->	
    	  $("input[name=thingid]").val(a);
  	     $.post("<%=basePath%>event/event.lovo",{thingnum:a},function(data){
  	    	 // <!--事件地址--> 
  	    	 $("input[name=address]").val(data.fAdress)
  	    	//  <!--事件区域封装--> 
  	    	  $("#area1").text(data.fField)
  	    	  var ccc=data.fField

  	    	    $.post("<%=basePath%>zy/zy.lovo",{area:ccc},function(data){
  	    	 	  $.each(data,function(j,l){
  	    	 		  var a=l.fZyurl
  	    	 		var idc=  l.pkId
  	    	 		$.ajax({
  						url:""+l.fZyurl+"",
  						type:"GET",
  						dataType:"jsonp",
  						 jsonp:"theFunction",
  						success:function(data){
  						
  
  							if (data.stockType=="医院") {
								$("#all1").append("<tr><td>*</td><td>"+data.stockName+"</td><td name="+j+"库医人>"+data.firemanCount+"</td><td><button id="+j+"  name=加医人 class=aa>增派一人数</button></td><td name="+j+"库医车>"+data.carCount+"</td><td><button id="+j+" name=加医车 class=aa>增派一车</button></td><td name="+j+"选医人>0</td><td><button id="+j+" name=减医人 class=aa>减少一人</button></td><td name="+j+"选医车>0</td><td><button id="+j+" name=减医车 class=aa>减少一车</button></td></tr>")
								$(".aa").click(function(){
							        var  n = this.name
							        var m =this.id
								if (n=="加医人") {
								    var yiren=	$("td[name="+m+"库医人]").text()
								    var kuyiren=  parseInt(yiren)
								    kuyiren=kuyiren-1
								    if (kuyiren<0) {
										kuyiren=0
										return
									}
								    $("td[name="+m+"库医人]").text(kuyiren)								    
								    var xuanren = $("td[name="+m+"选医人]").text()
								    var xuanyiren= parseInt(xuanren)
								    xuanyiren =xuanyiren+1
								    $("td[name="+m+"选医人]").text(xuanyiren)
								    var all= $("input[name=docnum]").val()
								    var alll = parseInt(all)
								    alll=alll+1
								    $("input[name=docnum]").val(alll)
								    
								}
							        
								else if (n=="加医车") {
									   var yiche=	$("td[name="+m+"库医车]").text()
									    var kuyiche=  parseInt(yiche)
									    kuyiche=kuyiche-1
									    if (kuyiche<0) {
									    	kuyiche=0
											return
										}
									    $("td[name="+m+"库医车]").text(kuyiche)								    
									    var xuanche = $("td[name="+m+"选医车]").text()
									    var xuanyiche= parseInt(xuanche)
									    xuanyiche =xuanyiche+1
									    $("td[name="+m+"选医车]").text(xuanyiche)  
									      var all= $("input[name=doccarnum]").val()
								    var alll = parseInt(all)
								    alll=alll+1
								    $("input[name=doccarnum]").val(alll)
									    
								}
								else if (n=="减医车") {
									var xuanche = $("td[name="+m+"选医车]").text()
									    var xuanyiche= parseInt(xuanche)
									    xuanyiche =xuanyiche-1
									    if (xuanyiche<0) {
									    	xuanyiche==0
									    
									    	return
										}
									    $("td[name="+m+"选医车]").text(xuanyiche)   
									    var yiche=	$("td[name="+m+"库医车]").text()
									    var kuyiche=  parseInt(yiche)
									    kuyiche=kuyiche+1
									    $("td[name="+m+"库医车]").text(kuyiche)	
									      var all= $("input[name=doccarnum]").val()
								    var alll = parseInt(all)
								    alll=alll-1
								    $("input[name=doccarnum]").val(alll)
									    
								}
								else if (n=="减医人") {
																    
									    var xuanren = $("td[name="+m+"选医人]").text()
									    var xuanyiren= parseInt(xuanren)
									    xuanyiren =xuanyiren-1

									    if (xuanyiren<0) {
									    	xuanyiren=0
									    	 $("td[name="+m+"选医人]").text(xuanyiren)
											return
										}
									    $("td[name="+m+"选医人]").text(xuanyiren)
									    var yiren=	$("td[name="+m+"库医人]").text()
									    var kuyiren=  parseInt(yiren)
									    kuyiren=kuyiren+1
									    $("td[name="+m+"库医人]").text(kuyiren)	
									      var all= $("input[name=docnum]").val()
								    var alll = parseInt(all)
								    alll=alll-1
								    $("input[name=docnum]").val(alll)
									}
								})
							}
  							else{
  							
								$("#all2").append("<tr><td>*</td><td>"+data.stockName+"</td><td name="+j+"库消人>"+data.firemanCount+"</td><td><button name=加消人 class=bb id="+j+">增派一人数</button></td><td name="+j+"库消车>"+data.carCount+"</td><td><button name=加消车 id="+j+" class=bb>增派一车</button></td><td name="+j+"选消人>0</td><td><button id="+j+" name=减消人 class=bb>减少一员</button></td><td name="+j+"选消车>0</td><td><button id="+j+" name=减消车 class=bb>减少一车</button></td></tr>")
							$(".bb").click(function(){
							        var  n = this.name
							        var m =this.id
								if (n=="加消人") {
								    var yiren=	$("td[name="+m+"库消人]").text()
								    var kuyiren=  parseInt(yiren)
								    kuyiren=kuyiren-1
								    if (kuyiren<0) {
										kuyiren=0
										return
									}
								    $("td[name="+m+"库消人]").text(kuyiren)								    
								    var xuanren = $("td[name="+m+"选消人]").text()
								    var xuanyiren= parseInt(xuanren)
								    xuanyiren =xuanyiren+1
								    $("td[name="+m+"选消人]").text(xuanyiren)
								    var all= $("input[name=xiaonum]").val()
								    var alll = parseInt(all)
								    alll=alll+1
								    $("input[name=xiaonum]").val(alll)
								    
								}
							        
								else if (n=="加消车") {
									   var yiche=	$("td[name="+m+"库消车]").text()
									    var kuyiche=  parseInt(yiche)
									    kuyiche=kuyiche-1
									    if (kuyiche<0) {
									    	kuyiche=0
											return
										}
									    $("td[name="+m+"库消车]").text(kuyiche)								    
									    var xuanche = $("td[name="+m+"选消车]").text()
									    var xuanyiche= parseInt(xuanche)
									    xuanyiche =xuanyiche+1
									    $("td[name="+m+"选消车]").text(xuanyiche)  
									      var all= $("input[name=xiaocarnum]").val()
								    var alll = parseInt(all)
								    alll=alll+1
								    $("input[name=xiaocarnum]").val(alll)
									    
								}
								else if (n=="减消车") {
									var xuanche = $("td[name="+m+"选消车]").text()
									    var xuanyiche= parseInt(xuanche)
									    xuanyiche =xuanyiche-1
									    if (xuanyiche<0) {
									    	xuanyiche==0
									    
									    	return
										}
									    $("td[name="+m+"选消车]").text(xuanyiche)   
									    var yiche=	$("td[name="+m+"库消车]").text()
									    var kuyiche=  parseInt(yiche)
									    kuyiche=kuyiche+1
									    $("td[name="+m+"库消车]").text(kuyiche)	
									      var all= $("input[name=xiaocarnum]").val()
								    var alll = parseInt(all)
								    alll=alll-1
								    $("input[name=xiaocarnum]").val(alll)
									    
								}
								else if (n=="减消人") {
																    
									    var xuanren = $("td[name="+m+"选消人]").text()
									    var xuanyiren= parseInt(xuanren)
									    xuanyiren =xuanyiren-1

									    if (xuanyiren<0) {
									    	xuanyiren=0
									    	 $("td[name="+m+"选消人]").text(xuanyiren)
											return
										}
									    $("td[name="+m+"选消人]").text(xuanyiren)
									    var yiren=	$("td[name="+m+"库消人]").text()
									    var kuyiren=  parseInt(yiren)
									    kuyiren=kuyiren+1
									    $("td[name="+m+"库消人]").text(kuyiren)	
									      var all= $("input[name=xiaonum]").val()
								    var alll = parseInt(all)
								    alll=alll-1
								    $("input[name=xiaonum]").val(alll)
									}
								})
  							}
  						}
  					});
  	      
  	      
  	      	  })
  	    	    })
  	    	  $("#en").text("事件名称:"+data.fName)
  	    	    $("#tn").text("灾害类型:"+data.fkType)
  	    	      $("#ln").text("事件等级:"+data.fkLevel)
  	    	      
  	    	      $.post("<%=basePath%>model/findModelByTypeAndRank.lovo",{type:data.fkType,rank:data.fkLevel},function(data){
  	    	    	  $.each(data,function(i,e){
  	    	    		  
  	    	    		  
  	    	    		  $("#mode").append("<tr><td>*</td><td>"+e.fMbname+"</td><td>"+e.fMbrank+"</td><td>"+e.fMbdocnum+"</td><td>"+e.fMbambnum+"</td><td>"+e.fMbfirnum+"</td><td>"+e.fMbinfernum+"</td></tr>")
  	    	    	  })
  	    	      })
  	    
  	     })
  	        $.post("<%=basePath%>manage/findziyuannum.lovo",{manageid:a},function(data){
  	        	var docpeople =0;
  	        	var doccar=0;
  	        	var xiaopeople=0;
  	        	var xiaocar=0;
  	        	if (data!=null&&data!="") {
				 $.each(data,function(u,g){
					if (g.fZytype=="医院") {
						docpeople=docpeople+g.fPeonum
						doccar=doccar+g.fCarnum
					}
					else {
						xiaopeople=xiaopeople+g.fPeonum
						xiaocar=xiaocar+g.fCarnum
					}
				 })
				 $("#people").append("<tr><td>*</td><td>"+docpeople+"</td><td>"+doccar+"</td><td>"+xiaopeople+"</td><td>"+xiaocar+"</td></tr>")
				}
  	        	else{
  	        		$("#people").append("<tr><td>*</td><td>0</td><td>0</td><td>0</td><td>0</td></tr>")
  	        	}
  	        })
  	 
  	 
  	      $("button[name=diaodu]").click(function(){
  	    	  var d = $("input[name=thingid]").val()
  	    	$(location).attr('href', 'http://172.20.10.7:6060/Command_2/jsp/dd-thingsjincheng.jsp?thingsId='+d+'');
  	    	$("#all1").find("tr").each(function(){
  	    		    var tdArr = $(this).children();
  	    		    var $yiyuanname = tdArr.eq(1).text();
  	    		    var $docnum = tdArr.eq(6).text();//人
  	    		    var $doccar = tdArr.eq(8).text();;//  车
  	    		var $thingnum = $("input[name=thingid]").val();
  	    		$.post("<%=basePath%>manage/addshow.lovo",{name:$yiyuanname,num:$docnum,car:$doccar,thingnum:$thingnum,type:'医院'},function(data){
  	    		
  	    		})
  	    		  });
  	  	$("#all2").find("tr").each(function(){
	    		    var tdArr = $(this).children();
	    		    var $yiyuanname = tdArr.eq(1).text();
	    		    var $docnum = tdArr.eq(6).text();//人
	    		    var $doccar = tdArr.eq(8).text();;// 车
	    		var $thingnum = $("input[name=thingid]").val();
	    		$.post("<%=basePath%>manage/addshow.lovo",{name:$yiyuanname,num:$docnum,car:$doccar,thingnum:$thingnum,type:'消防队'},function(data){
	    		
	    		})
	    
	    		  });
	  
  	      })
  	     
      })


</script>
</head>

<body>

<div class="page">
<form action="<%=basePath%>manage/add.lovo" method="post">
<input type="hidden" name="thingid">
<input type="hidden" name="zyidyi">
<input type="hidden" name="zyidxiao">
<input type="hidden" name="hosname                                                                                                                                                                                                        ">
<input type="hidden" name="address">
<input type="hidden" name="peoplenumyi">
<input type="hidden" name="peoplenumxiao">
<input type="hidden" name="carnumyi">
<input type="hidden" name="carnumxiao">

<input type="hidden" name="time">
<input type="hidden" name="yardman">

<input type="hidden" name="type">
<input type="hidden" name="status">
</form>
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
                        <li><a href="#">添加模版</a></li>
                        <li><a href="#">模版一览</a></li>
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
                    <h3 class="h1" style="margin-left: 40%">调度资源</h3>
                </div>
                    <label class="h2" id="en">事件名称：</label><br>
                    <label class="h2" id="tn">灾害类型：</label><br>
                    <label class="h2" id="ln">事件等级：</label><br>
                    <div class="table-responsive">
                        <table class="table table-striped table-sm">
                            <thead>
                            <tr><td colspan="7" align="center"><h2 style="color: red">自动匹配模版</h2></td></tr>
                            <tr>
                                <th>#</th>
                                <th>预案模版名称</th>
                                <th>预案模版等级</th>
                                <th>需要医护人员</th>
                                <th>需要救护车数量</th>
                                <th>需要消防队人员</th>
                                <th>需要消防车数量</th>
                            </tr>
                            </thead>
                            <tbody id="mode">

                            </tbody>
                        </table>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped table-sm">

                            <thead>
                            <tr><td colspan="7" align="center"><h2 style="color: red">已派选列表</h2></td></tr>
                            <tr>
                                <th>#</th>
                                <th>医生人数</th>
                                <th>医院车辆</th>
                                <th>消防队人数</th>
                                <th>消防车辆人数</th>
                            </tr>
                            </thead>
                            <tbody id="people">

                            </tbody>
                        </table>


                    </div>

                     <hr/>

                    <div class="ku">

                        <span id="area1">请选择事发地址（必选）</span>
                        <div class="xiala">
                            <h1><span>确认</span></h1>
                        </div>
                    </div>
                     <script src="js/diquxuanzhe.js"></script>
                    

                    <div class="table-responsive">
                        <table class="table table-striped table-sm" name="yiyuan">

                        <thead>
                        <tr><td colspan="9" align="center"><h2 style="color: red">该区域医院</h2></td></tr>
                        <tr>
                            <th>#</th>
                            <th>医院名称</th>
                            <th>可调派人数</th>
                            <th>^</th>
                            <th>可调派车辆数</th>
                            <th>^</th>
                            <th>已选人数</th>
                            <th>^</th>
                            <th>已选车辆数</th>
                            <th>^</th>
                        </tr>
                        </thead>
                        <tbody id="all1">

                        </tbody>
                    </table>


                </div>
                    <div class="table-responsive">
                        <table class="table table-striped table-sm" name="xiaofang">

                            <thead>
                            <tr><td colspan="9" align="center"><h2 style="color: red">该区域消防队</h2></td></tr>
                            <tr>
                                <th>#</th>
                                <th>消防队名称</th>
                                <th>可调派人数</th>
                                 <th>^</th>
                                <th>可调派车辆数</th>
                                <th>^</th>
                                <th>已选人数</th>
                                <th>^</th>
                            <th>已选车辆数</th>
                            <th>^</th>
                            </tr>
                            </thead>
                            <tbody id="all2">

                            </tbody>
                        </table>


                    </div>

                <div class="table-responsive">
                    <table class="table table-striped table-sm">

                        <thead>
                        <tr><td colspan="7" align="center"><h2 style="color: red">当前调派选中人数</h2></td></tr>
                        <tr>
                            <th>#</th>
                            <th> <div class="form-group row">
                                <label style="width: 72px">医生人数：</label>
                                <div class="col-sm-9">
                                    <div class="col-md-7">
                                        <input type="text" placeholder="医生人数" name="docnum" class="form-control" value="0">
                                    </div>
                                </div>
                            </div></th>
                            <th><div class="form-group row">
                                <label style="width: 72px">医院车辆：</label>
                                <div class="col-sm-9">
                                    <div class="col-md-7">
                                        <input type="text" placeholder="医院车辆" name="doccarnum" class="form-control" value="0">
                                    </div>
                                </div>
                            </div></th>
                            <th><div class="form-group row">
                                <label style="width: 72px">消防人数：</label>
                                <div class="col-sm-9">
                                    <div class="col-md-7">
                                        <input type="text" placeholder="消防人数" name="xiaonum" class="form-control" value="0">
                                    </div>
                                </div>
                            </div></th>
                            <th><div class="form-group row">
                                <label style="width: 72px">消防车辆：</label>
                                <div class="col-sm-9">
                                    <div class="col-md-7">
                                        <input type="text" placeholder="消防车辆" name="xiaocarnum" class="form-control" value="0">
                                    </div>
                                </div>
                            </div></th>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>


                </div>

                <div id="div1" style="margin-left: 40%">


                    <button type="button" class="btn btn-primary">返回</button>

                    <button type="button" class="btn btn-primary" style="margin-left: 10%" name="diaodu">申请调度</button>
                </div>

            </div>



        </div>
    </div>
</div>
</div>

</body>
