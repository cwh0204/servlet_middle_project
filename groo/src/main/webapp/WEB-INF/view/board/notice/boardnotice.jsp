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

<div class="boardcontainer">
	<%@ include file="../boardlistnav.jsp"%>
	<div class="boardcotent">
	<%@ include file="noticesearch.jsp"%>
		<h2>공지사항 게시판</h2> <br>
		<%@ include file="boardnoticehome.jsp"%>
	</div>
</div>
<%@ include file="../boardpage.jsp"%>
</html>