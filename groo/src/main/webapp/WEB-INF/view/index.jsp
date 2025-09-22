<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String userId = (String) session.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet">
<script src="jquery/jquery-3.7.1.min.js"></script>
<script src="js/index.js"></script>
<title>Groo</title>
</head>
<body>
	<div class="container">
		<div class="box Member">
			<div class="item card">
				<h5 class="Title">${sessionScope.userId}님<br> 환영합니다!</h5>
				<div class="item memberBtn">
					<button class="btn btn-groo" type="button">상세정보</button>
					<button class="btn btn-groo" type="button">로그아웃</button>
				</div>
			</div>
			<div class="box itemMystudy">
				<div>님의 스터디</div>
				<div class="list-group">
					<a href="#" class="list-group-item list-group-item-action">A
						simple default list group item</a> <a href="#"
						class="list-group-item list-group-item-action list-group-item-primary">A
						simple primary list group item</a> <a href="#"
						class="list-group-item list-group-item-action list-group-item-secondary">A
						simple secondary list group item</a> <a href="#"
						class="list-group-item list-group-item-action list-group-item-success">A
						simple success list group item</a> <a href="#"
						class="list-group-item list-group-item-action list-group-item-danger">A
						simple danger list group item</a> <a href="#"
						class="list-group-item list-group-item-action list-group-item-warning">A
						simple warning list group item</a> <a href="#"
						class="list-group-item list-group-item-action list-group-item-info">A
						simple info list group item</a> <a href="#"
						class="list-group-item list-group-item-action list-group-item-light">A
						simple light list group item</a> <a href="#"
						class="list-group-item list-group-item-action list-group-item-dark">A
						simple dark list group item</a>
				</div>
			</div>
		</div>
		<div class="box studyDetail">
			<div>스터디 상세 정보</div>
		</div>
		<div class="box createTeam">
			<div class="item studyBtn">
				<button type="button" class="btn btn-primary">스터디 만들기</button>
				<button type="button" class="btn btn-warning">스터디 찾기</button>
			</div>
		</div>
	</div>
</body>
</html>