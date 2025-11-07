//닉네임 중복확인 완료 상태 (false: 미확인, true: 확인 완료)
let NicknameCheck = false;
//닉네임 형식 유효성 통과 상태 (정규식 통과)
let NickValid = false;
//이메일 중복확인 완료 상태 (false: 미확인, true: 확인 완료)
let EMailCheck = false;
//이메일 형식 유효성 통과 상태 (정규식 통과)
let EmailValid = false;

/**
 * 닉네임 중복 확인 요청
 * @param {string} userNickname - 확인할 사용자 닉네임
 */


/*카카오 우편번호api*/
function openPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			document.getElementById('zipcode').value = data.zonecode;
			document.getElementById('address1').value = data.roadAddress;
			document.getElementById('address2').focus();
		}
	}).open();
}

/*취소버튼 눌렀을때*/
function showCancelAlert() {
	alert("취소되었습니다.");
}

function resetFields() {
	document.querySelectorAll('input[type="text"], input[type="password"]').forEach(el => el.value = '');
	document.querySelectorAll('textarea').forEach(el => el.value = '');
	document.querySelectorAll('.checkbox-group input[type="checkbox"]').forEach(cb => cb.checked = false);
	const profileImage = document.getElementById('profileImage');
	const existingImg = profileImage.querySelector('img');
	if (existingImg) {
		existingImg.remove();
	}
	document.getElementById('fileName').textContent = '이미지를 선택해주세요';
	profileImage.classList.remove('has-image');

	// 이메일 초기화
	const domainInput = document.querySelector('input[name="emailadd"]');
	const domainSelect = document.querySelector('select[name="email_select"]');
	domainInput.removeAttribute('readonly');
	domainSelect.value = '';
	// 비밀번호 테두리 초기화
	const pw = document.getElementById('password');
	const pwCheck = document.getElementById('passtry');
	const msg = document.getElementById('checkpw');

	pw.style.border = '1px solid #ccc';
	pwCheck.style.border = '1px solid #ccc';
	msg.textContent = '';
}


const showSubmitALert = () => {
	const userId = $('#memLoginId').val(); // 세션에 저장된 로그인 정보를 가져옴 자세한코드는 main.jsp
	console.log(userId);
	const memPass = $('#passtry').val();
	console.log(memPass);
	const memEmail = $('#emailid').val() + '@' + $('#emailDomain').val();
	console.log(memEmail);
	const memAddr = $('#zipcode').val().trim() + $('#address1').val().trim() + " " + $('#address2').val().trim();
	console.log(memAddr);
	const memNick = $('#memNick').val();
	console.log(memNick);
	const memInterest = [
		...$('input[name="ff"]:checked').map((_, el) => el.value).get(), //...를 붙여 각 요소를 배열에 넣고 값을 가져옴
		$('textarea[name="ff"]').val().trim()
	].filter(Boolean).join(','); //빈 값이면 제거하고 ,로 합침
	console.log(memInterest);
	const memPhone = $('#memPhone1').val() + $('#memPhone2').val() + $('#memPhone3').val();
	console.log(memPhone);
	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'memberupdate.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		dataType: 'json',
		data: {
			memLoginId: userId,
			memPass: memPass,
			memEmail: memEmail,
			memAddr: memAddr,
			memPhone: memPhone,
			memInterest: memInterest,
			memNick: memNick
		},
		// 데이터 전송 성공 시 실행
		success: function(response) {
			console.log(response);
			alert("회원정보가 수정되었습니다.");
			sessionStorage.removeItem('main_last_view');
			location.href = 'main.do';
		},

		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
			console.error("회원정보 수정 실패:", status, error);
			alert("회원정보 수정에 실패했습니다. 다시 시도해 주세요.");
		}
	});
}


