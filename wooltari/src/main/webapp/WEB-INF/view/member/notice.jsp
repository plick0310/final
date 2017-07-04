<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
    <head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">
		<title>Wooltari</title>
		<!-- CSS -->
		<link rel="stylesheet" href="<%=cp%>/resource/css/bootstrap.css">
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" type="text/css" href="<%=cp%>/resource/css/header.css">
		<link rel="stylesheet" type="text/css" href="<%=cp%>/resource/css/style.css">
        <link rel="stylesheet" href="<%=cp%>/resource/fonts/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="<%=cp%>/resource/css/member-form-elements.css">
        <link rel="stylesheet" href="<%=cp%>/resource/css/member-form-style.css">
        
        <!-- Javascript -->
        <script src="<%=cp%>/resource/js/jquery-1.11.1.min.js"></script>
        <script src="<%=cp%>/resource/js/bootstrap.min.js"></script>
        
</head>

   	<body class="member-body">
		<div class="member-container">
			<div class="member-outer">
				<div class="member-inner">
					<div class="member-form">
						<div class="form-top">
							<span style="font-size: 25px; color: #BDBDBD; font-weight: bold;">
								<span style="font-size: 20px; color: #1abc9c;"
								class="glyphicon glyphicon-pencil"> </span>&nbsp;&nbsp;&nbsp;W O O L T A R I&nbsp;&nbsp;&nbsp;</span>
								<span style="font-size: 24px;"> N O T I C E</span>
						</div>
							<div class="form-group" style="margin-top: 50px">
								<strong>
								 ${message}
								</strong>
							</div>
							<div class="form-group" style="margin-top: 50px">
								<button type="button" class="member_btn" onclick="location.href='<%=cp%>/main'">메인화면으로</button>
							</div>
						</div>
					</div>
				</div>
			</div>
	</body>
</html>
		
