<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* { margin:0; padding:0; }

fieldset {
    border-radius: 10px;
    background-color: white;
    padding: 50;
    height:603px;
    border: 1px solid gray;
}

html, body {
    height: 100%;
    width: 100%;
    margin: 0;
    padding: 0;
}

header, section{
    box-sizing:border-box;
    border:1px solid gray;
    margin:1px; padding:2px;
    border-radius: 10px;
}

header {
    margin:0px;
    padding:0px;
    text-align:center;
    height: 50px;
    background-color:lightgreen;
}

section {
    height: 610px;
    width: 59.4%;
    background-color: lightpink;
}

#content {
    display: flex;
    justify-content: center;
    align-items: center;     
}

</style>
</head>
<body>
<div id="container">
   <header>
      <h1>회원가입상세페이지</h1>
   </header>
</div>
<div id="content">
   <section>
      <form>
         <fieldset>
         <br><br><br><br><br>
            프로필변경 <input type="file" name="profile"><br><br>
            <table border="1" style="width:905px; height:300px;">
            <tr>
            <td style="text-align:center;">이 름</td>
            <td><input type="text" name="irum" placeholder="이름을 입력하세요"></td>
            </tr>
            <tr>
            <td style="text-align:center;">비밀번호</td>
            <td><input type="text" name="pass"></td>
            </tr>
            <tr>
            <td style="text-align:center;">비밀번호 재확인</td>
            <td><input type="text" name="passtry"></td>
            </tr>
            <tr>
            <td style="text-align:center;">생년월일</td> 
            <td><input type="date" name="date">
                <input type="radio" name="bb" value="음력">음력
                <input type="radio" name="bb" value="양력">양력</td>
            </tr>
            <tr>
            <td style="text-align:center;">성 별</td> 
            <td><input type="radio" name="aa" value="남">남
                <input type="radio" name="aa" value="여">여</td>
            </tr>
            <!-- 이메일 전송 이상함 -->
            <tr>
            <td style="text-align:center;">이메일</td>
            <td><input type="email" name="email">@<input type="email" name="email">
                 <select name="cc">
                 <option value="직접입력">직접입력</option>
                 <option value="naver.com">naver.com</option>
                 <option value="gmail.com">gmail.com</option>
                 <option value="daum.net">daum.net</option>
                 </select></td>
            </tr>
            <tr>
            <td style="text-align:center;">휴대폰</td>
            <td><select name="phonenumber">
                 <option value="010">010</option>
                 <option value="042">042</option>
                 <option value="02">02</option>
                 </select>
                - <input type="text" name="dd" size="4"> - <input type="text" name="ee" size="4"></td>
            </tr>
            <tr>
            <td style="text-align:center;">관심분야</td>
            <td><input type="checkbox" name="ff" value="IT/개발">IT/개발
                <input type="checkbox" name="ff" value="자격증/취업">자격증/취업
                <input type="checkbox" name="ff" value="건강/의학">건강/의학
                <input type="checkbox" name="ff" value="취미">취미
                <input type="checkbox" name="ff" value="기타">기타<br><br>
                <textarea name="ff" placeholder="관심분야를 입력하세요" rows="10" cols="90"></textarea></td>
            </tr>
            </table>
            <div style="text-align:center; margin-top:10px;">     
                   <button type="submit" value="회원정보수정">회원정보수정</button>
                   <button type="reset" value="취소">취소</button>
            </div>     
         </fieldset>
         
      </form>
  </section>
</div>
</body>
</html>