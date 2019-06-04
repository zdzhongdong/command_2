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

        width: 500px;
        margin: 50px auto;
        text-align: center;
    }
       #xiala {
            margin-bottom: 0px;
        }
        #xl{
            margin-bottom: 0px;
        }


    </style>
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

            <h1>添加模板</h1><br><br>

            <form action="../model/addmodel.lovo" method="post">
                <div class="form-group row">
                    <label class="col-sm-3 form-control-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">模板名称</font></font></label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="fMbname">
                    </div>
                </div>
                <div class="form-group row" id="xiala">
                    <label class="col-sm-3 form-control-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">模板类型</font></font></label>
                    <div class="col-sm-9">
                        <select name="fMbtype" class="form-control mb-3">
                            <option value="火灾"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">火灾</font></font></option>
                            <option value="房屋倒塌"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">房屋倒塌</font></font></option>
                         </select>
                    </div>

                </div>
                <div class="form-group row" id="xl">
                    <label class="col-sm-3 form-control-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">模板等级</font></font></label>
                    <div class="col-sm-9">
                        <select name="fMbrank" class="form-control mb-3">
                            <option value="1"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">1</font></font></option>
                            <option value="2"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">2</font></font></option>
                            <option value="3"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">3</font></font></option>
                        </select>
                    </div>

                </div>
                <div class="form-group row">
                    <label class="col-sm-3 form-control-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">医院人数</font></font></label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="fMbdocnum">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 form-control-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">救护车数量</font></font></label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="fMbambnum">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 form-control-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">消防队人数</font></font></label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="fMbfirnum">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 form-control-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">消防车数量</font></font></label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="fMbinfernum">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 form-control-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">制作人</font></font></label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="fMbmeaker">
                    </div>
                </div>
                 <div class="form-group row">
                    <label class="col-sm-3 form-control-label"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">制作人电话</font></font></label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="fMbmakertel">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">添加</font></font></button>
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