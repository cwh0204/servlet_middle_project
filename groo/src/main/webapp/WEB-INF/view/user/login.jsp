<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/login.css" rel="stylesheet">
<link href="css/base.css" rel="stylesheet">
<script src="jquery/jquery-3.7.1.min.js"></script>
<meta charset="UTF-8">
<title></title>
</head>
<%
String state = java.util.UUID.randomUUID().toString();
session.setAttribute("naver_state", state);
%>
<body>
	<div class="l_c_container flex_container">
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
					<div class="login flex_container">
						<button type="submit" name="login_type" value="member"
							class="btn btn-success">로그인</button>
						<button type="submit" name="login_type" value="nonmember"
							class="btn nonmem-btn-success">비회원 로그인</button>
					</div>
					<button type="submit" name="login_type" value="signup"
						class="btn custom-btn-success">회원가입</button>
				</div>
			</div>
		</form>
		<button style="width: 100px;" class="naver-login">네이버 로그인</button>
		<button style="width: 100px;" class="github-login">깃허브 로그인</button>
	</div>
</body>
<script type="text/javascript">

const naverUrl = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=TfAk2Y0BAm7L0CK2K9br&redirect_uri=http://localhost:8080/groo/naverlogin.do&state=<%=state%>";
const gitHubUrl = "https://github.com/login/oauth/authorize?client_id=Ov23liAv6BKSjMxB6XaF&redirect_uri=http://localhost:8080/groo/githublogin.do&state=<%=state%>&scope=read:user";
	$(function() {
		$('.naver-login').click(function() {
			window.location.href = naverUrl;
		});
		$('.github-login').click(function() {
			window.location.href = gitHubUrl;
		});
	});
</script>
</html>


