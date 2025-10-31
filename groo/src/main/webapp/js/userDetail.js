//닉네임 중복확인 완료 상태 (false: 미확인, true: 확인 완료)
let NicknameCheck = false;
//닉네임 형식 유효성 통과 상태 (정규식 통과)
let NickValid = false;

/**
 * 닉네임 중복 확인 요청
 * @param {string} userNickname - 확인할 사용자 닉네임
 */


var testAjax = () => {
	$.ajax({
		//데이터를 전송할 서버 URL
		url: 'usernicknamecheck.do',
		type: 'POST',
		data: {
			memNick: "수민"
		},

		success: function(response) {
			console.log(response);
			console.log(response);
		},
		error: function(xhr, status, error) {
			console.error("닉네임 중복 확인 통신 실패:", status, error);
		}
	});
}

var nicknameCheck = (userNickname) => {

	$.ajax({
		//데이터를 전송할 서버 URL
		url: 'selectUserNicknameCheck.do',
		type: 'POST',
		data: {
			userNickname: userNickname
		},

		success: function(response) {
			if (response == "yes") {
				alert('사용할 수 있는 닉네임입니다.✅');
				NicknameCheck = true; //중복확인 완료
			} else {
				alert('이미 사용 중인 닉네임입니다.❌');
				NicknameCheck = false; //사용 불가
			}
		},
		error: function(xhr, status, error) {
			console.error("닉네임 중복 확인 통신 실패:", status, error);
			alert('닉네임 확인 중 오류가 발생했습니다.');
		}
	});
}


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
	const userId = sessionStorage.getItem('userId'); // 세션에 저장된 로그인 정보를 가져옴 자세한코드는 main.jsp
	console.log(userId);
	const memPass = $('#passtry').val();
	console.log(memPass);
	const memEmail = $('[name="emailid"]').val() + '@' + $('[name="emailadd"]').val();
	console.log(memEmail);
	const memAddr = $('#zipcode').val() + $('#address1 ').val() + $('#address2').val();
	console.log(memAddr);
	const memNick = $('#userNick').val();
	console.log(memNick);
	const memInterest = [
		...$('input[name="ff"]:checked').map((_, el) => el.value).get(), //...를 붙여 각 요소를 배열에 넣고 값을 가져옴
		$('textarea[name="ff"]').val().trim()
	].filter(Boolean).join(','); //빈 값이면 제거하고 ,로 합침
	console.log(memInterest);

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
			memInterest: memInterest,
			memNick: memNick
		},
		// 데이터 전송 성공 시 실행
		success: function(response) {
			console.log(response);
		},

		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
		}
	});
}

$(function() { //document.ready(() => { })
	const userId = sessionStorage.getItem('userId'); // 세션에 저장된 로그인 정보를 가져옴 자세한코드는 main.jsp

	testAjax(); // 테스트 야작스

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