<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="jquery/jquery-3.7.1.min.js"></script>
<script src="js/board/boardNav/boardNav.js"></script> 
<link href="css/board/boardnav.css" rel="stylesheet">
<title>게시판</title>
</head>
<body>
    <aside class="sidebar">
        
        <div class="menu-item active" data-page="boardnotice.do">
            <div class="menu-item-content">
                <span>공지사항</span>
            </div>
        </div>
        
        <div class="menu-item" data-page="boardfree.do">
            <div class="menu-item-content">
                <span>자유게시판</span>
            </div>
        </div>

        <div class="menu-item" data-page=""> 
            <div class="menu-item-content">
                <span>팀 게시판</span>
            </div>
            </div>

        <div class="menu-item" data-page="">
            <div class="menu-item-content">
                <span>성과게시판</span>
            </div>
        </div>
    </aside>
    </body>
</html>