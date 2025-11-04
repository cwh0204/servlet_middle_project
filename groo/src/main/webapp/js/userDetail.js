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
		},
		error: function(xhr, status, error) {
			console.error("닉네임 중복 확인 통신 실패:", status, error);
		}
	});
}

var nicknameCheck = (memNick) => {

	$.ajax({
		//데이터를 전송할 서버 URL
		url: 'selectUserNicknameCheck.do',
		type: 'POST',
		data: {
			memNick: memNick
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

//이메일 중복확인 완료 상태 (false: 미확인, true: 확인 완료)
let EmailCheck = false;
//이메일 형식 유효성 통과 상태 (정규식 통과)
let EmailValid = false;

/**
 * 이메일 중복 확인 요청
 * @param {string} userEmail - 확인할 사용자 이메일
 */


// 이메일 중복 확인 테스트용 AJAX 함수
//const testAjax = () => {
//    $.ajax({
//        url: 'useremailcheck.do', // 서버에서 이메일 중복 확인 처리하는 URL
//        type: 'POST',
//        data: {
//            memEmail: 'sum@naver.com' // 테스트용 이메일
//        },
//        success: function(response) {
//            // 서버에서 중복 여부에 따라 true/false 또는 메시지 반환 가정
//            // 예: { exists: true } 혹은 { exists: false }
//            console.log(response);
//
//            if(response.exists) {
//                console.log("이미 존재하는 이메일입니다.");
//            } else {
//                console.log("사용 가능한 이메일입니다.");
//            }
//        },
//        error: function(xhr, status, error) {
//            console.error("이메일 중복 확인 통신 실패:", status, error);
//        }
//    });
//};
//-------------------------------------------------------------------------

//var emailCheck = (memEmail) => {
//    $.ajax({
//        url: 'useremailcheck.do',
//        type: 'POST',
//        data: { memEmail: memEmail },
//        dataType: 'json',
//        success: function(response) {
//            console.log("서버 응답:", response);
//            
//            // DB에 존재하는 경우 (회원가입일 또는 탈퇴일이 있으면)
//            if (response.memSignupSysdate !== 0 || response.memOutDate !== 0) {
//                $("#emailMsg").text("이미 존재하는 이메일입니다.❌").css("color", "#dc3545");
//                EmailCheck = false;
//            } else {
//                $("#emailMsg").text("사용가능한 이메일입니다.✅").css("color", "#28a745");
//                EmailCheck = true;
//            }
//        },
//        error: function(xhr, status, error) {
//            console.error("이메일 중복 확인 실패:", status, error);
//            alert("이메일 확인 중 오류가 발생했습니다.");
//            EmailCheck = false;
//        }
//    });
//};

//// 이메일 중복 확인 테스트용 AJAX 함수
//var testAjax = () => {
//    $.ajax({
//        url: 'useremailcheck.do',
//        type: 'POST',
//        data: {
//            memEmail: 'sum@naver.com'
//        },
//        success: function(response) {
//            console.log(response);
//
//            if(response.exists) {
//                console.log("이미 존재하는 이메일입니다.");
//            } else {
//                console.log("사용 가능한 이메일입니다.");
//            }
//        },
//        error: function(xhr, status, error) {
//            console.error("이메일 중복 확인 통신 실패:", status, error);
//        }
//    });
//};
//
//// DOM 로드 완료 후 이벤트 바인딩
//$(function() {
//    // 이메일 도메인 입력창에서 포커스 아웃될 때 자동 중복 확인
//    $("#emailDomain").on("blur", function() {
//        const emailId = $("#emailId").val().trim();
//        const emailDomain = $("#emailDomain").val().trim();
//        const memEmail = `${emailId}@${emailDomain}`;
//
//        // 입력값 검증
//        if (!emailId || !emailDomain) {
//            $("#emailMsg").text("이메일을 모두 입력해주세요.⚠️").css("color", "#ffc107");
//            return;
//        }
//
//        // 이메일 형식 검증
//        const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
//        if (!emailRegex.test(memEmail)) {
//            $("#emailMsg").text("올바른 이메일 형식이 아닙니다.⚠️").css("color", "#ffc107");
//            EmailValid = false;
//            return;
//        }
//        
//        EmailValid = true;
//        emailCheck(memEmail);
//    });
//    
//    // 이메일 입력 필드 변경 시 중복확인 상태 초기화
//    $("#emailId, #emailDomain").on("input change", function() {
//        EmailCheck = false;
//        EmailValid = false;
//        $("#emailMsg").text("").css("color", "");
//    });
//});


//$(function() {
//    $("#emailCheckBtn").on("click", () => {
//        const emailId = $("#emailId").val().trim();
//        const emailDomain = $("#emailDomain").val().trim();
//        const memEmail = `${emailId}@${emailDomain}`;
//
//        if (!emailId || !emailDomain) {
//            alert("이메일을 모두 입력해주세요.");
//            return;
//        }
//
//        $.ajax({
//            url: 'useremailcheck.do',  // 서버 매핑 URL
//            type: 'POST',
//            data: { memEmail: memEmail },
//            dataType: 'json',
//            success: (response) => {
//                // DB에서 반환 예시: { memSignupSysdate: 1, memOutDate: 0 }
//                if (response.memSignupSysdate !== 0 || response.memOutDate !== 0) {
//                    $("#emailMsg").text("이미 존재하는 이메일입니다.❌").css("color", "#dc3545");
//                } else {
//                    $("#emailMsg").text("사용가능한 이메일입니다.✅").css("color", "#28a745");
//                }
//            },
//            error: (xhr, status, error) => {
//                console.error("이메일 중복 확인 실패:", status, error);
//                alert("이메일 확인 중 오류가 발생했습니다.");
//            }
//        });
//    });
//});

//var emailCheck = (memEmail) => {
//    $.ajax({
//        url: '/useremailcheck.do',   // 컨트롤러 매핑 주소
//        type: 'POST',
//        data: { memEmail: memEmail }, // 요청 파라미터
//        dataType: 'json',
//        success: function(response) {
//            console.log("서버 응답:", response);
//
//            // 서버에서 오는 데이터 예시: { memSignupSysdate: 1, memOutDate: 0 }
//            if (response.memSignupSysdate > 0) {
//                console.log("이미 존재하는 이메일입니다.❌");
//            } else {
//                console.log("사용가능한 이메일입니다.✅");
//            }
//        },
//        error: function(xhr, status, error) {
//            console.error("통신 실패:", status, error);
//        }
//    });
//};


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
	const memEmail = $('#emailid').val() + '@' + $('#emailDomain').val();
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
			
			// 전화번호 데이터가 "01012345678" 형식으로 들어온다고 가정
			if (response.memPhone) {
			    const phone = response.memPhone.replace(/[^0-9]/g, ''); // 숫자만 남기기
			    const first = phone.substring(0, 3);
			    const middle = phone.substring(3, 7);
			    const last = phone.substring(7, 11);

			    $('#memPhone1').val(first); // <select>의 option을 선택
			    $('#memPhone2').val(middle); // <input type="text">에 값 설정
			    $('#memPhone3').val(last);   // <input type="text">에 값 설정
			}

			// 1. 주민등록번호 (memBirth)
			if (response.memBirth) {
			    const jumin = response.memBirth.replace(/[^0-9]/g, ''); 
			    if (jumin.length >= 8) {
			        $('#memBirthFront').val(jumin.substring(2, 8)); 	 
			        $('#memBirthBackFirst').val(jumin.substring(8, 9)); 
			    }
			}
						
			// 2. 이메일 (memEmail)
		    if (response.memEmail && response.memEmail.includes('@')) {
			const [emailId, emailDomain] = response.memEmail.split('@');
			$('#emailid').val(emailId);
			$('#emailDomain').val(emailDomain);
			}
					
			// 3. 주소 (address1, address2)
			            // 서버 응답에 'address1'과 'address2' 필드가 포함되어 있다고 가정
			            if (response.address1) {
			                $('#address1').val(response.address1); // 기본 주소 설정
			            }
			            if (response.address2) {
			                $('#address2').val(response.address2); // 상세 주소 설정
			            }	
						// 4. 관심분야 (memInterest) - 체크박스와 텍스트 영역
						if (response.memInterest) {
						    const interests = response.memInterest.split(','); 
						    
						    // name="ff"를 사용하여 모든 체크박스를 순회함
						    $('input[name="ff"][type="checkbox"]').each(function() { 
						        if (interests.includes($(this).val())) {
						            $(this).prop('checked', true);
						        } else {
						            $(this).prop('checked', false);
						        }
						    });
						}
			        },

		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
		}
	});

	testAjax(); // 테스트 야작스 

	const nickInput = $('#userNick');
	const nickMsg = $('#nickMsg');

	nickInput.on('input', function() {
		const memNick = nickInput.val().trim();

		// 입력값이 없으면 메시지 제거
		if (memNick.length === 0) {
			nickMsg.text('');
			return;
		}

		$.ajax({
			url: 'selectUserNicknameCheck.do', // 서버 컨트롤러 URL
			type: 'POST',
			data: { memNick: memNick },
			success: function(response) {
				if (response.length > 0) {
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
				NicknameCheck = false;
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