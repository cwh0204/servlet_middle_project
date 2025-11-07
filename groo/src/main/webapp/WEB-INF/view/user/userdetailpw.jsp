<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<meta charset="UTF-8">
<title>회원정보확인</title>
<style>


.pw-container.active ~ .login-box {
	display: block;
	background-color: #fff;
	padding: 30px 40px;
	border-radius: 12px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	width: 300px;
	position: absolute;
}

.login-box h2 {
	text-align: center;
	margin-bottom: 20px;
}

.input-group {
	margin-bottom: 15px;
	display: flex;
	flex-direction: column;
}

.input-group label {
	margin-bottom: 5px;
	font-weight: bold;
}

.input-group input {
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 6px;
}

input[disabled] {
	background-color: #e9ecef;
	cursor: not-allowed;
}

.button-group {
	display: flex;
	gap: 10px;
	margin-top: 20px;
}


button {
	width: 100%;
	padding: 10px;
	background-color: #9acd32;
	border: none;
	color: white;
	font-size: 16px;
	border-radius: 6px;
	cursor: pointer;
}

button:hover {
	background-color: #7fb824;;
}

.pw-container {
	display: none;
}

.pw-container.active {
	display: block;
	position: absolute;
	background-color: black;
	width: 100%;
	height: 100%;
	opacity: 0.6;
}

.login-box {
	display: none;
}

</style>
</head>

<body class="">
	<div class="pw-container"></div>
	<div class="login-box">
		<div class="input-group">
			<label>아이디</label> <input type="text" name="userID" id="userID" readonly>
		</div>

		<div class="input-group" style="position: relative;">
			<label>비밀번호</label> <input type="password" name="pw" id="pw" required>
<!-- 			<img id="togglePassword" src="https://i.postimg.cc/TYkDN86M/hide.png" -->
<!-- 				style="position: absolute; right: 10px; top: 35px; cursor: pointer; width: 20px; height: 20px;"> -->
		</div>
     <div class="button-group">
        <button id="cancelBtn" type="button">취소</button>
		<button id="userPwCk" type="button">확인</button>
	 </div>	
	</div>
</body>

<script>



//문서가 완전히 로드된 후 실행됩니다.
$(document).ready(function() {
	let password;
	
	
	// 3. AJAX 요청 시작
	$.ajax({
		// 서버에서 비밀번호 검증 및 탈퇴 처리를 담당할 컨트롤러 URL
		url: 'userdetaildelete.do',
		type: 'POST', // 비밀번호를 포함한 중요한 처리는 POST 방식 사용
		data: {
			memLoginId: memLoginId,
			
		},
		dataType: 'json',  
		success: function(response) {
			console.log(response.memPass);
			password= response.memPass;
			

		},
		error: function(xhr, status, error) {
			// 통신 오류나 서버 내부 오류(500) 발생 시
			console.error("탈퇴 처리 중 오류 발생:", status, error);
			alert("처리 중 문제가 발생했습니다. 잠시 후 다시 시도해 주세요.");
		}
	});
	
	
    
    // ID가 'checkButton'인 버튼에 클릭 이벤트 리스너를 추가합니다.
    $('#userPwCk').on('click', function() {
    	
    	
        
        // 1. ID가 'pw'인 입력 필드의 현재 값(value)을 가져옵니다.
        const enteredPassword = $('#pw').val();
        const userId = $('#userID').val();
        
        console.log("userId", userId);
        
        // 3. (선택 사항) 값이 비어있는지 확인하는 메시지
        if (enteredPassword.length === 0) {
            alert("경고: 비밀번호가 입력되지 않았습니다.");
            return;
        }
        // 2. 가져온 비밀번호 값을 콘솔에 출력합니다.
        console.log("사용자가 입력한 비밀번호:", enteredPassword);
        
       // if(password === enteredPassword ) {
    		
    		$.ajax({
    			// 데이터를 전송할 서버 URL
    			url: 'memberdelete.do',
    			// 전송 방식 (로그인/회원가입은 보통 POST 사용)
    			type: 'POST',
    			// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
    			dataType: 'json',
    			data: {
    				memLoginId: userId,
    				memPass: enteredPassword
    			},
    			// 데이터 전송 성공 시 실행
    			success: function(response) {
    				
    				console.log("탈퇴하자",response);
    				if(response=="success"){
	    				alert("탈퇴가 완료되었습니다.");
	    				sessionStorage.removeItem('main_last_view');
	    				location.href = 'login.do';
    				}else{
    					alert("탈퇴 처리가 실패했습니다.");
    				}
    			},

    			// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
    			error: function(xhr, status, error) {
    			}
    		});	
    		
    		
    		
    		
//     	}else{
//     		alert("비밀번호가 틀렸습니다.")
//     	}
        
       
    });
});






//1. sessionStorage에서 'userId' 값을 가져옵니다.
var memLoginId = sessionStorage.getItem('userId');

// 2. jQuery를 사용하여 name이 'userID'인 input 요소의 값을 설정합니다.
$('input[name="userID"]').val(memLoginId);

// 또는 HTML ID가 있다면 더 빠르게 접근 가능합니다. (예: <input id="userIdInput" ...>)
// $('#userIdInput').val(memLoginId);




// 비밀번호 눈모양 아이콘 
const togglePasswordPw = document.getElementById('togglePassword');
const passwordPw = document.getElementById('pw');

$("#userPwCk").on("click",function () {
	   $(".pw-container").removeClass("active");
});

togglePasswordPw.addEventListener('click', () => {
    if (passwordPw.type === 'password') {
    	passwordPw.type = 'text';
//         togglePasswordPw.src = 'https://i.postimg.cc/8z2sxNX4/view.png'; //보일때
    } else {
        passwordPw.type = 'password';
//         togglePasswordPw.src = 'https://i.postimg.cc/TYkDN86M/hide.png'; //안보일때 

    }
}
);


// 비밀번호 자리수 제한(공백제외, 특수문자 최소1개이상, 8~20자리까지) 
 function checkPassword() { 
    const pw = document.getElementById("pw").value;
    
    const lengthValid = pw.length >= 8 && pw.length <= 20; 
    const noSpace = !/\s/.test(pw); 
    const hasSpecial = /[!@#$%^&*(),.?":{}|<>]/.test(pw); 

    if (!lengthValid || !noSpace || !hasSpecial) {
        document.querySelector('input[name="password"]').focus();
        return false; 
    }

    
    
// 비밀번호 팝업창 
const correctPassword = "123456789!"; 

if (pw === correctPassword) {
    window.location.href = "${pageContext.request.contextPath}/userdetail.do";
    return false; 
} else {
    alert("비밀번호가 틀렸습니다.");
    document.getElementById("pw").value = ""; 
    document.getElementById("pw").focus();  
    return false; 
}

    
}
</script>
</html>
