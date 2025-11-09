<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/login.css" rel="stylesheet">
<link href="css/base.css" rel="stylesheet">
<script src="jquery/jquery-3.7.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>

<script type="text/javascript">
   (function(){
      emailjs.init("pqG8JhivxRva-vM6U");
   })();
</script>

<meta charset="UTF-8">

<style>

</style>
<title></title>
</head>
<%
String state = java.util.UUID.randomUUID().toString();
session.setAttribute("naver_state", state);
%>
<body>
	<div class="l_c_container flex_container">
		<div class="loginContiner">
			<div>
				<div class="imgBox">
					<img src="./images/login.png">
				</div>
				<div class="loginBox">
					<input type="text" id="userId" class="form-control"
						placeholder="아이디를 입력하세요."> <input type="password"
						id="password" class="form-control" placeholder="비밀번호를 입력하세요.">
				</div>
				<div class="methodBox">
					<div class="login flex_container">
						<button type="button" id="login_type" value="member"
							class="btn btn-success">로그인</button>
						<button type="button" id="loginNull" value="nonmember"
							class="btn nonmem-btn-success">비회원 로그인</button>
					</div>
					<button type="button" id="" value="signup"
						class="btn custom-btn-success">회원가입</button>
				</div>
				<div class="search-box flex_container">
					<button class="id-search" id="btnFindId">아이디 찾기</button>
					<button class="ps-search" id="btnFindPw">비밀번호 찾기</button>
				</div>
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
		</div>
	</div>
	<div class="modal fade" id="findIdModal" tabindex="-1" aria-labelledby="findIdModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="findIdModalLabel">아이디 찾기</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="findIdForm">
                        <div class="mb-3">
                            <label for="findIdName" class="form-label">이름</label>
                            <input type="text" class="form-control" id="findIdName" placeholder="이름을 입력하세요" required>
                        </div>
                        <div class="mb-3">
                            <label for="findIdEmail" class="form-label">이메일</label>
                            <input type="email" class="form-control" id="findIdEmail" placeholder="이메일을 입력하세요" required>
                        </div>
                        <button type="submit" class="btn btn-login">아이디 찾기</button>
                    </form>
                    
                    <!-- 아이디 찾기 결과 -->
                    <div id="findIdResult" style="display: none; margin-top: 20px;">
                        <div class="alert alert-success">
                            <h6>회원님의 아이디는 다음과 같습니다.</h6>
                            <p class="mb-0"><strong id="foundId"></strong></p>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 비밀번호 찾기 모달 -->
    <div class="modal fade" id="findPwModal" tabindex="-1" aria-labelledby="findPwModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="findPwModalLabel">비밀번호 찾기</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="findPwForm">
                        <div class="mb-3">
                            <label for="findPwId" class="form-label">아이디</label>
                            <input type="text" class="form-control" id="findPwId" placeholder="아이디를 입력하세요" required>
                        </div>
                        <div class="mb-3">
                            <label for="findPwEmail" class="form-label">이메일</label>
                            <input type="email" class="form-control" id="findPwEmail" placeholder="이메일을 입력하세요" required>
                        </div>
                        <button type="submit" class="btn btn-login">임시 비밀번호 발송</button>
                    </form>
                    
                    <!-- 비밀번호 찾기 결과 -->
                    <div id="findPwResult" style="display: none; margin-top: 20px;">
                        <div class="alert alert-success">
                            <h6>임시 비밀번호가 발송되었습니다.</h6>
                            <p class="mb-0">등록된 이메일로 임시 비밀번호를 발송했습니다.<br>로그인 후 비밀번호를 변경해주세요.</p>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">


function sendCustomEmail(memEmail, memPass) {
    // 1. 전송할 데이터 (템플릿 매개변수)를 직접 JavaScript 객체로 정의합니다.
    // 키(Key)는 EmailJS 템플릿에 정의된 변수 이름과 일치해야 합니다.
    const templateParams = {
        // 예시 데이터:
        title: 'GROO 임시 비밀번호 발급 안내',
        name: 'GROO',
        message: '임시 비밀번호 : ' + memPass,
        email: memEmail,
        reply_to: 'ddittest402@gmail.com' 
    };
    
    // 2. emailjs.send(서비스 ID, 템플릿 ID, 데이터 객체) 호출
    emailjs.send('service_gotykea', 'template_c4g3arg', templateParams)
        .then(function(response) {
        }, function(error) {
        });
}
//임시 비밀번호 생성
function generateTemporaryPassword(length = 10) {
    // 비밀번호에 포함할 모든 문자 종류를 정의합니다.
    const charset = 
        "abcdefghijklmnopqrstuvwxyz" +  // 소문자
        "ABCDEFGHIJKLMNOPQRSTUVWXYZ" +  // 대문자
        "0123456789" +                  // 숫자
        "!@#$*";                 // 특수문자 (일부 안전한 문자만 포함)

    let password = "";
    
    // 보안 강화를 위해, 최소한 문자 종류별로 하나씩 포함되도록 보장합니다.
    const lowerCase = "abcdefghijklmnopqrstuvwxyz";
    const upperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    const numbers = "0123456789";
    const symbols = "!@#$*";

    // 비밀번호에 문자 종류별로 최소 1개 이상 포함하도록 시작합니다.
    if (length >= 4) {
        password += lowerCase.charAt(Math.floor(Math.random() * lowerCase.length));
        password += upperCase.charAt(Math.floor(Math.random() * upperCase.length));
        password += numbers.charAt(Math.floor(Math.random() * numbers.length));
        password += symbols.charAt(Math.floor(Math.random() * symbols.length));
    }
    
    // 나머지 길이를 채우기 위해 전체 문자셋에서 무작위로 선택합니다.
    for (let i = password.length; i < length; i++) {
        const randomIndex = Math.floor(Math.random() * charset.length);
        password += charset.charAt(randomIndex);
    }
    
    // 최종적으로 생성된 비밀번호를 무작위로 섞어 보안을 강화합니다.
    password = password.split('').sort(() => 0.5 - Math.random()).join('');

    return password;
}

