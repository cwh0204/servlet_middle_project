<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/signup.css" rel="stylesheet">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title></title>
<style>
html, body{
	   width: 100%;
	   height: 100%;
	   margin: 0;
	   padding: 0;
}

body {
	  background-color: #f8f9fa;
	  font-family: 'Segoe UI', sans-serif;
	  margin: 0;
	  padding: 0;
}

.section {
	   display: flex;
	   justify-content: center;
	   align-items: center;
}

section {
	   width: 100%;
	   max-width: 600px;
	   background-color: white;
	   padding:40px;
	   margin: 30px 0;
	   border-radius: 12px;
	   box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
	   border: none;
}

h1 {
  text-align: center;
  margin-bottom: 20px; 
  font-size: 50px; 
}

h5 {
  margin-top: 20px;   
}

.termsBox {
  width: 100%;
  height: 200px;
  margin-bottom: 15px;
  overflow-y: scroll;
  padding: 10px;
  resize: none;
  border: 1px solid #ced4da;
  border-radius: 6px;
  font-size: 14px;
  background-color: #f9f9f9;
  box-sizing: border-box;
}

.btn {
  width: 48%;
  padding: 10px;
  font-size: 18px;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  box-sizing: border-box;
}

.btn-next {
  background-color: #84d330;
  color: white;
}

.btn-next:hover {
  background-color: #1fb205;
  color: white;
}

.btn-cancel {
  background-color: #D5D5D5;
  color: white;
}

.btn-cancel:hover {
  background-color: #BDBDBD;
  color: white;
}

.buttonGroup {
  display: flex;
  justify-content: space-between;
  margin-top: 20px;
}

</style>
</head>
<body>
<div class="progress-container">
  <div class="step active">
    <div class="circle">1</div>
    <div class="label">약관 동의</div>
  </div>
  <div class="step">
    <div class="circle">2</div>
    <div class="label">정보 입력</div>
  </div>
  <div class="step">
    <div class="circle">3</div>
    <div class="label">가입 완료</div>
  </div>
</div>
<div class="section">
 <section>
  <h1>Groo</h1>

  <form action="signuppage.do" method="post">
   <div>
    <input type="checkbox" id="agreeAll">
    <label for="agreeAll"><strong>모두 동의합니다.</strong></label>
    <hr>
  </div>
    <h5>이용약관[필수]</h5>
    <div class="termsBox">
	  <jsp:include page="/WEB-INF/view/terms/terms.jsp" />
    </div>
    <input type="checkbox" id="termsAgree" name="termsAgree" required>
    <label for="termsAgree">위 약관에 동의합니다.</label>

    <h5>개인정보 수집 및 이용 동의[필수]</h5>
    <div class="termsBox">
      <jsp:include page="/WEB-INF/view/terms/privacy.jsp" />
    </div>
    <input type="checkbox" id="privacyAgree" name="privacyAgree" required> 
    <label for="privacyAgree">개인정보 수집 및 이용에 동의합니다.</label>

    <div class="buttonGroup">
    <input type="submit" value="다음" class="btn btn-next">
    <input type="button" value="취소" class="btn btn-cancel" onclick="goToLogin()">
    </div>
  </form>
 </section>
</div>
<script>

$(document).ready(function() {
    // 모두 동의 클릭 시
    $('#agreeAll').on('change', function() {
        const checked = $(this).is(':checked');
        $('input[name="termsAgree"], input[name="privacyAgree"]').prop('checked', checked);
    });

    // 개별 체크 해제 시 '모두 동의'도 해제
    $('input[name="termsAgree"], input[name="privacyAgree"]').on('change', function() {
        const allChecked = $('input[name="termsAgree"]').is(':checked') &&
                           $('input[name="privacyAgree"]').is(':checked');
        $('#agreeAll').prop('checked', allChecked);
    });
});


<!-- 취소 버튼 누르면 로그인 페이지로 이동 -->
function goToLogin() {
    window.location.href = 'login.do';
}
</script>
</body>
</html>