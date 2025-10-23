<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 상세페이지</title>
<style>
* {
   margin: 0;
   padding: 0;
   box-sizing: border-box;
}


 
 .container {
   display: flex; 
   background-color: white;
   border-radius: 12px;
   box-shadow: 0 2px 10px rgba(0, 0, 0, 0.15);
   width: 100%;
   max-width: 900px;
   padding: 40px;
   gap: 40px;
}

.left-section {
   display: flex;
   flex-direction: column;
   justify-content: space-around;
   align-items: center;
   width: 100%;
   max-width:250px;
   border-right: 1px solid #ddd;
   padding-right: 30px;
}

.left-section h2 {
   font-size: 22px;
   margin-bottom: 20px;
   color: #333;
}

.profile-box {
   margin-top: 40px;
   text-align: center;
}

#profilePreview {
   width: 120px;
   height: 120px;
   border-radius: 50%;
   object-fit: cover;
   border: 1px solid #ccc;
   margin-bottom: 10px;
}

.button-group {
   display: flex;
   flex-direction: column;
   gap: 10px;
   width: 100%;
   margin-bottom: 29px;
}

button {
   padding: 12px;
   font-size: 16px;
   border: none;
   border-radius: 6px;
   cursor: pointer;
   font-weight: bold;
}

.okbutton {
   background-color: #9acd32;
   color: white;
}

.okbutton:hover {
   background-color: #7fb824;
}

.cancelbutton {
   background-color: #CEF279;
   color: white;
}

.cancelbutton:hover {
   background-color: #BDD250;
}

#deletebutton {
   background-color: #c0c0c0;
   color: white;
}

#deletebutton:hover {
   background-color: #a9a9a9;
}

.right-section {
   flex: 1;
}

.right-section h1 {
   font-size: 26px;
   font-weight: bold;
   margin-bottom: 30px;
   color: #333;
}

.input-group {
   margin-bottom: 20px;
}

.input-group label {
   display: block;
   margin-bottom: 6px;
   font-size: 15px;
   color: #444;
   font-weight: 500;
}

.input-group input[type="text"], 
.input-group input[type="password"],
.input-group input[type="email"], 
.input-group input[type="date"],
.input-group select, 
.input-group textarea {
   width: 100%;
   padding: 8px 12px;
   border: 1px solid #ccc;
   border-radius: 6px;
   font-size: 12px;
}

.input-group input[disabled] {
   background-color: #f0f0f0;
   color: #777;
}

.checkbox-group {
   display: flex;
   flex-wrap: wrap;
   gap: 15px;
   margin-top: 8px;
}

.left_user_box {
   display: flex;
   justify-content: center;
   align-items: center;
   flex-direction: column;
   gap: 40px;
}

.address_btn {
   display: flex;
   align-items: center;
   justify-content: center;
   padding: 8px;
   height: 31px;
   border-radius: 6px;
   border: none;
   cursor: pointer;
   background-color: #9acd32;
   color: white;
   font-size: 12px;
}

.address_btn:hover {
  background-color: #7fb824;
}

.profile-image {
   width: 140px;
   height: 140px;
   border-radius: 50%;
   background: linear-gradient(135deg, #667eea20 0%, #764ba220 100%);
   display: flex;
   align-items: center;
   justify-content: center;
   border: 3px solid #9acd32; 
   overflow: hidden;
   position: relative;
   cursor: pointer;
   transition: all 0.3s;
}

.profile-image img{
   width: 100%;
   height: 100%;
   object-fit: cover;
}

.profile-info {
   text-align: center;
   width: 100%;
}

#fileInput {
   display: none;
}

.upload-btn {
   background: #9acd32;
   color: white;
   border: none;
   padding: 10px 20px;
   border-radius: 8px;
   cursor: pointer;
   font-size: 13px;
   font-weight: 600;
   transition: all 0.3s;
   width: 100%;
   margin-bottom: 10px;
}

.upload-btn:hover {
   background: #7fb824;
   transform: translateY(-2px);
   box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
}

.file-name {
   font-size: 11px;
   color: #999;
   word-break: break-all;
   padding: 8px;
   background: white;
   border-radius: 6px;
}


</style>
</head>