const naverUrl = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=TfAk2Y0BAm7L0CK2K9br&redirect_uri=http://localhost:8080/groo/naverlogin.do&state=<%=state%>";
const gitHubUrl = "https://github.com/login/oauth/authorize?client_id=Ov23liAv6BKSjMxB6XaF&redirect_uri=http://localhost:8080/groo/githublogin.do&state=<%=state%>&scope=read:user";
const kakaoUrl = "https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=27b3c6cc330385465c1b7c244ef648c6&redirect_uri=http://localhost:8080/groo/kakaologin.do&state=<%=state%>";

$(document).ready(function() {
		
		sessionStorage.removeItem('main_last_view');
		$('#loginNull').on('click',function(){
			location.href = 'main.do';
		});
		
		$.ajax({
			// 데이터를 전송할 서버 URL
			url: 'memberlogout.do',
			// 전송 방식 (로그인/회원가입은 보통 POST 사용)
			type: 'POST',
			// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
			data: {
			},
			// 데이터 전송 성공 시 실행
			success: function(response) {
				sessionStorage.removeItem('userId');
			},
			error: function(xhr, status, error) {
			}
		});
		
        $('#btnFindId').on('click', function() {
            var myModal = new bootstrap.Modal(document.getElementById('findIdModal'));
            myModal.show();
        });
        
        // 비밀번호 찾기 버튼 클릭
        $('#btnFindPw').on('click', function() {
            var myModal = new bootstrap.Modal(document.getElementById('findPwModal'));
            myModal.show();
        });
        
        $('#findIdForm').on('submit', function(e) {
            e.preventDefault();
            
            var memName = $('#findIdName').val();
            var memEmail = $('#findIdEmail').val();
            
            $.ajax({
                url: 'memberfindloginid.do',
                method: 'POST',
                data: {
                	memName: memName,
                	memEmail: memEmail
                },
                success: function(response) {
                    $('#foundId').text(response.memLoginId);
                    $('#findIdResult').show();
                },
                error: function() {
                    alert('아이디를 찾을 수 없습니다. 입력 정보를 확인해주세요.');
                }
            });
            
            // 테스트용 코드
            $('#foundId').text('user***');
            $('#findIdResult').show();
        });
        
        // 비밀번호 찾기 폼 제출
        $('#findPwForm').on('submit', function(e) {
            e.preventDefault();
            
            var memLoginId = $('#findPwId').val();
            var memEmail = $('#findPwEmail').val();
            const memPass = generateTemporaryPassword();
            sendCustomEmail(memEmail, memPass);

            $.ajax({
                url: 'memberfindpass.do',
                method: 'POST',
                data: {
                	memLoginId: memLoginId,
                    memEmail: memEmail,
                    memPass : memPass
                },
                success: function(response) {
                    $('#findPwResult').show();
                },
                error: function() {
                    alert('정보를 찾을 수 없습니다. 입력 정보를 확인해주세요.');
                }
            });
            
            // 테스트용 코드
            $('#findPwResult').show();
        });
        
        $('#findIdModal').on('hidden.bs.modal', function() {
            $('#findIdForm')[0].reset();
            $('#findIdResult').hide();
        });
        
        $('#findPwModal').on('hidden.bs.modal', function() {
            $('#findPwForm')[0].reset();
            $('#findPwResult').hide();
        });
        
        $('.custom-btn-success[value="signup"]').click(function() {
            window.location.href = 'signup.do'; 
        });
        
		$('.naver-login').click(function() {
			window.location.href = naverUrl;
		});
		$('.github-login').click(function() {
			window.location.href = gitHubUrl;
		});
		$('.kakao-login').click(function() {
			window.location.href = kakaoUrl;
		});
		$('.kakao-login').click(function() {
			window.location.href = kakaoUrl;
		});
		$('#login_type').click(function() {
			const memLoginId = $('#userId').val();
			const memPass = $('#password').val();
			$.ajax({
				// 데이터를 전송할 서버 URL
				url : 'memberlogin.do',
				// 전송 방식 (로그인/회원가입은 보통 POST 사용)
				type : 'POST',
				// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
				data : {
					memLoginId : memLoginId,
					memPass : memPass
				},
				// 데이터 전송 성공 시 실행
// 				success : function(response) {
// 					if (response != null) {
// 						sessionStorage.setItem('userId', response.memLoginId);
// 						window.location.href = "main.do";
// 					} else {
// 						window.location.href = "login.do";
// 					}
// 				},

 success : function(response) {
                if (response && response.status === 'WITHDRAWN') {
                alert('이미 탈퇴한 회원입니다.'); 
                } 
                else if (response && response.memLoginId) {
                sessionStorage.setItem('userId', response.memLoginId);
                window.location.href = "main.do";
                } 
                else {
                alert('아이디 또는 비밀번호를 확인해주세요.');
                }
             },
				// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
				error : function(xhr, status, error) {
				}
			});
		});
	});
</script>
</html>


