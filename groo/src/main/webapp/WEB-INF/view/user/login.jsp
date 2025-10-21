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
		<div class="loginContiner">
			<div class="imgBox">
				<img src="./images/login.png">
			</div>
			<form action="logins.do" method="post">
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
			</form>
			<div class="search-box flex_container">
				<button class="id-search">아이디 찾기</button>
				<button class="ps-search">비밀번호 찾기</button>
			</div>
		</div>
		<div class="socialBox">
			<button class="naver-login flex_container">
				<span class="naverLogo socialIcon">N</span><span>네이버로 시작하기</span>
			</button>
			<button class="github-login flex_container">
				<i class="bi bi-github socialIcon"></i><span>깃허브로 시작하기</span>
			</button>
			<button class="kakao-login flex_container">
				<i class="bi bi-line bi-kakao socialIcon"></i><span>카카오로 시작하기</span>
			</button>
			<button class="gogle-login flex_container">
				<i class="bi bi-google socialIcon"></i><span>구글로 시작하기</span>
			</button>
		</div>
	</div>
</body>
<script type="text/javascript">

const naverUrl = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=TfAk2Y0BAm7L0CK2K9br&redirect_uri=http://localhost:8080/groo/naverlogin.do&state=<%=state%>";
const gitHubUrl = "https://github.com/login/oauth/authorize?client_id=Ov23liAv6BKSjMxB6XaF&redirect_uri=http://localhost:8080/groo/githublogin.do&state=<%=state%>&scope=read:user";
const kakaoUrl = "https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=27b3c6cc330385465c1b7c244ef648c6&redirect_uri=http://localhost:8080/groo/kakaologin.do&state=<%=state%>";

	$(function() {
		$('.naver-login').click(function() {
			window.location.href = naverUrl;
		});
		$('.github-login').click(function() {
			window.location.href = gitHubUrl;
		});
		$('.kakao-login').click(function() {
			window.location.href = kakaoUrl;
		});
	});
</script>
</html>


