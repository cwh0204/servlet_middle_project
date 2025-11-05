<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery/jquery-3.7.1.min.js"></script>
<script src="js/mypage/myreview/myreview.js"></script>
<link href='css/mypage/myreview/myreview.css' rel='stylesheet' />

</head>
<body>
	<div class="review-list-container">
    <div class="review-card" data-review-id="12345">
        <div class="card-header">
            <span class="user-id">사용자 ID</span> 
            <span class="date">2025.11.05</span>
        </div>

        <div class="card-rating">
            <div class="stars" data-rating="4.5">
                <span class="star-filled">★★★★★</span> 
                <span class="star-empty">☆☆☆☆☆</span>
            </div>
            <span class="rating-score">4.5점</span>
        </div>

        <div class="card-content">
            <p class="review-text">이 서비스/제품 정말 만족스럽습니다...</p>
        </div>
        
        <div class="card-actions">
            <button class="action-btn edit-btn" onclick="editReview('12345')">수정</button>
            <button class="action-btn delete-btn" onclick="deleteReview('12345')">삭제</button>
        </div>
    </div>
    </div>
</body>
</html>