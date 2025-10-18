<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 상세페이지</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Noto Sans KR", sans-serif;
}

body {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	background-color: #f8f9fa;
}

.container {
	display: flex;
	flex-direction: row;
	background-color: #fff;
	border-radius: 12px;
	box-shadow: 0 4px 15px rgba(0,0,0,0.1);
	width: 900px;
	overflow: hidden;
}

.left-panel {
	width: 35%;
	background-color: #E8F9F3;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	padding: 40px;
}

.left-panel h2 {
	font-size: 22px;
	color: #333;
	margin-bottom: 20px;
}

.left-panel img {
	width: 120px;
	height: 120px;
	border-radius: 50%;
	object-fit: cover;
	border: 2px solid #ddd;
	margin-bottom: 15px;
}

.right-panel {
	width: 65%;
	padding: 40px 50px;
}

h1 {
	font-size: 26px;
	margin-bottom: 25px;
	color: #333;
}

.input-group {
	margin-bottom: 20px;
}

.input-group label {
	display: block;
	margin-bottom: 6px;
	font-size: 14px;
	font-weight: 500;
	color: #555;
}

.input-group input,
.input-group select,
.input-group textarea {
	width: 100%;
	padding: 10px 12px;
	border: 1px solid #ccc;
	border-radius: 6px;
	font-size: 14px;
}

.checkbox-group {
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
	margin-top: 8px;
}

.button-group {
	display: flex;
	justify-content: space-between;
	margin-top: 25px;
}

button {
	width: 48%;
	padding: 12px;
	font-size: 16px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	font-weight: bold;
}

.save-btn {
	background-color: #7FDBB6;
	color: white;
}

.cancel-btn {
	background-color: #6c757d;
	color: white;
}
</style>
</head>
<body onload="checkPassword()">

<div class="container">
	<div class="left-panel">
		<h2>프로필</h2>
		<img id="profilePreview" src="https://i.postimg.cc/QtzLc2wK/reader.png" alt="기본 프로필">
		<input type="file" name="profile" id="profile" accept="image/*" onchange="previewProfile(event)">
	</div>

	<div class="right-panel">
		<form action="updateMember.do" method="post" enctype="multipart/form-data" onsubmit="return showAlert()">
			<h1>회원정보 수정</h1>

			<div class="input-group">
				<label>아이디</label>
				<input type="text" name="userID" value="userID" disabled>
			</div>

			<div class="input-group">
				<label>비밀번호</label>
				<input type="password" name="password">
			</div>

			<div class="input-group">
				<label>비밀번호 재확인</label>
				<input type="password" name="passtry">
			</div>

			<div class="input-group">
				<label>이름</label>
				<input type="text" name="irum" value="user222" disabled>
			</div>

			<div class="input-group">
				<label>주민등록번호</label>
				<div style="display:flex; gap:5px; align-items:center;">
					<input type="text" name="jumin_front" maxlength="6" disabled style="width:120px; text-align:center;">
					<span>-</span>
					<input type="password" name="jumin_back" maxlength="1" disabled style="width:50px; text-align:center;">
					<span>******</span>
				</div>
			</div>

			<div class="input-group">
				<label>이메일</label>
				<div style="display:flex; align-items:center; gap:5px;">
					<input type="text" name="emailid" style="width:120px; text-align:center;">
					<span>@</span>
					<input type="text" name="emailadd" style="width:150px; text-align:center;">
				</div>
				<select name="email_select" style="margin-top:5px;">
					<option value="">- 이메일 선택 -</option>
					<option value="direct">직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="daum.net">daum.net</option>
				</select>
			</div>

			<div class="input-group">
				<label>전화번호(선택사항)</label>
				<div style="display:flex; align-items:center; gap:8px;">
					<select name="phonenumber" style="width:80px;">
						<option value="010">010</option>
						<option value="042">042</option>
						<option value="02">02</option>
					</select>
					<span>-</span>
					<input type="text" name="phonemiddle" maxlength="4" style="width:80px;">
					<span>-</span>
					<input type="text" name="phoneback" maxlength="4" style="width:80px;">
				</div>
			</div>

			<div class="input-group">
				<label>주소</label>
				<div style="display:flex; gap:5px; align-items:center;">
					<input type="text" id="zipcode" name="zipcode" placeholder="우편번호" style="width:120px; text-align:center;" readonly>
					<input type="button" value="우편번호검색" onclick="openPostcode()">
				</div>
				<input type="text" id="address1" name="address1" placeholder="주소" readonly style="margin-top:5px;">
				<input type="text" id="address2" name="address2" placeholder="상세주소" style="margin-top:5px;">
			</div>

			<div class="input-group">
				<label>관심분야</label>
				<div class="checkbox-group">
					<label><input type="checkbox" name="ff" value="IT/개발"> IT/개발</label>
					<label><input type="checkbox" name="ff" value="자격증/취업"> 자격증/취업</label>
					<label><input type="checkbox" name="ff" value="건강/의학"> 건강/의학</label>
					<label><input type="checkbox" name="ff" value="취미"> 취미</label>
					<label><input type="checkbox" name="ff" value="기타"> 기타</label>
				</div>
				<textarea name="ff" placeholder="관심분야를 입력하세요" rows="5"></textarea>
			</div>

			<div class="button-group">
				<button type="submit" class="save-btn">회원정보수정</button>
				<button type="reset" class="cancel-btn" onclick="showCancelAlert()">취소</button>
			</div>
		</form>
	</div>
