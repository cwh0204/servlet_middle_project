<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="teamcreate" method="post">
		<input type="text" name="teamName" class="form-control" placeholder="팀이름을 입력하세요."> 
		<input type="text" name="userId" class="form-control" placeholder="팀장이름을 입력하세요.">
		<input type="text" name="teamInfo" class="form-control" placeholder="팀을 설명해주세요.">
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>
</body>
</html>