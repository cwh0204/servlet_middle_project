<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet">
<title>Groo</title>
</head>
<body>
	<div class="container">
		<div class="box itemMember">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">님 환영합니다!</h5>
					<div class="item_button">
						<button class="btn btn-groo" type="button">상세정보</button>
						<button class="btn btn-groo" type="button">로그아웃</button>
					</div>
				</div>
				<div></div>
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
			<div>팀생성</div>
			<div>팀찾기</div>
		</div>
	</div>
</body>
</html>


<%-- <span>${userId} 님 환영합니다</span> --%>
<!-- <button type="button" class="btn custom-btn-success" onclick="location.href='//localhost:8090/groo/teamcreate.jsp'">팀 만들기</button> -->