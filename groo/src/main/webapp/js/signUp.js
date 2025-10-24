//비동기 통신

console.log("asASDasd");

/* 이메일 도메인 선택 */
$(document).ready(() => {
	const emailDomain = document.getElementById('emailDomain');
	const emailDomainSelect = document.getElementById('emailDomainSelect');

	// 요소가 존재하는지 안전하게 확인하는 것이 좋습니다.
	if (emailDomain && emailDomainSelect) {
		emailDomainSelect.addEventListener('change', function() {
			const selected = this.value;

			if (selected === 'direct') {
				emailDomain.value = '';
				emailDomain.readOnly = false;
				emailDomain.focus();
			} else {
				emailDomain.value = selected;
				emailDomain.readOnly = true;
			}
		});
	}
});

var userIdCheck = (userLoginId) => {

	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'singnupselectloginid.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: {
			userLoginId: userLoginId
		},
		// 데이터 전송 성공 시 실행
		success: function(response) {
			alert('사용할수 있는 아이디입니다.');
		},

		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
		}
	}); // $.ajax 끝
}

var userEmailCheck = (userEmail) => {

	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'singnupselectemail.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: {
			userEmail: userEmail
		},
		// 데이터 전송 성공 시 실행
		success: function(response) {
			// response는 서버에서 돌려준 데이터입니다.
			// 예: 성공 메시지 표시 또는 페이지 이동
			if (response != null) {
				alert("이미 존재하는 이메일입니다!");
			} else {
				signUpUserValidation(); //존재하는 이메일이 아니면 회원가입 유효성을 검사함
			};
		},

		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {

		}
	}); // $.ajax 끝
}

var signUpUser = (userIdValue,userPwValue,userNameValue,userEmail,userjumin1Value,userGender) => {
	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'singnups.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: {
			userLoginId: userIdValue,
			userPass: userPwValue,
			userName: userNameValue,
			userEmail: userEmail,
			userBirth: userjumin1Value, //유효성 검사 필요
			userGender: userGender
		},
		// 데이터 전송 성공 시 실행
		success: function(response) {
			// response는 서버에서 돌려준 데이터입니다.
			console.log("서버 응답:", response);
			// 예: 성공 메시지 표시 또는 페이지 이동
		},

		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
			console.error("AJAX 통신 실패!");
			console.log("상태:", status);
			console.log("에러:", error);
			alert('데이터 전송에 실패했습니다. 다시 시도해 주세요.');
		}
	});
}

//회원가입 유효성검사
var signUpUserValidation = () => {
	const userIdValue = $('#userId').val();
	const userPwValue = $('#pass2').val();
	const userNameValue = $('#name').val();
	const userjumin1Value = $('#jumin1').val(); //Date 형식이므로 유효성검사 필요함.
	const emailId = $("#emailId").val();
	const emailDomain = $("#emailDomain").val();
	const userEmail = emailId + "@" + emailDomain;
	let userGender = $('#jumin2').val();
	if (userGender == 1) {
		userGender = "M"; // 남자
	} else if (userGender == 2) {
		userGender = "W"; // 여자
	}
	console.log(userGender);
	if (userIdValue != "" && userPwValue != "" && userNameValue != "") {
		signUpUser(userIdValue,userPwValue,userNameValue,userEmail,userjumin1Value,userGender); //유효성검사가 끝나면 회원가입 요청을 보냄
	}
}

/* 아이디 실시간 검사 */
$(document).ready(() => {

	//회원가입 버튼클릭
	$('#userSignUp').on('click', function() {
		const emailId = $("#emailId").val();
		const emailDomain = $("#emailDomain").val();
		const userEmail = emailId + "@" + emailDomain;
		userEmailCheck(userEmail); //이메일 체크를 먼저함
	});

	const $userId = $('userId');
	const idRegExp = /^[a-z0-9_-]{4,20}$/;

	// 입력이 바뀔 때마다 실행
	$userId.on('input', function() {
		const userId = $(this).val();

		// 아무것도 입력 안했을 때는 초기화
		if (userId.length === 0) {
			$(this).css('border', '1px solid #ccc');
			$('#idMessage').text('');
			return;
		}

		// 정규식 검사
		if (!idRegExp.test($userId)) {
			$(this).css('border', '2px solid red');
			$('#idMessage')
				.text('아이디는 4~20자의 영문 소문자, 숫자, _, - 만 가능합니다.')
				.css('color', 'red');
		} else {
			$(this).css('border', '2px solid green');
			$('#idMessage')
				.text('사용 가능한 형식입니다. ✔')
				.css('color', 'green');
		}
	});

});