<body onload="checkPassword()">

      <div class="container">

         <div class="left-section">
            <div class="left_user_box">
               <!--                <div class="profile-box">
                  <h2>프로필</h2>
                  <img id="profilePreview"
                     src="https://i.postimg.cc/QtzLc2wK/reader.png" alt="기본 프로필">
                  <input type="file" name="profile" id="profile" accept="image/*"
                     onchange="previewProfile(event)">
               </div> -->
               <div class="profile-image" id="profileImage"></div>
               <div class="profile-info">
                  <input type="file" id="fileInput" accept="image/*">
                  <button type="button" class="upload-btn"
                     onclick="document.getElementById('fileInput').click()">이미지 업로드</button>
                  <div class="file-name" id="fileName">이미지를 선택해주세요</div>
               </div>
               <div>
                  <div class="input-group">
                     <label>아이디</label> <input type="text" name="userID"
                        value="userID" disabled="">
                  </div>
                  <div class="input-group">
                     <label>이름</label> <input type="text" name="irum" value="user222"
                        disabled="">
                  </div>
                  <div class="input-group">
                     <label>전화번호<span style="font-size: 12px; color: #666;">(선택)</span>
                     </label>
                     <div style="display: flex; gap: 10px; align-items: center;">
                        <select name="phonenumber"
                           style="width: 65px; text-align: center;">
                           <option value="010">010</option>
                           <option value="042">042</option>
                           <option value="02">02</option>
                        </select> <span>-</span> <input type="text" name="phonemiddle"
                           maxlength="4" style="width: 65px; text-align: center;">
                        <span>-</span> <input type="text" name="phoneback" maxlength="4"
                           style="width: 65px; text-align: center;">
                     </div>
                  </div>
               </div>
            </div>
            <div class="button-group">
               <button type="submit" class="okbutton">회원정보수정</button>
               <button type="reset" class="cancelbutton" onclick="showCancelAlert()">취소</button>
               <button type="button" id="deletebutton">회원탈퇴</button> 
            </div>
         </div>


         <div class="right-section">
            <h1>회원정보 상세페이지</h1>

            <div class="input-group" style="position: relative;">
               <label>비밀번호</label> 
                     <input type="password" name="password" id="password" placeholder="8~20자리, 특수문자 1개 이상, 공백 제외" style="width: 100%; padding-right: 30px;"> 
                  <img id="togglePassword" src="https://i.postimg.cc/TYkDN86M/hide.png"
                  style="position: absolute; right: 10px; top: 34px; cursor: pointer; width: 20px; height: 20px;">
            </div>

            <div class="input-group" style="position: relative;">
               <label>비밀번호 재확인</label> <input type="password" name="passtry" id="passtry" style="width: 100%; padding-right: 30px;"> 
                  <img id="togglePasstry" src="https://i.postimg.cc/TYkDN86M/hide.png"
                  style="position: absolute; right: 10px; top: 34px; cursor: pointer; width: 20px; height: 20px;">
             <!-- 검증 폰트 -->
             <font id = "checkpw" size = "2"></font>
            </div>

            <div class="input-group">
               <label>주민등록번호</label>
               <div style="display: flex; align-items: center; gap: 5px;">
                  <input type="text" name="jumin_front" maxlength="6"
                     placeholder="123456" disabled
                     style="width: 120px; text-align: center;"> <span>-</span>
                  <input type="password" name="jumin_back" maxlength="1"
                     placeholder="●" disabled style="width: 50px; text-align: center;">
                  <span>******</span>
               </div>
            </div>

            <div class="input-group">
               <label>이메일</label>
               <div style="display: flex; align-items: center; gap: 5px;">
                  <input type="text" name="emailid"
                     style="width: 120px; text-align: center;"> <span>@</span>
                  <input type="text" name="emailadd"
                     style="width: 150px; text-align: center;">
               </div>
               <select name="email_select"
                  style="margin-top: 5px; width: 100%; padding: 12px 14px; border-radius: 8px; border: 1px solid #ccc;">
                  <option value="">- 이메일 선택 -</option>
                  <option value="direct">직접입력</option>
                  <option value="naver.com">naver.com</option>
                  <option value="gmail.com">gmail.com</option>
                  <option value="daum.net">daum.net</option>
               </select>
            </div>

            <div class="input-group">
               <label>주소</label>
               <div style="display: flex; gap: 5px; align-items: center;">
                  <input type="text" id="zipcode" name="zipcode" placeholder="우편번호"
                     style="width: 120px; text-align: center;" readonly> <input
                     type="button" value="우편번호" class="address_btn"
                     onclick="openPostcode()">
                     
              
               </div>
               <input type="text" id="address1" name="address1" placeholder="주소"
                  style="margin-top: 5px;" readonly> <input type="text"
                  id="address2" name="address2" placeholder="상세주소"
                  style="margin-top: 5px;">
            </div>

            <div class="input-group">
               <label>관심분야</label>
               <div class="checkbox-group">
                  <label><input type="checkbox" name="ff" value="IT/개발">
                     IT/개발</label> <label><input type="checkbox" name="ff"
                     value="자격증/취업"> 자격증/취업</label> <label><input
                     type="checkbox" name="ff" value="건강/의학"> 건강/의학</label> <label><input
                     type="checkbox" name="ff" value="취미"> 취미</label> <label><input
                     type="checkbox" name="ff" value="기타"> 기타</label>
               </div>
               <textarea name="ff" placeholder="관심분야를 입력하세요"></textarea>
            </div>
            
         </div>
      </div>
	<%@ include file="./userdetailpw.jsp"%>
   <!-- 카카오 우편번호api -->
   <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
   <script>
   $(function(){

	   $("#deletebutton").on("click",function () {
		   $(".pw-container").addClass("active");
	   });
   });
   
