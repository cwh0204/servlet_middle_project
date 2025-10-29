$(document).ready(function(){
    // 달력 초기화
    $('.input-daterange').datepicker({
        format: 'yyyy-mm-dd',
        autoclose: true,
        // language: 'ko'
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
            passwordInput.css("border", "2px solid rgba(0,0,0,0.06)");
            $('#pwMessage').remove(); // 문구 초기화
        }
    });

    // 🔥 비밀번호 실시간 유효성 검사 + 안내 문구
    $('#teampw').on('input', function() {
        const pwVal = $(this).val();
        const pwInput = $(this);

        // 안내 문구 생성 (없으면 추가)
        if ($('#pwMessage').length === 0) {
            pwInput.after('<small id="pwMessage" style="color:red; display:block; margin-top:5px; font-size:14px;">숫자 4~6자리를 입력해주세요</small>');
        }

        const message = $('#pwMessage');

        // 한글, 영어, 특수문자 포함 여부 검사
        const invalidRegex = /[ㄱ-ㅎ가-힣A-Za-z~!@#$%^&*()_+?/|\\{}\[\]]/;
        const validRegex = /^[0-9]*$/;

        if (pwVal === "") {
            // 빈값이면 기본 테두리 + 문구 숨김
            pwInput.css("border", "2px solid rgba(0, 0, 0, 0.06)");
            message.hide();
        } else if (invalidRegex.test(pwVal)) {
            // ❌ 한글, 영어, 특수문자 포함
            pwInput.css("border", "2px solid #dc3545");
            message.show();
        } else if (!validRegex.test(pwVal)) {
            // 숫자 외 문자가 들어오면 막음
            pwInput.css("border", "2px solid #dc3545");
            message.show();
        } else if (pwVal.length < 4) {
            // 4자리 미만
            pwInput.css("border", "2px solid #ffc107"); // 노란색 경고
            message.show();
        } else if (pwVal.length > 6) {
            // 6자리 초과
            pwInput.val(pwVal.slice(0, 6)); // 6자리까지만 입력 가능
            pwInput.css("border", "2px solid #dc3545");
            message.show();
        } else {
            // ✅ 4~6자리 숫자만 허용
            pwInput.css("border", "2px solid #28a745");
            message.hide(); // 정상 입력 시 문구 숨김
        }
    });

    // 나이 슬라이더 값 표시
    const ageSlider = document.getElementById("teamMemberage");
    const ageValue = document.getElementById("ageValue");

    if (ageSlider && ageValue) {
        ageSlider.addEventListener("input", () => {
            ageValue.textContent = ageSlider.value + "세";
        });
    }
	
	
	 
});


