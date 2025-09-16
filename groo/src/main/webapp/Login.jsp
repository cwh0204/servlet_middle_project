<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<form action="login" method="post">
		<div>
			<h2>아이디</h2>
			<input type="text" name="userId" required>
		</div>
		<div>
			<h2>비밀번호</h2>
			<input type="text" name="password" required>
		</div>
		<input type="submit" value="로그인"> <a
			href="http://localhost:8091/groo/SignUpPage.jsp">회원가입</a>
	</form>
</body>
</html>