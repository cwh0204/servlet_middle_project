
// 아이디 중복확인 완료 상태 (false: 미확인, true: 확인 완료)
let isIdChecked = false;
// 아이디 형식 유효성 통과 상태 (정규식 통과)
let isIdValid = false;
// 이메일 중복확인 상태 (false: 미확인, true: 확인 완료)
let isEmailVerified = false;

/**
 * 아이디 중복확인 AJAX
 * @param {string} memLoginId - 확인할 사용자 로그인 아이디
 */
var userIdCheck = (memLoginId) => {

	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'singnupselectloginid.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: {
			memLoginId: memLoginId
		      },
		// 데이터 전송 성공 시 실행
		success: function(response) {
			if (response && response.memLoginId) {
				alert('사용할 수 없는 아이디입니다.❌');
				isIdChecked = false;	// 사용 불가
			} else {
				alert('사용할 수 있는 아이디입니다.✅');
				isIdChecked = true;	 // 중복확인 완료로 사용가능 상태
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
 * 아이디 중복확인 버튼 클릭 
 */
function checkDuplicateId() {

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
function validateJumin() {
	const jumin1 = $('#jumin1').val();
	const jumin2 = $('#jumin2').val();

	// 길이 및 필수 입력 검사
	if (jumin1.length !== 6) {
		alert('주민등록번호 앞 6자리를 모두 입력해주세요.');
		$('#jumin1').focus();
		return false;
	}
	if (jumin2.length !== 1) {
		alert('주민등록번호 뒷 1자리를 입력해주세요.');
		$('#jumin2').focus();
		return false;
	}

	// 숫자 형식 검사
	if (!/^\d{6}$/.test(jumin1) || !/^\d{1}$/.test(jumin2)) {
		alert('주민등록번호는 숫자로만 입력가능합니다.');
		return false;
	}

	// 뒷자리 성별/세기 코드 유효성 검사
	const genderCode = jumin2.charAt(0);
	const validGenderCodes = ['1', '2', '3', '4', '5', '6', '7', '8'];
	if (!validGenderCodes.includes(genderCode)) {
		alert('주민등록번호 뒷자리가 올바르지 않습니다.');
		return false;
	}

	// 생년월일 논리적 유효성 검사 (윤달 등 체크)
	const yearPrefix =
		(genderCode === '1' || genderCode === '2' || genderCode === '5' || genderCode === '6')
			? 1900 : 2000;
	const fullYear = yearPrefix + parseInt(jumin1.substring(0, 2), 10);
	const month = parseInt(jumin1.substring(2, 4), 10);
	const day = parseInt(jumin1.substring(4, 6), 10);
	const birthDate = new Date(fullYear, month - 1, day);	// 월은 0부터 시작

	// Date 객체의 년, 월, 일이 입력값과 일치하는지 확인 (잘못된 날짜 필터링하는 경우도 발생하기 때문)
	if (birthDate.getFullYear() !== fullYear ||
		birthDate.getMonth() !== month - 1 ||
		birthDate.getDate() !== day) {
		alert('유효하지 않은 생년월일입니다. 주민등록번호를 확인해 주세요.');
		return false;
	}

	// 모든 검사 통과
	return true;
};

/**
 * 회원가입 요청
 * (인증 완료 및 유효성 검사가 끝난 후 호출됨)
 */
var signUpUser = (userIdValue, userPw1Value, userNameValue, userEmail, userjumin1Value, userGender) => {
	
	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'singnups.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: {
			userLoginId: userIdValue,
			userPass: userPw1Value,
			userName: userNameValue,
			userEmail: userEmail,
			userBirth: userjumin1Value, 
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
			console.error("회원가입 실패:", status, error);
			alert('회원가입 중 오류가 발생했습니다.');
		}
	});
}

/**
 * 최종 회원가입 전 유효성 검사 및 데이터 준비
 */
