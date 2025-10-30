<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 상세페이지</title>
<script src="jquery/jquery-3.7.1.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="js/userDetail.js"></script>
<link rel="stylesheet" href="css/base.css">
<link rel="stylesheet" href="css/userdetail.css">
</head>
<body>
	<div class="real">
		<div class="container">
			<div class="left-section">
				<div class="left_user_box">
					<div class="profile-image" id="profileImage"></div>
					<div class="profile-info">
						<input type="file" id="fileInput" accept="image/*">
						<button type="button" class="upload-btn"
							onclick="document.getElementById('fileInput').click()">이미지
							업로드</button>
						<div class="file-name" id="fileName">이미지를 선택해주세요</div>
					</div>
					<div class="user_attribute">
						<div class="input-group">
							<label>아이디</label> <input type="text" name="userID"
								value="" disabled=>
						</div>
						<div class="input-group">
							<label>이름</label> <input type="text" name="irum" value=""
								disabled>
						</div>
						
						<div class="input-group">
							<label>닉네임</label> <input type="text" name="name" value="">
						</div>
						
						<div class="input-group">
							<label>전화번호<span style="font-size: 12px; color: #666;">(선택)</span>
							</label>
							<div style="display: flex; gap: 10px; align-items: center;">
								<select name="phonenumber"
									style="width: 65px; text-align: center;">
									<option value="010">010</option>
									<option value="042">042</option>
									<option value="02">02</option>
								</select> <span>-</span> <input type="text" name="phonemiddle"
									maxlength="4" style="width: 65px; text-align: center;">
								<span>-</span> <input type="text" name="phoneback" maxlength="4"
									style="width: 65px; text-align: center;">
							</div>
						</div>
					</div>
				</div>
				<div class="button-group">
					<button type="submit" class="okbutton">회원정보수정</button>
					<button type="reset" class="cancelbutton"
						onclick="showCancelAlert(); resetFields();">취소</button>
					<button type="button" id="deletebutton">회원탈퇴</button>
				</div>
			</div>


			<div class="right-section">
				<h1>회원정보 상세페이지</h1>

				<div class="input-group" style="position: relative;">
					<label>비밀번호</label> <input type="password" name="password"
						id="password" placeholder="8~20자리, 특수문자 1개 이상, 공백 제외"
						style="width: 100%; padding-right: 30px;"> <img
						id="togglePassword" src="https://i.postimg.cc/TYkDN86M/hide.png"
						style="position: absolute; right: 10px; top: 34px; cursor: pointer; width: 20px; height: 20px;">
				</div>

				<div class="input-group" style="position: relative;">
					<label>비밀번호 재확인</label> <input type="password" name="passtry"
						id="passtry" style="width: 100%; padding-right: 30px;"> <img
						id="togglePasstry" src="https://i.postimg.cc/TYkDN86M/hide.png"
						style="position: absolute; right: 10px; top: 34px; cursor: pointer; width: 20px; height: 20px;">
					<!-- 문구 표시 -->
					<span id="checkpw"
						style="font-size: 12px; display: block; margin-top: 5px;"></span>
				</div>

				<div class="input-group">
					<label>주민등록번호</label>
					<div style="display: flex; align-items: center; gap: 5px;">
						<input type="text" name="jumin_front" maxlength="6"
							placeholder="123456" disabled
							style="width: 120px; text-align: center;"> <span>-</span>
						<input type="password" name="jumin_back" maxlength="1"
							placeholder="●" disabled style="width: 50px; text-align: center;">
						<span>******</span>
					</div>
				</div>

				<div class="input-group">
					<label>이메일</label>
					<div style="display: flex; align-items: center; gap: 5px;">
						<input type="text" name="emailid"
							style="width: 120px; text-align: center;"> <span>@</span>
						<input type="text" name="emailadd"
							style="width: 150px; text-align: center;">
					</div>
					<select name="email_select"
						style="margin-top: 5px; width: 100%; padding: 12px 14px; border-radius: 8px; border: 1px solid #ccc;">
						<option value="">- 이메일 선택 -</option>
						<option value="direct">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="daum.net">daum.net</option>
					</select>
				</div>

				<div class="input-group">
					<label>주소</label>
					<div style="display: flex; gap: 5px; align-items: center;">
						<input type="text" id="zipcode" name="zipcode" placeholder="우편번호"
							style="width: 120px; text-align: center;" readonly> <input
							type="button" value="우편번호" class="address_btn"
							onclick="openPostcode()">


					</div>
					<input type="text" id="address1" name="address1" placeholder="주소"
						style="margin-top: 5px;" readonly> <input type="text"
						id="address2" name="address2" placeholder="상세주소"
						style="margin-top: 5px;">
				</div>

				<div class="input-group">
					<label>관심분야</label>
					<div class="checkbox-group">
						<label><input type="checkbox" name="ff" value="IT/개발">
							IT/개발</label> <label><input type="checkbox" name="ff"
							value="자격증/취업"> 자격증/취업</label> <label><input
							type="checkbox" name="ff" value="건강/의학"> 건강/의학</label> <label><input
							type="checkbox" name="ff" value="취미"> 취미</label> <label><input
							type="checkbox" name="ff" value="기타"> 기타</label>
					</div>
					<textarea name="ff" placeholder="관심분야를 입력하세요"></textarea>
				</div>
			</div>
		</div>
		<%@ include file="./userdetailpw.jsp"%>
	</div>
</body>
</html>
