
// 아이디 중복확인 완료 상태 (false: 미확인, true: 확인 완료)
let isIdChecked = false; 
// 아이디 형식 유효성 통과 상태 (정규식 통과)
let isIdValid = false;
// 이메일 인증 상태 (false: 미인증, true: 인증 완료)
let isEmailVerified = false;

/**
 * 아이디 중복 확인 요청
 * @param {string} userLoginId - 확인할 사용자 로그인 아이디
 */
var userIdCheck = (userLoginId) => {

	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'singnupselectloginid.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: { userLoginId: userLoginId },
		// 데이터 전송 성공 시 실행
		success: function(response) {
			if(response == "yes"){
				alert('사용할 수 있는 아이디입니다.✅');
		  isIdChecked = true;	// 중복확인 완료로 사용가능 상태
			}else{
				alert('이미 사용중인 아이디입니다.❌');
		  isIdChecked = false;	 // 사용 불가
			}
		},
		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
				console.error("아이디 중복 확인 통신 실패:", status, error);
				alert('아이디 확인 중 오류가 발생했습니다.');
		}
	}); // $.ajax 끝
}

/**
 * 이메일 인증번호 발송 요청
 * @param {string} email - 인증 메일을 받을 이메일 주소
 */
var sendVerificationEmail = (email) => {
	$.ajax({
		// 인증번호 발송 서버 URL
		url: '/sendemailauth.do',
		type: 'POST',
		data: { email : email },
		success: function(response){
			alert('인증메일이 발송되었습니다. 이메일 확인해주세요.📧');

			//인증번호 입력란 표시
			$("#emailVerify").slideDown();
		},

		error: function(xhr, status, error){
				console.error("인증메일 발송 요청 실패:", status, error);
				alert('이메일 인증 요청 중 문제가 발생했습니다. 다시 시도해주세요.');
		}
	}) // $.ajax 끝
} 

/**
 * 인증번호 확인 요청
 */
var verifyEmailCode = () => {
	const code = $("#emailCode").val();
	
	if(code === ''){
		alert('인증번호를 입력해주세요.');
		return;
	}
	
	$.ajax({
		// 인증번호 검증 서버 URL 
		url: '/verifyemailcode.do',     
		type: 'POST',
		data: { code: code },
		success: function(response) {
			if(response === 'success'){
				alert('이메일 인증이 완료되었습니다.✅');
				isEmailVerified = true; // 인증 완료 상태 변경
			}else {
				alert('잘못된 인증번호입니다. 다시 시도해주세요.❌');
				isEmailVerified = false;
			}
		},
		
		error: function(xhr, status, error) {
				console.error("인증번호 확인 통신 실패:", status, error);
				alert('인증번호 확인 중 서버 통신 오류가 발생했습니다. 다시 시도해주세요.');
		}        
	});  // $.ajax 끝
}


/*
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
*/

/**
 * 최종 회원가입 데이터 전송 요청
 * (인증 완료 및 유효성 검사가 끝난 후 호출됨)
 */
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
			window.location.href = "signupsuccess.do";
		},

		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
				console.error("회원가입 데이터 전송 실패:", status, error);
				alert('회원가입 중 데이터 전송에 실패했습니다. 다시 시도해 주세요.');
		}
	});
}

/**
 * 최종 회원가입 전 유효성 검사 및 데이터 준비
 */
var signUpUserValidation = () => {
	const userIdValue = $('#userId').val();
	const userPwValue = $('#pass2').val();
	const userNameValue = $('#name').val();
	const userjumin1Value = $('#jumin1').val(); //Date 형식이므로 유효성검사 필요함.
	const emailId = $("#emailId").val();
	const emailDomain = $("#emailDomain").val();
	const userEmail = emailId + "@" + emailDomain;	
	const userGender = 	($('#jumin2').val() == '1') ? "M" : "W";
	if (userIdValue != "" && userPwValue != "" && userNameValue != "") {
		//유효성 검사가 끝나면 회원가입 요청을 보냄
		signUpUser(userIdValue,userPwValue,userNameValue,userEmail,userjumin1Value,userGender); 
	}else{
		alert('입력 항목을 모두 채워주세요.');
	}
}


