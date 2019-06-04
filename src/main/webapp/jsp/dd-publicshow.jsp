<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    <style>
        #context{
            width: 100%;

            margin: 50px auto;
            text-align: center;
        }
        #xiala{
            width: 150px;

        }

    </style>
    <script type="text/javascript" src="js/jquery-2.1.4.js"></script>
    
    <script type="text/javascript">
    	$(function(){
    		$.getJSON("../publi/findall.lovo",show)
    		
    	})
    	
    	function show(data){
    		var str="";
    		$.each(data,function(i,e){
    			str+="<tr>";
    			str+="<th><font style='vertical-align: inherit;'><font style='vertical-align: inherit;'>"+e.fType+"</font></font></th>";
    			str+="<th><font style='vertical-align: inherit;'><font style='vertical-align: inherit;'>"+e.fKey+"</font></font></th>";
    			str+="<th><font style='vertical-align: inherit;'><font style='vertical-align: inherit;'>"+e.fValue+"</font></font></th>";
    			str+="<th><font style='vertical-align: inherit;'><font style='vertical-align: inherit;'><a href='../publi/delpublic.lovo?id="+e.pkId
    					+"'>删除</a><a data-toggle=modal data-target=#myModal onclick=test("+e.pkId+")>修改</a></font></font></th>";
    			str+="</tr>";
    		         
    		})
    		$("#tb").html(str);
    	}
    	function test(id){
    		
    		$.getJSON("../publi/findbyidpublic.lovo",{"id":id},function(data){
    			
    			$("[name=id]").val(data.pkId);
    			$("option").text(data.fType)
    			$("[name=key]").val(data.fKey);
    			$("[name=valu]").val(data.fValue);
    		});
    	}
    </script>
</head>
<body>
<!-- href=../publi/findbyidpublic.lovo?id="+e.pkId+" -->
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

        <div id="context">

            <h1>公共模块管理</h1><br><br>

            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-sm">
                        <thead>
                        <tr>
                            <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">类型</font></font></th>
                            <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">键</font></font></th>
                            <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">值</font></font></th>
                            <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">操作</font></font></th>
                        </tr>
                        </thead>
                        <tbody id="tb">                     
                        </tbody>
                    </table>
                </div>
            </div>
            <a href="dd-publicadd.jsp" class="btn btn-primary"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">添加模块</font></font></a>
        </div>
    </div>
</div>


<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form action="../publi/updatepublic.lovo" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h2 class="modal-title" id="myModalLabel">模块信息修改</h2>
                </div>
                <div class="modal-body">
                    <div id="context1">



                        <form action="../publi/updatepublic.lovo" method="post">
						<input type="hidden" value="${pe.pkId }" name="id">
                            <div class="form-group row" >
                                <label class="col-sm-3 form-control-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">类型</font></font></label>
                                <div class="col-sm-9">
                                    <select id="sel" name="account" class="form-control mb-9" disabled="disabled">
                                        <option id="等级"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font></option>
                                        <option id="类型"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font></option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">键</font></font></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="key">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">值</font></font></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" disabled="disabled" name="valu">
                                </div>
                            </div>

			                <div class="modal-footer">
			                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			                    <button type="submit" class="btn btn-primary">保存</button>
			                </div>
			            </form>
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