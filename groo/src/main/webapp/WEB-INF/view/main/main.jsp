<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="jquery/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
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
	
	const loginServiceResponse = '${sessionScope.loginServiceResponse}';
	
	if (loginServiceResponse !== '' && loginServiceResponse !== 'null') {
		sessionStorage.setItem('userId', loginServiceResponse);
	}
		
	var memLoginId = sessionStorage.getItem('userId');
	var headerUrl = '';
    
    if (memLoginId && memLoginId.trim() !== "" && memLoginId !== "null") {
        headerUrl = 'mainheader.do'; 
    } else {
        headerUrl = 'mainnonheader.do'; 
    }
    
    $.ajax({
        url: headerUrl,
        type: 'GET',
        cache: false,
        dataType: 'html',

        success: function(htmlContent) {
            $("#header-area").html(htmlContent); 
        },
        error: function(xhr, status, error) {
            $("#header-area").html("<span>헤더 로드 오류 (코드: " + xhr.status + ")</span>");
        }
    });
});
</script>
</html>