$(document).ready(() => {
	
	/* 아이디 */
	
	// 아이디 입력 필드
	const $userId = $('#userId');
	const idRegExp = /^[a-z0-9_-]{4,20}$/;

	// 아이디 실시간 유효성 검사
	$userId.on('input', function() {
		const currentId = $(this).val();
		const $idMessage = $('#idMessage');
		
		// 아무것도 입력 안했을 때는 초기화
		if (currentId.length === 0) {
			$(this).css('border', '1px solid #ccc');
			$idMessage.text('');
			return;
		}

		// 정규식 검사
		if (!idRegExp.test(currentId)) {
			$(this).css('border', '2px solid red');
			$idMessage
				.text('아이디는 4~20자의 영문 소문자, 숫자, _, - 만 가능합니다.')
				.css('color', 'red');
			isIdValid = false;	 // 형식 불일치
		} else {
			$(this).css('border', '2px solid green');
			$idMessage
				.text('사용 가능한 형식입니다. ✔')
				.css('color', 'green');
			isIdValid = true; 	 // 형식 일치	
		}
		
		// 아이디가 변경되면 중복확인 상태 초기화
		isIdChecked = false;
	});
	
	/* 비밀번호 */
	
	const $pass1 = $('#pass1');
	const $pass2 = $('#pass2');
	const pwRegExp = /^(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>/?~`])(?=\S+$).{8,20}$/;

	// 비밀번호 (pass1) 입력 시 검사
	$pass1.on('input', function() {
			const password = $(this).val();
	        const $pass1Message = $('#pass1Message');

			if (password.length === 0) {
				$(this).css('border', '1px solid #ccc');
				$pass1Message.text(''); 
			}
			
	        // 형식 검사
	        else if (!pwRegExp.test(password)) {
				$(this).css('border', '2px solid red');
				$pass1Message
					.text('비밀번호는 8~20자이며, 특수문자+영문 소문자+숫자를 1개 이상 포함해야합니다. (공백 사용 불가)')
					.css('color', 'red');
			} else {
				$(this).css('border', '2px solid green');
				$pass1Message
					.text('사용 가능한 비밀번호 형식입니다. ✔')
					.css('color', 'green');
			}

		// 비밀번호가 바뀔 때마다 재확인 필드도 검사 하는 함수 호출
		checkPasswordMatch();
		});	
		
		// 비밀번호 재확인 (pass2) 입력 시 검사 
		$pass2.on('input', checkPasswordMatch);

	    // 비밀번호 일치 여부를 검사하고 피드백을 주는 함수
    function checkPasswordMatch() {
	        const pass1Value = $pass1.val();
		    const pass2Value = $pass2.val(); 
		    const $pass2Message = $('#pass2Message'); 

		    if (pass2Value.length === 0) {
		        $pass2.css('border', '1px solid #ccc');
		        $pass2Message.text('');
		        return;
		    }

		    if (pass1Value === pass2Value) {
		          $pass2.css('border', '2px solid green');
		          $pass2Message
		              .text('비밀번호가 일치합니다. ✔')
		              .css('color', 'green');
		    } else {
		          $pass2.css('border', '2px solid red');
		           $pass2Message
		              .text('비밀번호가 일치하지 않습니다. ❌')
		              .css('color', 'red');
		    }
       }	
				
	/* 이메일 */
	
	// 이메일 도메인 선택
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
				
				// 도메인 변경 시, 혹시 모를 기존 인증 상태 초기화
			    isEmailVerified = false;
			});
		}
		
		// 이메일 인증 요청 버튼 클릭 시 
		$('#emailAuthBtn').on('click', function(){
			const emailId = $('#emailId').val();
			const emailDomain = $('#emailDomain').val();
			const userEmail = emailId + '@' + emailDomain;

			if(emailId === '' || emailDomain === ''){
				alert('이메일 주소를 모두 입력해주세요.');
				return;
			}

			// 이메일 중복확인 AJAX
			$.ajax({
				url: '/singnupselectemail.do',
				type: 'POST',
				data:{ userEmail : userEmail },
				success: function(response){

					if(response != 'null'){
						alert('이미 사용중인 이메일입니다.❌');
						isEmailVerified = false; 	// 인증 상태 초기화
					}else{
						
						// 중복이 아니면 인증메일 요청
						sendVerificationEmail(userEmail);
					}
				},

				error: function(xhr, status, error){
				   console.error("이메일 중복 확인 실패:", status, error);
				   alert('이메일 중복 확인 중 오류가 발생했습니다. 다시 시도해주세요.');
				}
			});
		});
		
		/* 최종 가입 */
		
		//회원가입 버튼 클릭 시
		$('#userSignUp').on('click', function() {
				
			// [1단계] 이메일 인증 완료 여부 확인
			if (!isEmailVerified) {
			    alert("이메일 인증을 먼저 완료해주세요. ⚠️");
			    return; // 인증되지 않았으면 여기서 함수 종료
		    }	
			
			// [2단계] 인증 완료 시, 나머지 유효성 검사 및 가입 진행
					signUpUserValidation();
	});			
});

/**
 * 아이디 중복확인 버튼 클릭 시 실행
 */
function checkDuplicateId() {
	/*	const userIdInput = document.getElementById('userId');
		const userId = userIdInput.val();*/

	const userId = $('#userId').val();
	// 정규 표현식 (4~20자리, 영문소문자, 숫자, _, -)
	const idRegExp = /^[a-z0-9_-]{4,20}$/;

	if (userId === '') {
		alert('아이디를 입력해주세요.');
		$('#userId').focus();
		return;
	} else if (!idRegExp.test(userId)) {
		alert("아이디는 4~20자의 영문 소문자, 숫자, 밑줄(_), 하이픈(-), 공백없이만 사용할 수 있습니다.");
		$('#userId').focus();
		return;
	} else {
		// 형식 유효성 검사 통과 시 중복확인 요청	
		userIdCheck(userId);
	}
}

/**
 * 주민등록번호 (앞6+뒤1) 유효성 검사 함수
 * @returns {boolean} 유효하면 true, 아니면 false
 */
function validateJumin(){
	const jumin1 = $('#jumin1').val();
	const jumin2 = $('#jumin2').val();
	
	// 길이 및 필수 입력 검사
	if(jumin1.length !== 6){
		alert('주민등록번호 앞 6자리를 모두 입력해주세요.');
		$('#jumin1').focus();
		return false;
	}
	if(jumin2 !== 1){
		alert('주민등록번호 뒷 1자리를 입력해주세요.');
		$('#jumin2').focus();
		return false;
	}
	
	// 숫자 형식 검사
	if(!/^\d{6}$/.test(jumin1) || !/^\d{1}$/.test(jumin2)){
		alert('주민등록번호는 숫자로만 입력가능합니다.');
		return false;
	}
	
	// 뒷자리 성별/세기 코드 유효성 검사
	const genderCode = jumin2.charAt(0);
	const validGenderCodes = ['1','2','3','4','5','6','7','8'];
	if(!validGenderCodes.includes(genderCode)){
		alert('주민등록번호 뒷자리가 올바르지 않습니다.');
		return false;
	}
	
	// 생년월일 논리적 유효성 검사 (윤달 등 체크)
}
