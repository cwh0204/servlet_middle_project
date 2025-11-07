<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="jquery/jquery-3.7.1.min.js"></script>
<script src="js/main/main.js"></script>
<link rel="stylesheet" href="css/main/mainheader.css">
<link rel="stylesheet" href="css/base.css">
</head>
<body>
<div id="header-area">
</div>
	<div class="full_w_h" id="contentArea">
		<%@ include file="mainhome.jsp"%>
	</div>
</body>
<script type="text/javascript">
$(document).ready( function() {
	var memLoginId = sessionStorage.getItem('userId');
    console.log("sessionStorage userId:", memLoginId);
	var headerUrl = '';
    
    if (memLoginId && memLoginId.trim() !== "" && memLoginId !== "null") {
        headerUrl = 'mainheader.do'; 
        console.log("🔍 상태: 로그인됨. 로드 URL:", headerUrl);
    } else {
        headerUrl = 'mainnonheader.do'; 
        console.log("🔍 상태: 비로그인. 로드 URL:", headerUrl);
    }
    
    $.ajax({
        url: headerUrl,
        type: 'GET',
        cache: false,
        dataType: 'html',

        success: function(htmlContent) {
            $("#header-area").html(htmlContent); 
            console.log("✅ 헤더 파일 (" + headerUrl + ") 로드 성공");
        },
        error: function(xhr, status, error) {
            console.error("❌ AJAX 헤더 로드 실패");
            console.log("HTTP 상태 코드:", xhr.status);
            
            $("#header-area").html("<span>헤더 로드 오류 (코드: " + xhr.status + ")</span>");
        }
    });
    
    const loginServiceResponse = '${sessionScope.loginServiceResponse}';
	if (loginServiceResponse !== '' && loginServiceResponse !== 'null') {
		sessionStorage.setItem('userId', loginServiceResponse);
	}
});
</script>
</html>