</div>

<!-- 카카오 우편번호api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   
<script>
<!-- 프로필 미리보기 -->
function previewProfile(event) {
  const file = event.target.files[0];
  const preview = document.getElementById('profilePreview');

  if (file) {
    const reader = new FileReader();
    reader.onload = function(e) {
      preview.src = e.target.result;
    }
    reader.readAsDataURL(file);
  } else {
    preview.src = "https://i.postimg.cc/sX337p8B/user-2.png";
  }
}


<!-- 비밀번호 자리수 제한 -->



<!-- 이메일 뒷부분 자동입력 및 직접입력 -->
const domainInput = document.querySelector('input[name="emailadd"]');
const domainSelect = document.querySelector('select[name="email_select"]');
userDetail
domainSelect.addEventListener('change', () => {
    if(domainSelect.value === "direct" || domainSelect.value === "") {
        domainInput.value = ""; 
        domainInput.removeAttribute("readonly");
    } else {
        domainInput.value = domainSelect.value; 
        domainInput.setAttribute("readonly", true);
    }
});


<!-- 카카오 우편번호api -->
function openPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            document.getElementById('zipcode').value = data.zonecode; // 우편번호
            document.getElementById('address1').value = data.roadAddress; // 도로명 주소
            document.getElementById('address2').focus(); // 상세주소 입력창
        }
    }).open();
}


<!-- 팝업창 -->
function checkPassword() {
    const correctPassword = "1234"; 
    let pw = prompt("비밀번호를 입력하세요.");

    if (pw === null) {
        alert("비밀번호 입력이 취소되었습니다.");
        window.location.href = "${pageContext.request.contextPath}/mypage.do"; 
        return;
    }

    if (pw !== correctPassword) {
        alert("비밀번호가 틀렸습니다.");
        window.location.href = "${pageContext.request.contextPath}/mypage.do"; 
        return;
    }
   
}


<!-- 취소버튼 눌렀을때 -->
function showCancelAlert() {
    alert("취소되었습니다."); 
    
}


<!-- 비밀번호, 비밀번호재확인 비교 -->
function showAlert() {
   const passwordVal = document.querySelector('input[name="password"]').value;
    const passtryVal = document.querySelector('input[name="passtry"]').value;

    if (passwordVal !== passtryVal) {
        alert("비밀번호가 다릅니다.");
        document.querySelector('input[name="password"]').focus(); 
        return false; 
    }
   
    alert("회원정보가 수정되었습니다."); 
    window.location.href = "${pageContext.request.contextPath}/mypage.do";
    return false;
} 


</script>
</body>
</html>