<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<body>
<style>
* { margin:0; padding:0; }

fieldset {
    border-radius: 10px;
    background-color: white;
    padding: 50;
    height:490px;
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
    height: 500px;
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
            성 명 : <input type="text" name="irum" placeholder="이름을 입력하세요"><br><br>
            성 별 : 
            <input type="radio" name="rr" value="남" id="t1"><label for="t1">남</label>
            <input type="radio" name="rr" value="여" id="t2"><label for="t2">여</label><br><br>
            이메일 : <input type="text" name="email" placeholder="이메일을 입력하세요"><br><br>
            휴대폰 : <br><br>
            관심분야:
                   <input type="checkbox" name="cc" value="IT/개발">
                    <label for="test3">IT/개발</label> 
                    <input type="checkbox" name="cc" value="자격증">
                    <label for="test3">자격증</label> 
                    <input type="checkbox" name="cc" value="취미">
                    <label for="test3">취미</label> 
         </fieldset>
      </form>
  </section>
</div>

</body>
</html>