function checkDuplicateId() {
	/*	const userIdInput = document.getElementById('userId');
		const userId = userIdInput.val();*/

	const userId = $('#userId').val();
	// 정규 표현식 (4~20자리, 영문소문자, 숫자, _, -)
	const idRegExp = /^[a-z0-9_-]{4,20}$/;

	if (userId === 0) {
		alert('아이디를 입력해주세요.');
		userIdInput.focus();
		return;
	} else if (!idRegExp.test(userId)) {
		alert("아이디는 4~20자의 영문 소문자, 숫자, 밑줄(_), 하이픈(-), 공백없이만 사용할 수 있습니다.");
		userIdInput.focus();
		return;
	} else {
		userIdCheck(userId);
	}
}

/* -- 아이디 중복확인 AJAX (버튼 클릭 시)
let checkDuplicateId = () => {
	const userLoginId = $('#userId').val();

	if(userLoginId === ''){
		alert('아이디를 입력해주세요.');
		return;
	}

	$.ajax({
		url: '/selectloginid.do',
		type: 'POST',
		data: { userLoginId : userLoginId },
		success: function(response){
			  console.log('서버 응답:', response);

			  if(response !== 'yes'){
					alert('이미 사용중인 아이디입니다.❌');
			  }else {
					alert('사용 가능한 아이디입니다.✅');
			  }
		 },

		 error: function(xhr, status, error){
			console.error("AJAX 통신 실패!");
			console.log("상태:", status);
			console.log("에러:", error);
			alert('서버와 통신 중 오류가 발생했습니다. 다시 시도해주세요.');
		 }
	});
}*/


/* 이메일 인증요청 버튼 클릭 시 이메일 중복확인 -> 인증메일 요청
$('#emailAuthBtn').on('click', function(){
	const emailId = $('#emailId').val();
	const emailDomain = $('#emailDomain').val();
	const email = emailId + '@' + emailDomain;

	if(emailId === '' || emailDomain === ''){
		alert('이메일을 입력해주세요.');
		return;
	}

	// 이메일 중복확인 AJAX
	$.ajax({
		url: '/selectemail.do',
		type: 'POST'
		data:{ userEmail : userEmail },
		success: function(response){
			console.log('이메일 중복확인 응답:', response);

			if(response !== 'yes'){
				alert('이미 사용중인 이메일입니다.❌');
				return;
			}

			// 중복이 아니면 인증메일 요청
			sendVerificationEmail(email);
		},

		error: function(xhr, status, error){
		   console.error("AJAX 통신 실패!");
		   console.log("상태:", status);
		   console.log("에러:", error);
		   alert('이메일 중복 확인 중 오류가 발생했습니다. 다시 시도해주세요.');
		}
	});
});
 */
//이메일 인증요청 함수
/* let sendVerificationEmail(email) => {
	$.ajax({
		// 인증번호 발송을 위한 서버 URL
		url: '/sendemailauth.do',
		type: 'POST',
		data: { email : email },
		success: function(response){
			alert('인증메일이 발송되었습니다. 이메일 확인해주세요.📧');

			//인증번호 입력란 표시
			$("#emailVerify").slideDown();
		},

		error: function(xhr, status, error){
			console.error("AJAX 통신 실패!");
			console.log("상태:", status);
			console.log("에러:", error);
			alert('이메일 인증 요청 중 문제가 발생했습니다. 다시 시도해주세요.');
		}
	})
} */

//인증번호 확인
/* let verifyEmailCode() => {
	const code = $("#emailCode").val();
	
	if(code === ''){
		alert('인증번호를 입력해주세요.');
		return;
	}
	
	// 이메일 전송 요청(서버에 이메일 전송을 요청)
	$.ajax({
		// 인증번호 검증을 위한 서버 URL 
		url: '/verifyemailcode.do',     
		type: 'POST',
		data: { code: code },
		success: function(response) {
			if(response === 'success'){
				alert('이메일 인증이 완료되었습니다.✅');
			}else {
				alert('잘못된 인증번호입니다. 다시 시도해주세요.❌');
			}
		},
		
		error: function(xhr, status, error) {
			console.error("AJAX 통신 실패!");
			console.log("상태:", status);
			console.log("에러:", error);
			alert('서버 통신 오류가 발생했습니다. 나중에 다시 시도해주세요.');
		}        
	});
}
 */



