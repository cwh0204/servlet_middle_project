<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 보기</title>
<link href="css/base.css" rel="stylesheet">
<link href="css/board/detail.css" rel="stylesheet">
</head>
<body>

    <div class="container">
        <h2 class="detail-title">${post.title}</h2> 
        
        <div class="post-info">
            <span class="writer">작성자: ${post.writer}</span>
            <span class="date">작성일: ${post.regDate}</span>
            <span class="views">조회수: ${post.views}</span>
        </div>
        
        <hr>
        
        <div class="post-content">
            <p>${post.content}</p> 
        </div>
        
        <hr>

        <div class="actions">
            <button class="btn btn-like">👍 좋아요 (${post.likes})</button>
            
            <a href="noticelist.do" class="btn btn-list">목록으로</a> 
            
            <%-- <c:if test="${sessionScope.userId == post.writerId}"> --%>
                <a href="noticeedit.do?id=${post.id}" class="btn btn-edit">수정</a>
                <button class="btn btn-delete" onclick="deletePost(${post.id})">삭제</button>
            <%-- </c:if> --%>
        </div>
        <%-- 
        <div class="comment-section">
            <h3>댓글 (${post.commentCount})</h3>
            <%@ include file="commentlist.jsp" %>
        </div> --%>
    </div>
</body>
</html>