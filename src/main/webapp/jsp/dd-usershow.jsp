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
        #modal td{
            width: 150px;
            height: 100px;
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

            <h1>用户管理</h1><br><br>

            <div class="col-sm-9" id="xiala">
                            <select name="account" class="form-control mb-3">
                                <option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">普通用户</font></font></option>
                                <option><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">超级用户</font></font></option>

                            </select>
                        </div>

            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-sm">
                        <thead>
                        <tr>
                            <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">用户名</font></font></th>
                            <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">职位</font></font></th>
                            <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">权限</font></font></th>
                            <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">操作</font></font></th>

                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th scope="row"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">1</font></font></th>
                            <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">标记</font></font></td>
                            <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">玫瑰油</font></font></td>
                            <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">@mdo</font></font></td>

                        </tr>
                        <tr>
                            <th scope="row"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">2</font></font></th>
                            <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">雅各</font></font></td>
                            <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">桑顿</font></font></td>
                            <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">@脂肪</font></font></td>

                        </tr>
                        <tr>
                            <th scope="row"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">3</font></font></th>
                            <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">拉里</font></font></td>
                            <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">鸟</font></font></td>
                            <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">@推特</font></font></td>

                        </tr>
                        <tr>
                            <th scope="row"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">4</font></font></th>
                            <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">标记</font></font></td>
                            <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">玫瑰油</font></font></td>
                            <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">@mdo</font></font></td>

                        </tr>
                        <tr>
                            <th scope="row"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">五</font></font></th>
                            <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">雅各</font></font></td>
                            <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">桑顿</font></font></td>
                            <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">@脂肪</font></font></td>

                        </tr>
                        <tr>
                            <th scope="row"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">6</font></font></th>
                            <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">拉里</font></font></td>
                            <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">鸟</font></font></td>
                            <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">@推特</font></font></td>

                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <!--分页-->
            <div>

                <button type="button" class="btn btn-primary"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">首页</font></font></button>
                <button type="button" class="btn btn-primary"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">上一页</font></font></button>
                <input type="number" style="width:50px" value="1"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">/ </font></font><label id="totalPage"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">10</font></font></label>
                <button type="button" class="btn btn-primary"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">下一页</font></font></button>
                <button type="button" class="btn btn-primary"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">尾页</font></font></button>
            </div>

            <button type="button" class="btn btn-primary"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">添加用户</font></font></button>
        </div>
    </div>
</div>


<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
   模态框查看权限详情
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form action="#" method="post">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h2 class="modal-title" id="myModalLabel">权限修改</h2>
            </div>
            <div class="modal-body">

                    <table id="modal" border="1">
                        <tr>
                            <td>用户名：</td><td>XX</td><td  rowspan="2">3</td>
                        </tr>
                        <tr>
                            <td>职&nbsp; &nbsp;位：</td><td>XX</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="quanxian" value="yh"/>用户管理</td>
                            <td><input type="checkbox" name="quanxian" value="mb"/>模板管理</td>
                            <td><input type="checkbox" name="quanxian" value="dd"/>调度管理</td>
                        </tr>
                    </table>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Save changes</button>
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