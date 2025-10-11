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

header {
   background-color: #0d6efd;
   color: white;
   padding: 40px 20px;
   text-align: center;
   font-size: 32px;
   font-weight: bold;
   box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
   border-radius: 0 0 20px 20px;
}

.section {
   display: flex;
   justify-content: center;
   align-items: center;
   margin-top: 50px;
}

section {
   width: 100%;
   max-width: 600px;
   background-color: white;
   padding:40px;
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
      font-size: 16px;
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

.idRow input {
     flex: 1;
}

.idRow input[type="text"] {
     flex: 1;
}

.idRow input[type="button"] {
     padding: 10px;
     width: 100px;
     background-color: #0d6efd;
     color: white;
     border: none;
     border-radius: 4px;
     cursor: pointer;
     white-space: nowrap;
}

.idRow input[type="button"]:hover {
  background-color: #084ccc;
}
/*
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
  font-size: 16px;
}
*/
.emailRow {
     display: grid;
     grid-template-columns: 2fr auto 2fr auto;
     align-items: center;
     gap: 8px;
}

.email-row input[type="text"] {
      flex: 1;
}

.oneChar {
   width: 30px;
   text-align: center;
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
      	</div>
      	<div>
          <label for="address">주소</label><br>
          <input type="text" id="address" name="address" required>
        </div>
        <div>
          <label for="addressDetail">상세주소</label><br>
          <input type="text" id="addressDetail" name="addressDetail" required>
        </div>
        <div class="signup">
      	  <input type="submit" value="가입하기">
        </div>
      </form>
   </section>
</div>
</body>
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
</html>