const requestMemberDeletion = () => {

	const userId = $('#memLoginId').val(); // 세션에 저장된 로그인 정보를 가져옴 자세한코드는 main.jsp
	console.log(userId);

	// AJAX 요청
	$.ajax({
		url: '/UserdetailSelectUserDeleteController', // 1. 호출할 컨트롤러 URL
		type: 'GET',                                 // 2. HTTP 요청 방식 (조회이므로 GET)
		data: {                                      // 3. 서버에 보낼 데이터
			memLoginId: memLoginIdValue
		},
		dataType: 'json',                            // 4. 서버로부터 받을 데이터 형식 (JSON)
		success: function(response) {
			// 5. 요청 성공 시 실행될 함수
			console.log('DB 조회 성공:', response);

			// 응답으로 받은 아이디를 화면에 표시
			// response 객체는 { "memLoginId": "사용자아이디" } 형태일 것입니다.
			$('#displayUserId').text(response.memLoginId);

			alert('회원 정보 로드 성공!');
		},
		error: function(xhr, status, error) {
			// 6. 요청 실패 시 실행될 함수
			console.error('AJAX 오류 발생:', status, error);
			alert('회원 정보를 불러오는 데 실패했습니다.');
		}
	});
}




$(function() { //document.ready(() => { })

	const userId = sessionStorage.getItem('userId'); // 세션에 저장된 로그인 정보를 가져옴 자세한코드는 main.jsp
	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'userdetailselect.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		dataType: 'json',
		data: {
			memLoginId: userId

		},
		// 데이터 전송 성공 시 실행
		success: function(response) {
			console.log(response.memName);
			$('#memName').val(response.memName);
			$('#memLoginId').val(response.memLoginId);
			$('#memNick').val(response.memNick);
			$('#memPhone').val(response.memPhone);
			$('#memBirth').val(response.memBirth);
			$('#memEmail').val(response.memEmail);
			$('#zipcode').val(response.zipcode);
			$('#memInterest').val(response.memInterest);


			//1. 전화번호 데이터가 "01012345678" 형식으로 들어온다고 가정
			if (response.memPhone) {
				const phone = response.memPhone.replace(/[^0-9]/g, ''); // 숫자만 남기기
				const first = phone.substring(0, 3);
				const middle = phone.substring(3, 7);
				const last = phone.substring(7, 11);

				$('#memPhone1').val(first); // <select>의 option을 선택
				$('#memPhone2').val(middle); // <input type="text">에 값 설정
				$('#memPhone3').val(last);   // <input type="text">에 값 설정
			}

			// 2. 주민등록번호 (memBirth)
			if (response.memBirth) {
				const jumin = response.memBirth.replace(/[^0-9]/g, '');
				if (jumin.length >= 8) {
					$('#memBirthFront').val(jumin.substring(2, 8));
					$('#memBirthBackFirst').val(jumin.substring(8, 9));
				}
			}

			// 3. 이메일 (memEmail)
			if (response.memEmail && response.memEmail.includes('@')) {
				const [emailId, emailDomain] = response.memEmail.split('@');
				$('#emailid').val(emailId);
				$('#emailDomain').val(emailDomain);
			}

			// 4. 주소 (zipcode, address1, address2) - ✨수정된 로직: 붙어있는 도로명/건물번호 분리✨
			if (response.memAddr) {
				const fullAddress = response.memAddr.trim();

				// 1. 우편번호 분리 (항상 앞 5자리)
				const zipCode = fullAddress.substring(0, 5); // 결과: 13543
				let addressWithoutZip = fullAddress.substring(5).trim(); // 결과: 경기 성남시 분당구 대왕판교로 366111동 1111호

				let defaultAddress = "";
				let detailAddress = "";

				// 2. 상세 주소 분리 (주소 끝에서 숫자 + '동/호/층' 패턴을 포함하여 그 앞까지 분리)
				// 예: '111동 1111호' 부분을 찾습니다.
				// 정규식: 주소 끝에서 '숫자'로 시작하고 '동/호/층'을 포함하는 패턴을 찾습니다.
				const detailPattern = /(\s*\d+[\s]*[층호동가나다].*)$/;
				const matchDetail = addressWithoutZip.match(detailPattern);

				if (matchDetail) {
					// 상세 주소: 매칭된 전체 패턴
					detailAddress = matchDetail[0].trim(); // 결과: 111동 1111호

					// 상세 주소를 제외한 나머지 주소
					const matchIndex = addressWithoutZip.lastIndexOf(matchDetail[0]);
					const addressBeforeDetail = addressWithoutZip.substring(0, matchIndex).trim(); // 결과: 경기 성남시 분당구 대왕판교로 366

					// 3. 기본 주소 확정 (건물 번호까지 포함)
					defaultAddress = addressBeforeDetail; // 결과: 경기 성남시 분당구 대왕판교로 366

				} else {
					// 상세 주소가 없는 경우 전체를 기본 주소로 설정
					defaultAddress = addressWithoutZip;
				}

				// 4. 최종 값 설정
				$('#zipcode').val(zipCode);
				$('#address1').val(defaultAddress);
				$('#address2').val(detailAddress);

			} else {
				// memAddr이 없을 때 (기존 분리 필드 사용)
				if (response.zipcode) { $('#zipcode').val(response.zipcode); }
				if (response.address1) { $('#address1').val(response.address1); }
				if (response.address2) { $('#address2').val(response.address2); }
			}
		},

		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
		}
	});


	//닉네임 중복확인
	const nickInput = $('#memNick');
	const nickMsg = $('#nickMsg'); // 메시지를 표시할 span 요소

	// 닉네임 입력 시 실시간으로 중복 확인 수행
	nickInput.on('input', function() {
		const memNick = nickInput.val().trim();

		// 입력값이 없으면 메시지 제거
		if (memNick.length === 0) {
			nickMsg.text('');
			NicknameCheck = false;
			return;
		}

		// 닉네임 중복확인 AJAX 호출
		$.ajax({
			url: 'usernicknamecheck.do', // 서버 컨트롤러 URL
			type: 'POST',
			// dataType: 'json', // 서버 응답 형태에 따라 주석 해제하거나 제거
			data: { memNick: memNick },
			success: function(response) {
				// response.length > 0 또는 JSON 객체 응답 방식에 맞춰 수정 필요
				// 현재 코드는 '응답의 길이가 0보다 크면' 중복으로 간주
				if (response && response.memNick) {
					nickMsg.text('이미 사용 중인 닉네임입니다.❌').css('color', '#dc3545');
					NicknameCheck = false;
				} else {
					nickMsg.text('사용 가능한 닉네임입니다.✅').css('color', '#28a745');
					NicknameCheck = true;
				}
			},
			error: function(xhr, status, error) {
				console.error("닉네임 확인 실패:", status, error);
				nickMsg.text('닉네임 확인 중 오류가 발생했습니다.⚠️').css('color', '#ff9900');
				//               NicknameCheck = false;
			}
		});
	});



	$("#deletebutton").on("click", function() {
		$(".pw-container").addClass("active");

	});

	const pw = $("#password");
	const pwCheck = $("#passtry");
	const msg = $("#checkpw");
	// 8~20자리, 특수문자 1개 이상, 공백 제외 정규식
	const validpwRegex = /^(?=.*[!@#$%^&*(),.?":{}|<>])(?=\S+$).{8,20}$/;

	// 1. 비밀번호 필드에 대한 실시간 유효성 검사 (선택 사항이지만 권장)
	pw.on("input", function() {
		const pwVal = pw.val();
		if (pwVal.length === 0) {
			pw.css("border", "1px solid #ccc");
		} else if (!validpwRegex.test(pwVal)) {
			pw.css("border", "2px solid #dc3545");
		} else {
			pw.css("border", "2px solid #28a745");
		}
		// 비밀번호가 바뀌면 재확인 로직도 다시 실행
		pwCheck.trigger("input");
	}).trigger("input");


	// 이메일 중복확인
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
			EmailValid = false;
		});
	}

	// 이메일 중복확인 함수 
	$('#emailid, #emailDomain, #email_select').on('blur change', function() {
		const emailId = $('#emailid').val().trim();
		const emailDomain = $('#emailDomain').val().trim();
		const memEmail = emailId + '@' + emailDomain;

		const $emailMsg = $('#emailMsg');

		if (emailId === '' || emailDomain === '') {
			$emailMsg.text('이메일 주소를 모두 입력해주세요.').css('color', 'red');
			return;
		}

		// 이메일 정규식
		const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		// 이메일 형식 검사
		if (!emailPattern.test(memEmail)) {
			$emailMsg.text('올바른 이메일 형식이 아닙니다.').css('color', 'red');
			return;
		}

		// 이메일 중복확인 AJAX
		$.ajax({
			url: 'useremailcheck.do',
			type: 'POST',
			data: {
				memEmail: memEmail
			},
			success: function(response) {
				if (response && response.memEmail) {
					$emailMsg.text('이미 존재하는 이메일입니다.❌').css('color', 'red');
					EmailValid = false;    // 인증 상태 초기화
				} else {
					$emailMsg.text('사용 가능한 이메일입니다.✔').css('color', 'green');
					EmailValid = true;
				}
			},

			error: function(xhr, status, error) {
				console.error("이메일 중복 확인 실패:", status, error);
				alert('이메일 중복 확인 중 오류가 발생했습니다. 다시 시도해주세요.');
			}
		})
	});


	// 2. 비밀번호 재확인 필드에 대한 실시간 일치 검사
	pwCheck.on("input", function() {
		const pwVal = pw.val();
		const checkVal = pwCheck.val();

		// 입력 취소시 (checkVal.length === 0)
		if (checkVal.length === 0) {
			pwCheck.css("border", "1px solid #ccc");
			msg.text("").css("color", "");
			return;
		}

		// 🛑 수정된 부분: 논리 오류 해결을 위해 if/else 구조 사용
		// 비밀번호 유효성 조건을 만족하지 않거나, 두 값이 일치하지 않는 경우
		if (!validpwRegex.test(pwVal)) {
			pwCheck.css("border", "2px solid #dc3545");
			msg.text("비밀번호가 유효성 조건(8~20자리, 특수문자 1개 이상)에 맞지 않습니다.").css("color", "#dc3545");
		} else if (pwVal !== checkVal) {
			pwCheck.css("border", "2px solid #dc3545");
			msg.text("비밀번호가 일치하지 않습니다.").css("color", "#dc3545");
		} else {
			// 모든 조건을 만족하고 일치하는 경우
			pwCheck.css("border", "2px solid #28a745");
			msg.text("비밀번호가 일치합니다.").css("color", "#28a745");
		}
	}).trigger("input");

	/*이메일 뒷부분 자동입력 및 직접입력*/
	const domainInput = document.querySelector('input[name="emailadd"]');
	const domainSelect = document.querySelector('select[name="email_select"]');
	domainSelect.addEventListener('change', () => {
		if (domainSelect.value === "direct" || domainSelect.value === "") {
			domainInput.value = "";
			domainInput.removeAttribute("readonly");
		} else {
			domainInput.value = domainSelect.value;
			domainInput.setAttribute("readonly", true);
		}
	});

	/* --눈모양 아이콘*/
	const togglePassword = document.getElementById('togglePassword');
	const password = document.getElementById('password');

	togglePassword.addEventListener('click', () => {
		if (password.type === 'password') {

			password.type = 'text';
			togglePassword.src = 'https://i.postimg.cc/8z2sxNX4/view.png'; // 비밀번호 보일때
		} else {
			password.type = 'password';
			togglePassword.src = 'https://i.postimg.cc/TYkDN86M/hide.png'; // 비밀번호 안보일때
		}

	});
	const togglePasstry = document.getElementById('togglePasstry');
	const passtry = document.getElementById('passtry');

	togglePasstry.addEventListener('click', () => {
		if (passtry.type === 'password') {
			passtry.type = 'text';
			togglePasstry.src = 'https://i.postimg.cc/8z2sxNX4/view.png';
		} else {
			passtry.type = 'password';
			togglePasstry.src = 'https://i.postimg.cc/TYkDN86M/hide.png';
		}
	});

	const fileInput = document.getElementById('fileInput');
	const profileImage = document.getElementById('profileImage');
	const fileName = document.getElementById('fileName');

	fileInput.addEventListener('change', function(e) {
		const file = e.target.files[0];

		if (file) {
			// 파일명 표시
			fileName.textContent = file.name;

			// 이미지 미리보기
			const reader = new FileReader();

			reader.onload = function(e) {
				// 기존 이미지가 있으면 제거
				const existingImg = profileImage.querySelector('img');
				if (existingImg) {
					existingImg.remove();
				}

				// 새 이미지 추가
				const img = document.createElement('img');
				img.src = e.target.result;
				profileImage.appendChild(img);
				profileImage.classList.add('has-image');
			}

			reader.readAsDataURL(file);
		}
	});
});