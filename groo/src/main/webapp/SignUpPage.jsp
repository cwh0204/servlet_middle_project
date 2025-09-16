<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h2>회원가입 폼</h2>
	<form action="signup" method="post">
		이름: <input type="text" name="name" required><br> <br>
		아이디: <input type="text" name="userId" required><br> <br>
		비밀번호: <input type="password" name="password" required><br>
		<br> <input type="submit" value="가입하기">
	</form>
</body>
<script type="text/javascript">
</script>
</html>