<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>team create</title>

<!-- CSS 파일 연결 -->
<link href="css/teamcreate.css" rel="stylesheet">
<link href="css/base.css" rel="stylesheet">

</head>
<body>

	<div class="title-row">Create own your team(가제)</div>
	
	<form action="teamcreate" method="post">
		<!-- sticky 효과 적용되는 wrapper -->
		<div class="form-wrapper">
			<div class="cartegory1">
				<input type="text" name="teamName" class="form-control" placeholder="스터디명을 입력해주세요.">
			</div>
			<div class="cartegory2">
				<input type="text" name="userId" class="form-control" placeholder="스터디장을 입력하세요.">
			</div>
			<div class="cartegory3">
				<input type="text" name="teaminterest" class="form-control" placeholder="관심사체크.">
			</div>
			<div class="cartegory4">
				<input type="text" name="teamInfo" class="form-control" placeholder="개설하실 스터디에 대해 설명해주세요.">
			</div>
			<div class="cartegory5">
				<input type="text" name="teamMember" class="form-control" placeholder="모집인원(필터박스로 설정)">
			</div>
			<div class="cartegory6">
				<input type="text" name="teamCategory" class="form-control" placeholder="팀 카테고리 (category) → 개발, 디자인, 마케팅, 어학 등">
			</div>

			<!-- 버튼도 sticky -->
			<button type="submit" class="btn btn-primary submit-btn">Submit</button>
		</div>
	</form>
	
	<!-- 이미지 영역 -->
	<div class="marquee-content">
		<img src="./images/group.jpg" alt="">
		<img src="./images/Ai.jpg" alt="">
		<img src="./images/개발자들2.jpg" alt="">
		<img src="./images/arc2.jpg.jpg" alt="">
		<img src="./images/meta.jpg" alt="">
		<img src="./images/arc2.jpg" alt="">
		<img src="./images/Ai.jpg" alt="">
		<img src="./images/arc.jpg" alt="">
		<img src="./images/dig.jpg" alt="">
		<img src="./images/video.jpg" alt="">
	</div>
	
</body>
</html>
