<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/signup.css" rel="stylesheet">
<link href="css/progress.css" rel="stylesheet">
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
}

input[type="text"],
input[type="password"],
select {
      width: 100%;
      padding: 10px;
      border: 1px solid #ced4da;
      border-radius: 6px;
      box-sizing: border-box;
      font-size: 14px;
}

input[type="submit"] {
      width: 60%;
      padding: 10px;
      background-color: #84d330;
      color: white;
      border: none;
      border-radius: 6px;
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
     border-radius: 6px;
     cursor: pointer;
     white-space: nowrap;
}

.idRow input[type="button"]:hover {
  background-color: #1fb205;
}
/* 비밀번호 토글 
#togglePassword1, #togglePassword2 {
	width: 20px;
	height: 20px;
	right: 10px;
	position: absolute;
}
*/
.juminRow {
  display: flex;
  align-items: center;
  gap: 8px;
}

.juminRow input[type="text"] {
  padding: 10px;
  border: 1px solid #ced4da;
  border-radius: 6px;
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

.emailRow input[type="text"] {
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

#emailVerify {
	display: none;
	overflow: hidden;
}

.signup {
   display: flex;
   justify-content: center;
   margin-top: 20px;
}

</style>
</head>
<body>
<div class="progress-container">
  <div class="step active">
    <div class="circle">1</div>
    <div class="label">약관 동의</div>
  </div>
  <div class="step active">
    <div class="circle">2</div>
    <div class="label">정보 입력</div>
  </div>
  <div class="step">
    <div class="circle">3</div>
    <div class="label">가입 완료</div>
  </div>
</div>
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
          <input type="text" id="emailDomain" name="emailDomain" required>
      	  
      	  <select id="emailDomainSelect" name="emailDomainSelect">
      	    <option value="direct" selected>직접 입력</option>
      	    <option value="naver.com">naver.com</option>
      	    <option value="daum.net">daum.net</option>
      	    <option value="gmail.com">gmail.com</option>
      	  </select>
      	  <div class="emailAuthBtn">
      	    <input type="button" value="인증 요청" id="emailAuthBtn">
      	  </div>
      	  <div id="emailVerify">
      	  	<label for="emailCode">인증번호</label>
      	  	<div class="verifyCode">
      	  	  <input type="text" id="emailCode" name="emailCode" placeholder="인증번호">
      	  	  <input type="button" value="확인" onclick="verifyEmailCode()">
      	  	</div>
      	  </div>
      	</div>
      	
        <div class="g-recaptcha" data-sitekey="6LdJB-orAAAAAJkFTCtPCgXVGhgSTPN-NQGWtgAj"></div>
        
        <div class="signup">
      	  <input type="submit" value="가입하기">
        </div>
      </form>
   </section>
</div>

<script>
/*
 div 안에 비밀번호
 <img id="togglePassword1" src="https://i.postimg.cc/TYkDN86M/hide.png" alt="Toggle Password" style="cursor: pointer;"> 
 
//비밀번호 토글 아이콘
const togglePassword1 = document.getElementById('togglePassword1');
const password1 = document.getElementById('pass1');

togglePassword1.addEventListener('click', () => {
    if (password1.type === 'password') {
        password1.type = 'text';   // 비밀번호 보이기
        togglePassword1.src = 'https://i.postimg.cc/8z2sxNX4/view.png'; 
    } else {
        password1.type = 'password';  // 비밀번호 숨기기
        togglePassword1.src = 'https://i.postimg.cc/TYkDN86M/hide.png'; 
    }
});

//비밀번호 재확인 토글 아이콘
const togglePassword2 = document.getElementById('togglePassword2');
const password2 = document.getElementById('pass2');

togglePassword2.addEventListener('click', () => {
    if (password2.type === 'password') {
        password2.type = 'text';
        togglePassword2.src = 'https://i.postimg.cc/8z2sxNX4/view.png'; 
    } else {
        password2.type = 'password';
        togglePassword1.src = 'https://i.postimg.cc/TYkDN86M/hide.png'; 
    }
});
*/
</script>

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

<!-- 이메일 인증요청버튼 클릭 시 이메일 전송 및 인증번호 확인을 위한 필드 표시 -->
$('#emailAuthBtn').on('click', function(){
	const email = $('#emailId').val() + $('#emailDomain').val();
	if(email === ''){
		alert('이메일을 입력해주세요.');
		return;
	}
	
	// 이메일 전송 요청(서버에 이메일 전송을 요청)
	$.ajax({
		url: '/verifyEmailCode',     // 인증번호 검증을 위한 서버 URL (백엔드 API)
		type: 'POST',
		data: { code: code },
		success: function(response) {
			if(response.success){
				alert('인증이 완료되었습니다.');
			}else {
				alert('잘못된 인증번호입니다. 다시 시도해주세요.');
			}
		},
		error: function() {
		        alert('서버에 문제가 발생했습니다. 나중에 다시 시도해주세요.');
		}        
	});
})

<!-- 이메일 인증요청버튼 클릭 시 슬라이드 표시-->
$('#emailAuthBtn').on('click', function(){
	if(!$('#emailVerify').is(':visible')){
	   $('#emailVerify').slideDown();
	}
});

function verifyEmailCode(){
	const code = $('#emailCode').val();
	
	if(!code){
		alert('인증번호');
		return;
	}
}
</script>

<!-- reCAPTCHA 로봇인지 확인 -->
<script src="https://www.google.com/recaptcha/api.js" async defer></script>

</body>
</html>