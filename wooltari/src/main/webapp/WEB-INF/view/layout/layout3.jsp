<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
   String cp = request.getContextPath();
// String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+cp;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wooltari</title>

<link rel="shortcut icon" href="<%=cp%>/resource/favicon.ico">
<link rel="stylesheet" href="<%=cp%>/resource/css/bootstrap.css">
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/resource/css/header.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/resource/fonts/font-awesome/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/resource/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/resource/css/prettyPhoto.css">
<link href='http://fonts.googleapis.com/css?family=Lato:400,700,900,300' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800,600,300' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="<%=cp%>/resource/css/base.css">
<link rel="stylesheet" href="<%=cp%>/resource/css/css-classes.min.css">
<link rel="stylesheet" href="<%=cp%>/resource/jquery/css/smoothness/jquery-ui.min.css" type="text/css">

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/front_js.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/js/jquery-ui.min.js"></script>


</head>

<body>

<div class="header">
    <tiles:insertAttribute name="header"/>
</div>
	
<div class="contentbody">
    <tiles:insertAttribute name="body"/>
</div>

<div class="footer">
    <tiles:insertAttribute name="footer"/>
</div>

</body>
</html>