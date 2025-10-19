<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보확인</title>
<style>
body {
    background-color: #f8f9fa;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.login-box {
    background-color: #fff;
    padding: 30px 40px;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    width: 300px;
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

button {
    width: 100%;
    padding: 10px;
    background-color: #7FDBB6;
    border: none;
    color: white;
    font-size: 16px;
    border-radius: 6px;
    cursor: pointer;
}
</style>
</head>

<body>
<div class="login-box">
    <h2>회원정보확인</h2>
    
    <form onsubmit="return checkPassword();">
        <div class="input-group">
            <label>아이디</label>
            <input type="text" name="userID" value="userID" disabled>
        </div>

        <div class="input-group" style="position: relative;">
            <label>비밀번호</label>
            <input type="password" name="pw" id="pw" placeholder="비밀번호를 입력하세요" required>
            <img id="togglePassword" 
                 src="https://i.postimg.cc/TYkDN86M/hide.png"
                 style="position: absolute; right: 10px; top: 38px; cursor: pointer; width: 20px; height: 20px;">
        </div>

        <button type="submit">확인</button>
    </form>
</div>

<script>
<!-- 비밀번호 눈모양 아이콘 -->
const togglePassword = document.getElementById('togglePassword');
const password = document.getElementById('pw');

togglePassword.addEventListener('click', () => {
    if (password.type === 'password') {
        password.type = 'text';
        togglePassword.src = 'https://i.postimg.cc/8z2sxNX4/view.png'; //보일때
    } else {
        password.type = 'password';
        togglePassword.src = 'https://i.postimg.cc/TYkDN86M/hide.png'; //안보일때 
    }
});

<!-- 비밀번호 팝업창 -->
function checkPassword() {
    const correctPassword = "1234"; 
    const pw = document.getElementById("pw").value;

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
</body>
</html>
