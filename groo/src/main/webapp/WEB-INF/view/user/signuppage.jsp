<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="jquery/jquery-3.7.1.min.js"></script>
<script src="js/signUp.js"></script>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<link href="css/signup.css" rel="stylesheet">
<link href="css/progress.css" rel="stylesheet">
<link href="css/base.css" rel="stylesheet">
<meta charset="UTF-8">
<title></title>
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
<!--       <form action="/signup.do" method="post" onsubmit="return validateForm()"> -->
      	<label for="userId">아이디</label>
      	<div class="idRow">
      	  <input type="text" id="userId" name="userId" required> 
      	  <input type="button" value="중복확인" onclick="checkDuplicateId()">
      	  <span id="idMessage" style="font-size: 0.9em;"></span>
      	</div>
      	
      	<div>
      	  <label for="pass1">비밀번호</label><br>
      	  <input type="password" id="pass1" name="password" required>
      	  <span id="pass1Message" style="font-size: 0.9em;"></span>
      	</div>
      		
      	<div>
      	  <label for="pass2">비밀번호 재확인</label><br>
      	  <input type="password" id="pass2" name="confirmPassword" required>
          <span id="pass2Message" style="font-size: 0.9em;"></span>
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
      	  <input type="button" id="userSignUp" value="가입하기">
        </div>
<!--       </form> -->
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
</body>
</html>