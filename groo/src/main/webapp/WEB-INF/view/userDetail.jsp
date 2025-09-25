<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>
* { margin:0; padding:0; }

fieldset {
    background-color: yellow;
    padding: 50;
    border: 1px solid gray;
}

html, body {
    height: 100%;
    width: 100%;
    margin: 0;
    padding: 0;
}
body { min-width: 100px; }

#container{
    flex-direction: column;
    height:300px;
}

header, section {
    box-sizing: border-box;
    border: 1px solid gray;
    margin: 1px; padding: 1px;
   
}

header {
    height: 70px;
    background-color: lightgreen;
}

section {
    height: 600px;
    width: 100%;
    background-color: white;
}
</style>
</head>
<body>
<div id="container">
   <header>
      <h1>userDetail</h1>
   </header>
<div id="content">
   <section>
      <form>
         <fieldset>
            성 명 : <input type="text" name="irum" placeholder="이름을 입력하세요"><br><br>
            /*<br><hr color="gray"><br>*/
            성 별 : 
            <input type="radio" name="rr" value="남" id="t1"><label for="t1">남</label>
            <input type="radio" name="rr" value="여" id="t2"><label for="t2">여</label>
            이메일 : <input type="text" name="email" placeholder="이메일을 입력하세요"><br><br>
            휴대폰 :
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

</div>
</body>
</html>