<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="login.css" rel="stylesheet">
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<script src="login.js"></script>
	<form action="login" method="post">
		<div class="loginContiner">
			<div>
				<div class="flexContiner">
					<img src="./images/login.png">
				</div>
				<div id=loginAttribute>
					<input type="text" name="userId" class="form-control"
						placeholder="아이디를 입력하세요.">
				</div>
			</div>
			<div>
				<div id=loginAttribute>
					<input type="password" name="password" class="form-control"
						placeholder="비밀번호를 입력하세요.">
				</div>
			</div>
			<div id=loginMethod>
				<button type="submit" class="btn btn-success">로그인</button>
			</div>
			<div id=loginMethod>
				<button type="button" class="btn custom-btn-success"
					onclick="location.href='//localhost:8090/groo/SignUpPage.jsp'">
					회원가입</button>
			</div>
		</div>
	</form>
</body>
</html>


