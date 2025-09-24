<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/login.css" rel="stylesheet">
<link href="css/base.css" rel="stylesheet">
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div class="l_c_container flex-container">
		<form action="logins.do" method="post">
			<div class="loginContiner">
				<div class="imgBox">
					<img src="./images/login.png">
				</div>
				<div class="loginBox">
					<input type="text" name="userId" class="form-control"
						placeholder="아이디를 입력하세요."> <input type="password"
						name="password" class="form-control" placeholder="비밀번호를 입력하세요.">
				</div>
				<div class="methodBox">
					<button type="submit" class="btn btn-success">로그인</button>
					<button type="button" class="btn custom-btn-success"
						onclick="location.href='//localhost:8080/groo/SignUpPage.jsp'">
						회원가입</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>


