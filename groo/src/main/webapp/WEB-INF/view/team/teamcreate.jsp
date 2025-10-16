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
		<h3>스터디 생성</h3>
		<div class="underLine2"></div>
		<div class="create_Line2"></div>

		<form action="teamcreate" method="post">

			<div class="category_container">
				<div class="studyTitle_box">
					<label>스터디명 :</label> 
					<input type="text" name="teamName"
						class="form-control" placeholder="스터디명을 입력해주세요.">
				</div>

				<div class="studyLeader_box">
					<label>스터디장 :</label> 
					<input type="text" name="userId"
						class="form-control" placeholder="스터디장을 입력하세요.">
				</div>
			
				<div class="membercount_box">
					<label for="teamMember">모집인원:</label> 
					<select name="teamMember"
						id="teamMember" class="form-select">
						<option value="" disabled selected>모집인원</option>
						<option value="2명">2명</option>
						<option value="3명">3명</option>
						<option value="4명">4명</option>
						<option value="5명">5명</option>
						<option value="6명">6명</option>
						<option value="7명 이상">7명 이상</option>
					</select>
				</div>

				<div class="memberage_box">
					<div><label for="teamMemberage">나이</label></div>
					<div class="range-container">
						<input type="range" id="teamMemberage" name="teamMemberage"
							min="19" max="50" step="1" value="25"> 
						<span id="ageValue">25세</span>
					</div>
				</div>
				
			
				<table class="region-table">
					<caption>지역</caption>
					<tbody>
						<tr>
							<td>서울</td>
							<td>경기</td>
							<td>인천</td>
							<td>부산</td>
						</tr>
						<tr>
							<td>충북</td>
							<td>충남</td>
							<td>대전</td>
							<td>세종</td>
						</tr>
						<tr>
							<td>광주</td>
							<td>대구</td>
							<td>울산</td>
							<td>경북</td>
						</tr>
						<tr>
							<td>전남</td>
							<td>전북</td>
							<td>제주</td>
							<td>강원</td>
						</tr>
					</tbody>
				</table>
			

				<div class="teamCategory_box">
					<label>개설하실 스터디의 분야를 선택해 주세요</label>

					<div class="radio_group">
						<div class="radio_row">
							<label><input type="radio" name="teamCategory" value="개발">개발</label>
							<label><input type="radio" name="teamCategory"
								value="디자인">디자인</label> 
							<label><input type="radio"
								name="teamCategory" value="마케팅">마케팅</label> 
							<label><input type="radio" name="teamCategory" value="어학"> 외국어</label>
						</div>

						<div class="radio_row">
							<label><input type="radio" name="teamCategory" value="금융">재테크</label>
							<label><input type="radio" name="teamCategory" value="사진">사진</label>
							<label><input type="radio" name="teamCategory" value="음악">음악</label> 
							<label><input type="radio" name="teamCategory" value="미술"> 미술</label>
						</div>
						
						<div class="radio_row">
							<label><input type="radio" name="teamCategory" value="건축">건축</label>
							<label><input type="radio" name="teamCategory" value="영상편집">영상편집</label>
							<label><input type="radio" name="teamCategory" value="악기">패션</label> 
							<label><input type="radio" name="teamCategory" value="미술">공학</label>
						</div>
					</div>
				</div>

				<div class="studycontent_box">
					여러분의 스터디를 소개해 주세요
					<input type="text" name="teamInfo" class="form-control" placeholder="개설하실 스터디에 대해 설명해주세요.">
				</div>

				<button type="submit" class="btn btn-primary submit-btn">Submit</button>
			</div>
			
		</form>
	</main>
	<!----------------------------------------------스크립트영역입니다---------------------------------------------->
	<script>
	window.addEventListener("load", () => {
		  document.querySelectorAll(".underLine, .underLine2").forEach(el => {
		    el.classList.add("animate");
		  });
		  
		  setTimeout(() => {
		    const h3 = document.querySelector("main h3");
		    h3.style.opacity = "1";
		    h3.style.transition = "opacity 1s ease";

		    setTimeout(() => {
		      const categoryContainer = document.querySelector(".category_container");
		      categoryContainer.style.opacity = "1";
		      categoryContainer.style.transition = "opacity 1s ease";
		    }, 340);

		  }, 1500); 
	});
</script>
<!---------------------------------------------- 스크립트영역입니다---------------------------------------------->
</body>
</html>
