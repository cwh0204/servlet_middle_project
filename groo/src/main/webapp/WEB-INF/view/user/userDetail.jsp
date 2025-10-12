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
        flex-direction: column;
        align-items: center;
        justify-content: flex-start;
        min-height: 100vh;
        background-color: #f8f9fa;
        padding-top: 50px;
        padding-bottom: 50px;
    }

    h1 {
        font-size: 30px;
        font-weight: bold;
        margin-bottom: 40px;
        color: #333;
    }

    form {
        background-color: white;
        padding: 50px;
        border-radius: 12px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.15);
        width: 700px; /* ✅ 폭 확대 */
    }

    .input-group {
        margin-bottom: 20px;
    }

    .input-group label {
        display: block;
        margin-bottom: 6px;
        font-size: 15px;
        color: #444;
        font-weight: 500;
    }

    .input-group input[type="text"],
    .input-group input[type="password"],
    .input-group input[type="date"],
    .input-group input[type="email"],
    .input-group select,
    .input-group textarea {
        width: 100%;
        padding: 12px 14px;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 15px;
    }

    .input-group input[disabled] {
        background-color: #f0f0f0;
        color: #777;
    }

    .input-group input[type="file"] {
        border: none;
        font-size: 14px;
    }

    .radio-group, .checkbox-group {
        display: flex;
        flex-wrap: wrap;
        gap: 15px;
        margin-top: 8px;
        font-size: 14px;
    }

    textarea {
        resize: none;
        height: 100px; /* ✅ 텍스트창 크기 확대 */
    }

    .button-group {
        display: flex;
        justify-content: space-between;
        margin-top: 35px;
    }

    button {
        width: 48%;
        padding: 14px;
        font-size: 17px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-weight: bold;
    }

    .save-btn {
        background-color: #007BFF;
        color: white;
    }

    .cancel-btn {
        background-color: #6c757d;
        color: white;
    }
</style>
</head>
<body>
    <h1>회원정보 상세페이지</h1>

    <form action="updateMember.do" method="post" enctype="multipart/form-data">
        <div class="input-group">
            <label>프로필 변경</label>
            <input type="file" name="profile">
        </div>

        <div class="input-group"> 
        <label>아이디</label> 
        <input type="text" name="ID" value="userID" disabled>
        </div>
        
        <div class="input-group">
            <label>비밀번호</label>
            <input type="password" name="pass">
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
             <label>닉네임</label>
             <input type="text" name="nickname">
        </div>
        
        <div class="input-group">
            <label>주민등록번호</label>
            <div style="display: flex; align-items: center; gap:5px;">
            <input type="text" name="jumin_front" maxlength="6" placeholder="123456" disabled style="width:120px; text-align:center;"> 
            <span>-</span>
            <input type="password" name="rrn_back" maxlength="1" placeholder="●" disabled style="width: 50px; text-align: center;">
        </div>
        </div>
        
        <div class="input-group">
    <label>이메일</label>
    <div style="display: flex; align-items: center; gap: 5px;">
        <input type="text" name="emailid" style="width:120px; text-align:center;">
        <span>@</span>
        <input type="text" name="emailadd" style="width:150px; text-align:center;">
    </div>
    <select name="email_select" style="margin-top:5px; width:100%; padding:12px 14px; border-radius:8px; border:1px solid #ccc;">
        <option value="">- 이메일 선택 -</option>
        <option value="naver.com">naver.com</option>
        <option value="gmail.com">gmail.com</option>
        <option value="daum.net">daum.net</option>
        <option value="direct">직접입력</option>
    </select>
</div>

<script>
const domainInput = document.querySelector('input[name="emailadd"]');
const domainSelect = document.querySelector('select[name="email_select"]');

domainSelect.addEventListener('change', () => {
    if(domainSelect.value === "direct" || domainSelect.value === "") {
        domainInput.value = ""; // 직접입력 선택 시 초기화
        domainInput.removeAttribute("readonly");
    } else {
        domainInput.value = domainSelect.value; // 선택된 도메인 적용
        domainInput.setAttribute("readonly", true);
    }
});
</script>

        <div class="input-group">
            <label>전화번호</label>
            <div style="display:flex; gap:10px; align-items:center;">
                <select name="phonenumber">
                    <option value="010">010</option>
                    <option value="042">042</option>
                    <option value="02">02</option>
                </select>
                <span>-</span>
                <input type="text" name="phonemiddle" maxlength="4">
                <span>-</span>
                <input type="text" name="phoneback" maxlength="4">
            </div>
        </div>

<div class="input-group">
    <label>주소</label>
    <div style="display: flex; gap: 5px; align-items: center;">
        <input type="text" id="zipcode" name="zipcode" placeholder="우편번호" style="width:120px; text-align:center;" readonly>
        <input type="button" value="우편번호검색" style="padding: 12px 14px; border-radius: 8px; cursor:pointer;" onclick="openPostcode()">
    </div>
    <input type="text" id="address1" name="address1" placeholder="주소" style="margin-top: 5px; width:100%; padding:12px 14px; border-radius:8px; border:1px solid #ccc;" readonly>
    <input type="text" id="address2" name="address2" placeholder="상세주소" style="margin-top: 5px; width:100%; padding:12px 14px; border-radius:8px; border:1px solid #ccc;">
</div>

<!-- 카카오 우편번호 API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function openPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            document.getElementById('zipcode').value = data.zonecode; // 우편번호
            document.getElementById('address1').value = data.roadAddress; // 도로명 주소
            document.getElementById('address2').focus(); // 상세주소 입력창
        }
    }).open();
}
</script>

        <div class="input-group">
    <label>관심분야</label>
    <div class="checkbox-group">
        <label><input type="checkbox" name="ff" value="IT/개발"> IT/개발</label>
        <label><input type="checkbox" name="ff" value="자격증/취업"> 자격증/취업</label>
        <label><input type="checkbox" name="ff" value="건강/의학"> 건강/의학</label>
        <label><input type="checkbox" name="ff" value="취미"> 취미</label>
        <label><input type="checkbox" name="ff" value="기타"> 기타</label>
        <textarea name="ff" placeholder="관심분야를 입력하세요" rows="10" cols="90"></textarea>
    </div>
</div>
</form>
</body>
</html>