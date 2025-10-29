<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="jquery/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main/mainHeader/mainHeader.js"></script>
<link rel="stylesheet" href="css/main/mainheader.css">
<title>Insert title here</title>
</head>
<body>
	<header>
		<div class="flex_container heder_container">
			<img class="logo" src="./images/로고.png">
			<div class="flex_container main_kategorie_box">
				<div class="menu-item-content active" data-page="mainhome.do">HOME</div>
				<div class="menu-item-content" data-page="boardnotice.do">공지사항</div>
				<div class="menu-item-content" data-page="teamcreate.do">팀</div>
				<div class="menu-item-content" data-page="boardfree.do">자유게시판</div>
				<div class="menu-item-content" data-page="intro.do">Groo 소개글</div>
			</div>

			<div class="dropdown">
				<a class="btn btn-secondary dropdown-toggle" href="#" role="button"
					id="dropdownMenuLink" data-bs-toggle="dropdown"
					aria-expanded="false"><i class="bi bi-person-circle fs-3"></i></a>
				<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
					<li><a class="dropdown-item" data-page="userdetail.do">계정 설정</a></li>
					<li><a class="dropdown-item" data-page="mypage.do">마이 페이지</a></li>
				</ul>
			</div>
		</div>
	</header>
</body>
</html>