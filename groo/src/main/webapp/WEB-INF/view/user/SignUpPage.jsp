<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/signup.css" rel="stylesheet">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title></title>
<style>

html, body{
   width: 100%;
   height: 100%;
   margin: 0;
   padding: 0;
}

body {
  background-color: #f8f9fa;
  font-family: 'Segoe UI', sans-serif;
  margin: 0;
  padding: 0;
}

.section {
   display: flex;
   justify-content: center;
   align-items: center;
}

section {
   width: 100%;
   max-width: 600px;
   background-color: white;
   padding:40px;
   margin: 30px 0;
   border-radius: 12px;
   box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
   border: none;
}

section h2 {
      text-align: center;
      margin-bottom: 30px;
      font-size: 30px;
    }
    
form div {
   margin-bottom: 16px;
}

form label {
   font-weight: bold;
  // display: block;
 //  margin-bottom: 6px;
}

input[type="text"],
input[type="password"],
select {
      width: 100%;
      padding: 10px;
      border: 1px solid #ced4da;
      border-radius: 5px;
      box-sizing: border-box;
      font-size: 14px;
}

input[type="submit"] {
      width: 60%;
      padding: 10px;
      background-color: #84d330;
      color: white;
      border: none;
      border-radius: 4px;
      font-size: 20px;
      cursor: pointer;
}

input[type="submit"]:hover {
      background-color: #1fb205;
}

.idRow {
     display: flex;
     gap: 8px;
     align-items: center;
}

.idRow input[type="text"] {
     flex: 1;
}

.idRow input[type="button"] {
	 flex: none;
     padding: 10px;
     width: 80px;
     background-color: #84d330;
     color: white;
     border: none;
     border-radius: 4px;
     cursor: pointer;
     white-space: nowrap;
}

.idRow input[type="button"]:hover {
  background-color: #1fb205;
}

.juminRow {
  display: flex;
  align-items: center;
  gap: 8px;
}

.juminRow input[type="text"] {
  padding: 10px;
  border: 1px solid #ced4da;
  border-radius: 5px;
  font-size: 14px;
}

.juminRow span {
  font-size: 18px;
}

.oneChar {
   width: 30px;
   flex: 0 0 50px;
   box-sizing: border-box;
   text-align: center;
}

#jumin1 {
	width: 250px;
}
.emailRow {
     display: grid;
     grid-template-columns: 2fr auto 2fr auto;
     align-items: center;
     gap: 8px;
}

.email-row input[type="text"] {
      flex: 1;
}

.sr-only {
   position: absolute;
   width: 1px;
   height: 1px;
   padding: 0;
   margin: -1px;
   overflow: hidden;
   clip: rect(0,0,0,0);
   white-space: nowrap;
   border: 0;
}

.signup {
   display: flex;
   justify-content: center;
   margin-top: 20px;
}

#postcode {
  width: 160px;         
  height: 42px;
  padding: 10px;         
  font-size: 14px;
}

.addressGroup input[type="text"] {
  margin-bottom: 2px;
  width: 100%;
  padding: 10px;
  border: 1px solid #ced4da;
  border-radius: 5px;
  box-sizing: border-box;
  font-size: 14px;
}

.addressRow {
  display: flex;
  gap: 8px;
  margin-bottom: 8px;
}

.addressGroup input[type="button"] {
  background-color: #84d330;
  color: white;
  border: none;
  border-radius: 4px;
  width: 120px;
  height: 42px;
  padding: 10px;
  box-sizing: border-box;
  cursor: pointer;
  white-space: nowrap;
  line-height: 1;
}

.addressGroup input[type="button"]:hover {
  background-color: #1fb205;
}

</style>
</head>
<body>
<div class="section">
   <section>
   	 <h2>회원가입</h2>
      <form action="/signup.do" method="post" onsubmit="return validateForm()">
      	<label for="userId">아이디</label>
      	<div class="idRow">
      	  <input type="text" id="userId" name="userId" required> 
      	  <input type="button" value="중복확인" onclick="checkDuplicateId()">
      	</div>
      	<div>
      	  <label for="pass1">비밀번호</label><br>
      	  <input type="password" id="pass1" name="password" required>
      	</div>
      	<div>
      	  <label for="pass2">비밀번호 재확인</label><br>
      	  <input type="password" id="pass2" name="confirmPassword" required>
        </div>
        <div>
          <label for="name">이 름</label><br>
          <input type="text" id="name" name="name" required>
        </div>
        <div>
          <label for="nickname">닉네임</label><br>
          <input type="text" id="nickname" name="nickname" required>
        </div>
        <label for="jumin1">주민등록번호</label>
        <div class="juminRow">
          <input type="text" id="jumin1" name="jumin1" maxlength="6" placeholder="앞 6자리" required>
          <span>-</span>
          <input type="text" id="jumin2" name="jumin2" maxlength="1" class="oneChar" required>
          <span>******</span>
        </div>
        <label for="emailId">이메일</label><br>
        <div class="emailRow">
          <input type="text" id="emailId" name="emailId" required> 
          <span>@</span>
          <label for="emailDomain" class="sr-only">도메인</label>
          <input type="text" id="emailDomain" name="emailDomain" readonly required>
      	  
      	  <select id="emailDomainSelect" name="emailDomainSelect">
      	    <option value="" disabled selected>선택</option>
      	    <option value="direct">직접 입력</option>
      	    <option value="naver.com">naver.com</option>
      	    <option value="daum.net">daum.net</option>
      	    <option value="gmail.com">gmail.com</option>
      	  </select>
      	  
      	  <input type="button" value="이메일 인증 요청" onclick="openEmailAuthPopup()">
      	  
      	</div>
      	<div class="addressGroup">
          <label for="postcode">주소</label><br>
          
        <div class="addressRow">
          <input type="text" id="postcode" name="postcode" placeholder="우편번호" readonly required>
          <input type="button" onclick="execDaumPostcode()" value="우편번호 검색">
        </div>
          
        <input type="text" id="address" name="address" placeholder="기본 주소" readonly required>
        <input type="text" id="addressDetail" name="addressDetail" placeholder="상세 주소" required>
        </div>
        
        <div class="g-recaptcha" data-sitekey="6LdJB-orAAAAAJkFTCtPCgXVGhgSTPN-NQGWtgAj"></div>
        
        <div class="signup">
      	  <input type="submit" value="가입하기">
        </div>
      </form>
   </section>
</div>

<!-- 이메일 도메인 선택 -->
<script type="text/javascript">
const emailDomain = document.getElementById('emailDomain');
const emailDomainSelect = document.getElementById('emailDomainSelect');

emailDomainSelect.addEventListener('change', function () {
  const selected = this.value;

  if (selected === 'direct') {
    emailDomain.value = '';
    emailDomain.readOnly = false;
    emailDomain.focus();
  } else {
    emailDomain.value = selected;
    emailDomain.readOnly = true;
  }
});
</script>

<!-- 카카오 주소 API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
  function execDaumPostcode() {
    new daum.Postcode({
      oncomplete: function(data) {
        var addr = data.roadAddress ? data.roadAddress : data.jibunAddress;
        
        document.getElementById('postcode').value = data.zonecode;
        document.getElementById("address").value = addr;
        document.getElementById("addressDetail").focus();
      }
    }).open();
  }
</script>

<!-- reCAPTCHA 로봇인지 확인 -->
<script src="https://www.google.com/recaptcha/api.js" async defer></script>

</body>
</html>