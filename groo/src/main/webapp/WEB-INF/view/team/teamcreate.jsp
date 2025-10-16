<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>team create</title>
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

		<form action="teamcreate" method="post">

			<div class="category_container">
				<div class="studyTitle_box">
					<label>스터디명:</label> <input type="text" name="teamName"
						class="form-control" placeholder="스터디명을 입력해주세요.">
				</div>

				<div class="studyLeader_box">
					<label>스터디장:</label> <input type="text" name="userId"
						class="form-control" placeholder="스터디장을 입력하세요.">
				</div>
				<div class="teamCategory_box">
					<label>개설하실 스터디의 분야를 선택해 주세요</label>

					<div class="radio_group">
						<div class="radio_row">
							<label><input type="radio" name="teamCategory" value="개발">개발</label> 
							<label><input type="radio" name="teamCategory"value="디자인">디자인</label>
							<label><input type="radio" name="teamCategory" value="마케팅">마케팅</label>
							<label><input type="radio" name="teamCategory" value="어학"> 외국어</label>
						</div>

						<div class="radio_row">
							<label><input type="radio" name="teamCategory" value="금융">금융</label>
							<label><input type="radio" name="teamCategory" value="사진"> 사진</label> 
							<label><input type="radio" name="teamCategory" value="악기"> 악기</label> 
							<label><input type="radio" name="teamCategory" value="미술"> 미술</label>
						</div>
					</div>
				</div>
				<div class="studycontent_box">
					여러분의 스터디를 소개해 주세요<input type="text" name="teamInfo"
						class="form-control" placeholder="개설하실 스터디에 대해 설명해주세요.">
				</div>
				<div class="membercount_box">
					구성원의 숫자를 선택해 주세요<input type="text" name="teamMember"
						class="form-control" placeholder="모집인원(필터박스로 설정)">
				</div>
				<button type="submit" class="btn btn-primary submit-btn">Submit</button>
			</div>
			<div class="underLine2"></div>
			<div class="create_Line2"></div>
		</form>
	</main>
	<!----------------------------------------------스크립트영역입니다---------------------------------------------->
	<script>
	window.addEventListener("load", () => {
		  document.querySelectorAll(".underLine, .underLine2").forEach(el => {
		    el.classList.add("animate");
		  });
		  
		  setTimeout(() => {
		    document.querySelector("main").classList.add("showContent");
		  }, 1400);
		});
	<!---------------------------------------------- 스크립트영역입니다---------------------------------------------->
</script>
</body>
</html>
