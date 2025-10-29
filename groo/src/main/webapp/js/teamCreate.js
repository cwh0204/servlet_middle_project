$(document).ready(function(){
    // 달력 초기화
    $('.input-daterange').datepicker({
        format: 'yyyy-mm-dd',
        autoclose: true,
//        language: 'ko'
    });

	// 비밀번호 체크박스 기능
	    $('#pwCheckbox').on('change', function() {
	        const passwordInput = $('#teampw');

	        if ($(this).is(':checked')) {
	            passwordInput.prop('disabled', false);
	            passwordInput.focus();
	            passwordInput.attr('placeholder', '비밀번호를 입력하세요');
	        } else {
	            passwordInput.prop('disabled', true);
	            passwordInput.val('');
	            passwordInput.attr('placeholder', '체크 후 비밀번호를 입력하세요');
	            passwordInput.css("border", "2px solid rgba(0,0,0,0.06)"); // 초기화 시 테두리 원상복귀
	        }
	    });


	    // 🔥 비밀번호 실시간 유효성 검사 (한글/특수문자/영어 입력 시 빨간색)
		$('#teampw').on('input', function() {
		    const pwVal = $(this).val();
		    const pwInput = $(this);
		    
		    // 한글, 영어, 특수문자 포함 여부 검사
		    const invalidRegex = /[ㄱ-ㅎ가-힣A-Za-z~!@#$%^&*()_+?/|\\{}\[\]]/;
		    // 숫자만 유효
		    const validRegex = /^[0-9]*$/;

		    if (pwVal === "") {
		        pwInput.css("border", "2px solid rgba(0, 0, 0, 0.06)");
		    } else if (invalidRegex.test(pwVal)) {
		        pwInput.css("border", "2px solid #dc3545");
		    } else if (validRegex.test(pwVal)) {
		        pwInput.css("border", "2px solid #28a745");
		    }
		});


	
	
	
	   
    // 나이 슬라이더 값 표시 (해당 요소가 있을 경우에만 실행)
    const ageSlider = document.getElementById("teamMemberage");
    const ageValue = document.getElementById("ageValue");

    if (ageSlider && ageValue) {
        ageSlider.addEventListener("input", () => {
            ageValue.textContent = ageSlider.value + "세";
        });
    }
});