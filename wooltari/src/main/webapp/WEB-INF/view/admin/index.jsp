<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>W O O L T A R I - A D M I N</title>

    <!-- Bootstrap Core CSS -->
    <link href="<%=cp%>/resource/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<%=cp%>/resource/admin/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=cp%>/resource/admin/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="<%=cp%>/resource/admin/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=cp%>/resource/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

	<!-- jQuery -->
    <script src="<%=cp%>/resource/admin/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<%=cp%>/resource/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="<%=cp%>/resource/admin/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="<%=cp%>/resource/admin/raphael/raphael.min.js"></script>
    <script src="<%=cp%>/resource/admin/morrisjs/morris.min.js"></script>
    <script src="<%=cp%>/resource/admin/data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="<%=cp%>/resource/admin/sb-admin-2.js"></script>
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

	<script type="text/javascript">
	var mode = "dashboard";
	var page = 1;
	var searchKey = "userId";
	var searchValue = "";
	$(document).ready(function(){
		pageload();
		$("#side-menu li").click(function () {
			mode = $(this).attr('id');
			page=1;
			searchKey = "userId";
			searchValue = "";
			$("#side-menu li").removeClass("active");
			$(this).addClass("active");
			pageload();
		});
	});
	
	function paging(paging) {
		//alert(paging);
		page = paging;
		pageload();
	}

	function search(){
		searchKey=$('#searchKey').val();
		searchValue=$('#searchValue').val();
		pageload();
	}
	function pageload(){
		$.ajax({
			url:"<%=cp%>/admin/" + mode + "?page=" + page + "&searchKey=" + searchKey + "&searchValue=" + searchValue,
			dataType:"html",
			success : function(data) {
			$('#page-wrapper').html(data);
			}
		});
	}
	</script>
</head>

<body>
	<!-- 페이지 시작 -->
    <div id="wrapper">

        <!-- 우측/좌측 메뉴 시작 -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <a class="navbar-brand" href="index.html">WOOLTARI ADMIN</a>
            </div>
            
            <!-- 우측 상단 드랍다운 메뉴 시작 -->
            <ul class="nav navbar-top-links navbar-right">
	            <!-- 메시지 -->
            	<!-- 
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>Read All Messages</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    /.dropdown-messages
                </li>
                 -->
                
                <!-- 알림 -->
                <!-- 
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-comment fa-fw"></i> New Comment
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                    <span class="pull-right text-muted small">12 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i> Message Sent
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-tasks fa-fw"></i> New Task
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Alerts</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    /.dropdown-alerts
                </li>
                -->
                <!-- 회원 -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                </li>
                
            </ul>
            <!-- 우측 상단 드랍다운 메뉴 끝 -->

			<!-- 좌측 사이드 메뉴 시작 -->
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li id="dashboard" class="active">
                            <a href="#"><i class="fa fa-dashboard fa-fw"></i>대시보드</a>
                        </li>
                        <li id="member">
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>회원관리</a>
                        </li>
                        <li id="???">
                            <a href="#"><i class="fa fa-table fa-fw"></i>~~관리</a>
                        </li>
                        <li id="???">
                            <a href="#"><i class="fa fa-edit fa-fw"></i>~~관리</a>
                        </li>
                        <li id="???">
                            <a href="#"><i class="fa fa-wrench fa-fw"></i>~~관리</a>
                            <!-- 하위 메뉴가 필요할 경우 사용 -->
                            <!-- 
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="panels-wells.html">Panels and Wells</a>
                                </li>
                            </ul>
                             -->
                      사이드 메뉴 끝 
        </nav>
        <!-- 우측/좌측 메뉴 끝 -->
	
        <div id="page-wrapper">
        <!-- 페이지가 들어가는 곳 -->
        </div>

    </div>
    <!-- 페이지 끝 -->
    
</body>
</html>