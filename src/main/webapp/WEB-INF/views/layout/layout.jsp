<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="x-ua-compatible" content="ie=edge">

 <title>회원 관리</title>

 	<tiles:insertAttribute name="commonLib"/>


</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<tiles:insertAttribute name="header"/>

		<tiles:insertAttribute name="left"/>
		
		<tiles:insertAttribute name="content"/>
		
	</div>

	<tiles:insertAttribute name="footer"/>

	

</body>
</html>
