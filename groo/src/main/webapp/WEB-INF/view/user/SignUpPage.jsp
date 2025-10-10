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

header {
   height: 70px;
   margin: 8px;
   padding: 12px;
    background-color: yellow;
    text-align: center;
}

section {
   width: 500px;
   height: 600px;
   border-radius: 20px;
   background-color: lightblue;
   border: 5px solid lightgreen;
}

.section {
   display: flex;
    justify-content: center;
}

</style>
</head>
<body>
<div>
   <header><h1>회원가입</h1></header>
</div>
<div class="section">
   <section>
      <form action="/signup.do" method="post" onsubmit="return validateForm()">
      	아이디 <input type="text" id="userId" name="userId" required> 
      		  <input type="button" value="중복확인" onclick="checkDuplicateId()"><br><br>
      	비밀번호 <input type="password" id="pass1" name="password" required><br>
      	비밀번호 재확인 <input type="password" id="pass2" name="confirmPassword" required><br>
        이 름 <input type="text" name="name" required><br>
        이메일 <input type="text" id="email1" name="email1" required> @ 
        	  <input type="text" id="email2" name="email2" required><br><br>
      	<input type="submit" value="가입하기">
      </form>
   </section>
</div>
</body>
<script type="text/javascript">
   
</script>
</html>