<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>team create</title>

<!-- CSS 파일 연결 -->
<link href="css/base.css" rel="stylesheet">
<link href="css/teamcreate.css" rel="stylesheet">


</head>
<body>
	<header>
		<div class="header_Container">
			<img src="./images/로고.png" alt="로고" class="img-fluid">
			<div class="searchbar">
				<input type="text" class="form-control"
					placeholder="find the group you're looking for">
				<button type="button" class="btn btn-success">searching</button>
			</div>
			<div class="reightNavi_box">
				<ul>
					<li>home</li>
					<li>notice</li>
					<li>my page</li>
					<li>go board</li>
					<li>logout</li>
				</ul>
			</div>

		</div>

	</header>


	<main>
		<div class="underLine"></div>
		<div class="create_Line"></div>
		<h3>스터디 생성</h3>
		<form action="teamcreate" method="post">

			<div class="category_container">
				<div class="studyTitle_box">
					<input type="text" name="teamName" class="form-control"
						placeholder="스터디명을 입력해주세요.">
				</div>
				<div class="studyLeader_box">
					<input type="text" name="userId" class="form-control"
						placeholder="스터디장을 입력하세요.">
				</div>
				<div class="interest_box">
					<input type="text" name="teaminterest" class="form-control"
						placeholder="관심사체크.">
				</div>
				<div class="studycontent_box">
					<input type="text" name="teamInfo" class="form-control"
						placeholder="개설하실 스터디에 대해 설명해주세요.">
				</div>
				<div class="membercount_box">
					<input type="text" name="teamMember" class="form-control"
						placeholder="모집인원(필터박스로 설정)">
				</div>
				<div class="teamCategory_box">
					<input type="text" name="teamCategory" class="form-control"
						placeholder="팀 카테고리 (category) → 개발, 디자인, 마케팅, 어학 등">
				</div>


				<button type="submit" class="btn btn-primary submit-btn">Submit</button>

			</div>
			<div class="underLine"></div>
			<div class="create_Line"></div>
		</form>

	</main>
	<script>
	window.addEventListener("load", () => {
		  document.querySelectorAll(".underLine").forEach(el => {
		    el.classList.add("animate");
		  });

		  setTimeout(() => {
		    document.querySelector("main").classList.add("showContent");
		  }, 1400);
		});
</script>
</body>
</html>