var signUpUserValidation = () => {
	const userIdValue = $('#userId').val();
	const userPw1Value = $('#pass1').val();
	const userPw2Value = $('#pass2').val();
	const userNameValue = $('#name').val();
	const userjumin1Value = $('#jumin1').val(); 
	const jumin2Value = $('#jumin2').val();
	const userGender = (['1', '3', '5', '7'].includes(jumin2Value)) ? "M" : "W";
	const emailId = $("#emailId").val();
	const emailDomain = $("#emailDomain").val();
	const userEmail = emailId + "@" + emailDomain;
	

	// 정규식 (ready 함수 안에 있지만, 여기서도 사용하기 위해 정의하거나 전역 변수로 관리)
	const idRegExp = /^[a-z0-9_-]{4,20}$/;
	const pwRegExp = /^(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>/?~`])(?=\S+$).{8,20}$/;
	const nameRegExp = /^[가-힣a-zA-Z]{2,20}$/;
	const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

	// 아이디 중복확인 검사 (중복확인 버튼을 안 눌렀을 경우 여기서 걸림)
	if (!isIdChecked) {
		alert('아이디 중복확인을 완료해주세요.');
		$('#userId').focus();
		return;
	}

	// 아이디 형식 검사 
	if (!idRegExp.test(userIdValue)) {
		alert('아이디 형식이 올바르지 않습니다.');
		$('#userId').focus();
		return;
	}
	
	// 비밀번호 형식 및 일치 검사 (실시간 검사와 별개로 최종 확인은 필수)
	if (!pwRegExp.test(userPw1Value) || userPw1Value !== userPw2Value) {
		alert('비밀번호 형식이 올바르지 않거나 재확인 비밀번호가 일치하지 않습니다.');
		$('#pass1').focus();
		return;
	}

	// 이름 검사 (최종 필수 입력 및 길이 확인)
	if (!nameRegExp.test(userNameValue.trim())) {
		alert('이름을 2자 이상 20자 이하로 입력해주세요.');
		$('#name').focus();
		return;
	}

	// 주민등록번호 유효성 검사	
	if (!validateJumin()) {
		return;
	}

	// 이메일 입력 확인 
	if (!emailPattern.test(userEmail)) {
		alert('이메일 주소를 모두 입력해주세요.');
		$('#emailId').focus();
		return;
	}

	// reCAPTCHA 응답 확인
	const recaptchaResponse = grecaptcha.getResponse();
	if (recaptchaResponse.length === 0) {
		alert('자동 가입 방지(reCAPTCHA)를 확인해주세요.');
		return;

	}
	
	signUpUser(userIdValue, userPw1Value, userNameValue, userEmail, userjumin1Value, userGender);
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
				.text('사용 가능한 형식입니다. 중복확인 버튼을 눌러주세요.')
				.css('color', 'green');
			isIdValid = true; 	 // 형식 일치	
		}

		// 아이디 입력값 변경 시 중복확인 상태 초기화
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

	/* 이름 */
	const $name = $('#name');
	const $nameMessage = $('#nameMessage');

	// 한글 또는 영문 대소문자만 허용, 2~20자 이하 정규식
	const nameRegExp = /^[가-힣a-zA-Z]{2,20}$/;

	$name.on('input', function() {
		const currentName = $(this).val().trim(); // 앞뒤 공백 제거

		// 아무것도 입력 안 했을 때 초기화
		if (currentName.length === 0) {
			$(this).css('border', '1px solid #ccc');
			$nameMessage.text('');
			return;
		}

		// 형식 및 길이 검사
		if (!nameRegExp.test(currentName)) {
			$(this).css('border', '2px solid red');
			$nameMessage
				.text('이름은 2~20자의 한글 또는 영문만 가능합니다.')
				.css('color', 'red');
		} else {	// 형식 통과 시
			$(this).css('border', '2px solid green');
			$nameMessage
				.text('사용 가능한 형식입니다. ✔')
				.css('color', 'green');
		}
	});

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

	// 이메일 중복확인 함수 
	$('#emailId, #emailDomain, #emailDomainSelect').on('blur change', function() {
		const emailId = $('#emailId').val().trim();
		const emailDomain = $('#emailDomain').val().trim();
		const memEmail = emailId + '@' + emailDomain;
		
		const $emailMessage = $('#emailMessage');
		
		if (emailId === '' || emailDomain === '') {
			$emailMessage.text('이메일 주소를 모두 입력해주세요.').css('color', 'red');
			return;
		}
		
		// 이메일 정규식
		const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		// 이메일 형식 검사
		if(!emailPattern.test(memEmail)){
			$emailMessage.text('올바른 이메일 형식이 아닙니다.').css('color', 'red');
			return;
		}

		// 이메일 중복확인 AJAX
		$.ajax({
			url: 'singnupselectemail.do',
			type: 'POST',
			data: {
				memEmail: memEmail
			      },
			success: function(response) {
				if (response && response.memEmail) {
					$emailMessage.text('이미 존재하는 이메일입니다.❌').css('color', 'red');
					isEmailVerified = false; 	// 인증 상태 초기화
				} else {
					$emailMessage.text('사용 가능한 이메일입니다.✔').css('color', 'green');
					isEmailVerified = true;
				}
			},

			error: function(xhr, status, error) {
				console.error("이메일 중복 확인 실패:", status, error);
				alert('이메일 중복 확인 중 오류가 발생했습니다. 다시 시도해주세요.');
			}
		})
    });

	/* 최종 가입 */
	//회원가입 버튼 클릭 시
	$('#userSignUp').on('click', function() {

		/*// [1단계] 이메일 인증 완료 여부 확인
		if (!isEmailVerified) {
			alert("이메일 인증을 먼저 완료해주세요. ⚠️");
			return; // 인증되지 않았으면 여기서 함수 종료
		}*/

		// [2단계] 인증 완료 시, 나머지 유효성 검사 및 가입 진행
		signUpUserValidation();
	});
});





