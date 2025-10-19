<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

.termsBox {
  width: 100%;
  height: 200px;
  overflow-y: scroll;
  padding: 10px;
  resize: none;
  border: 1px solid #ced4da;
  border-radius: 6px;
  font-size: 14px;
  background-color: #f9f9f9;
  box-sizing: border-box;
}
</style>
</head>
<body>
<div class="section">
 <section>
  <h2>Groo 서비스 이용 약관 동의</h2>

  <form action="signuppage.do" method="get">
    <h4>이용약관[필수]</h4>
    <textarea class="termsBox" readonly>
[이용약관 내용 입력]
    </textarea><br>
    <input type="checkbox" name="termsAgree" required> 위 약관에 동의합니다

    <h4>개인정보 수집 및 이용 동의[필수]</h4>
    <textarea class="termsBox" readonly>
[개인정보 수집 및 이용 동의 내용 입력]
    </textarea><br>
    <input type="checkbox" name="privacyAgree" required> 개인정보 수집 및 이용에 동의합니다

    <br><br>
    <input type="submit" value="다음">
    <input type="button" value="취소" onclick="goToLogin()">
  </form>
 </section>
</div>
<script>
function goToLogin() {
    window.location.href = 'login.do';
}
</script>
</body>
</html>