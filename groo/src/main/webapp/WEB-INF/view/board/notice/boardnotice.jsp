<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/base.css" rel="stylesheet">
<link href="css/board/board.css" rel="stylesheet">
</head>
<style>
</style>
<body>
	<%@ include file="noticesearch.jsp"%>
	<div class=boardcontainer>
		<%@ include file="../boardlistnav.jsp"%>
		<div class="boardcotent"></div>
		<%@ include file="boardnoticehome.jsp"%>
	</div>
	<%@ include file="../boardpage.jsp"%>
</body>
</html>