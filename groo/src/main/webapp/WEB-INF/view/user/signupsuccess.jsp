<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/signup.css" rel="stylesheet">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<meta charset="UTF-8">
<title></title>

<style>

body {
	background-color: #f8f9fa;
	font-family: 'Segoe UI', sans-serif;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
	overflow: hidden;
}
/*
h2 {
    font-size: 28px;
    margin-bottom: 10px;
}
*/
h2 {
    margin-top: 20px;
    font-size: 24px;
    color: #333;
}

p {
    font-size: 16px;
    color: #555;
    margin-bottom: 30px;
}


.successContainer {
  text-align: center;
  background: white;
  padding: 50px 40px;
  border-radius: 12px;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
  animation: fadeIn 0.8s ease;
}

.checkmark {
  font-size: 80px;
  color: #4CAF50;
  display: inline-block;
  animation: pop 0.6s ease;
}

@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}

@keyframes pop {
  0% { transform: scale(0); opacity: 0; }
  60% { transform: scale(1.2); opacity: 1; }
  100% { transform: scale(1); }
}

.btn-confirm {
    margin-top: 25px;
    padding: 12px 30px;
    font-size: 18px;
    background-color: #84d330;
    color: white;
    border: none;
    border-radius: 6px;
    cursor: pointer;
}

.btn-confirm:hover {
    background-color: #1fb205;
    color: white;
    scale: 1.05;
}


</style> 
</head>
<body>
<div class="progressContainer">
  <div class="step active">
    <div class="circle">1</div>
    <div class="label">약관 동의</div>
  </div>
  <div class="step active">
    <div class="circle">2</div>
    <div class="label">정보 입력</div>
  </div>
  <div class="step active">
    <div class="circle">3</div>
    <div class="label">가입 완료</div>
  </div>
</div>
<div class="successContainer">
    <div class="checkmark">✔</div>
    <h2>가입이 완료되었습니다!</h2>
    <p>Groo에 가입해주셔서 감사합니다.<br>이제 로그인 후 서비스를 이용하실 수 있습니다.</p>
    <button class="btn-confirm" onclick="goToLogin()">확인</button>
</div>

<!-- 로그인하러 가기 누르면 로그인 창으로 이동 -->
<script>
function goToLogin() {
  window.location.href = 'login.do';
} 

</script>
</body>
</html>