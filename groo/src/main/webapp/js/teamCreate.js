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
            // 체크되면 비밀번호 입력 활성화
            passwordInput.prop('disabled', false);
            passwordInput.focus();
            passwordInput.attr('placeholder', '비밀번호를 입력하세요');
        } else {
            // 체크 해제되면 비밀번호 입력 비활성화 및 값 초기화
            passwordInput.prop('disabled', true);
            passwordInput.val('');
            passwordInput.attr('placeholder', '체크 후 비밀번호를 입력하세요');
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