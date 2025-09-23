<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시멘틱 태그를 이용한 레이아웃</title>
<style>
* { margin:0; padding:0; }

html, body {
    height: 100%;
    width: 100%;
    margin: 0;
    padding: 0;
}
body { min-width: 100px; }

header, section {
    box-sizing: border-box;
    border: 1px solid gray;
    margin: 1px; padding: 2px;
   
}

header {
    height: 70px;
    background-color: lightgreen;
}

section {
    height: 500px;
    width: 100%;
    background-color: white;
}
</style>
</head>
<body>
<header></header>
<section></section>
</body>
</html>