<!-- 프로필 미리보기 -->
function previewProfile(event) {
    const file = event.target.files[0];
    const preview = document.getElementById('profilePreview');
    if (file) {
        const reader = new FileReader();
        reader.onload = e => preview.src = e.target.result;
        reader.readAsDataURL(file);
    } else {
        preview.src = "https://i.postimg.cc/sX337p8B/user-2.png";
    }
}

<!-- 이메일 뒷부분 자동입력 및 직접입력 -->
const domainInput = document.querySelector('input[name="emailadd"]');
const domainSelect = document.querySelector('select[name="email_select"]');
domainSelect.addEventListener('change', () => {
    if(domainSelect.value === "direct" || domainSelect.value === "") {
        domainInput.value = ""; 
        domainInput.removeAttribute("readonly");
    } else {
        domainInput.value = domainSelect.value; 
        domainInput.setAttribute("readonly", true);
    }
});


<!-- 카카오 우편번호api -->
function openPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById('address1').value = data.roadAddress;
            document.getElementById('address2').focus();
        }
    }).open();
}

<!-- 팝업창 -->
/* function checkPassword() {
    const correctPassword = "1234";
    const pw = prompt("비밀번호를 입력하세요.");
    if (pw === null) {
        alert("비밀번호 입력이 취소되었습니다.");
        window.location.href = "${pageContext.request.contextPath}/mypage.do";
        return;
    }
    if (pw !== correctPassword) {
        alert("비밀번호가 틀렸습니다.");
        window.location.href = "${pageContext.request.contextPath}/mypage.do";
    }
} */

<!-- 취소버튼 눌렀을때 -->
function showCancelAlert() {
    alert("취소되었습니다.");
}

<!-- 비밀번호, 비밀번호재확인 비교 -->
<!-- 비밀번호 자리수 제한(공백제외, 특수문자 최소1개이상, 8~20자리까지) -->
function showAlert() {
    const pw = document.querySelector('input[name="password"]').value;
    const pw2 = document.querySelector('input[name="passtry"]').value;

    
    if (pw === "") {
        alert("회원정보가 수정되었습니다.");
        window.location.href = "${pageContext.request.contextPath}/mypage.do";
        return false;
    }

    
    const lengthValid = pw.length >= 8 && pw.length <= 20; 
    const noSpace = !/\s/.test(pw); 
    const hasSpecial = /[!@#$%^&*(),.?":{}|<>]/.test(pw); 

    if (!lengthValid || !noSpace || !hasSpecial) {
        /* alert("비밀번호가 맞지 않습니다."); */
        document.querySelector('input[name="password"]').focus();
        return false; 
    }

    if (pw !== pw2) {
        alert("비밀번호가 다릅니다.");
        document.querySelector('input[name="password"]').focus();
        return false; 
    }

    alert("회원정보가 수정되었습니다.");
    window.location.href = "${pageContext.request.contextPath}/mypage.do";
    return false; 
}


<!-- 비밀번호 검증 문구 및 테두리 -->
$("#password,#passtry").keyup(function(){
    let password = $("#password").val();
    let passtry = $("#passtry").val();

    if(password=='' && passtry==''){
        $("#checkmsg").text("");
        return;
    }

    if(password.length >= 8 && passtry.length >= 8){
        if(password == passtry){
            $("#checkmsg").text("비밀번호 일치").css('color','#000');
            return;
        }
        if(password != passtry){
            $("#checkmsg").text("비밀번호 불일치").css('color','#fba082');
            return;					
        }
    }
});



<!--눈모양 아이콘-->
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
</script>
</body>
</html>
