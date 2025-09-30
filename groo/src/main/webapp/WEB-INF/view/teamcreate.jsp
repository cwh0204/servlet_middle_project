<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link href="css/teamcreate.css" rel = "stylesheet">
<link href="css/base.css" rel="stylesheet">




<meta charset="UTF-8">
<title>team create</title>
</head>
<body>
	<div class = "title">Create own your team</div>
	
	<form action="teamcreate" method="post">
		<div><input type="text" name="teamName" class="form-control" placeholder="스터디명을 입력해주세요."></div> 
		<input type="text" name="userId" class="form-control" placeholder="스터디장을 입력하세요.">
		
		<input type="text" name="teamInfo" class="form-control" placeholder="개설하실 스터디에 대해 설명해주세요.">
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>
	
</body>
</html>