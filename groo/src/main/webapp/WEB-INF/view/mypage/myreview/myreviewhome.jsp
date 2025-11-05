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
	<div class="page-header">
		<h2>나의 리뷰</h2>
	</div>

	<div class="review-list-container">
		<div class="review-card" data-review-id="12346">
			<div class="card-header">
				<span class="user-id">스터디매니아</span> <span class="date">2025.10.30</span>
			</div>
			<div class="card-rating">
				<div class="stars" data-rating="5.0">
					<span class="star-filled">★★★★★</span> <span class="star-empty">☆☆☆☆☆</span>
				</div>
				<span class="rating-score">5.0점</span>
			</div>
			<div class="card-content">
				<p class="review-text">최고의 스터디입니다! 자료 공유도 활발하고, 팀원들의 열의가 대단해서 목표
					달성에 큰 도움이 되었습니다. 다음에도 참여하고 싶습니다.</p>
			</div>
			<div class="card-actions">
				<button class="action-btn edit-btn" onclick="editReview('12346')">수정</button>
				<button class="action-btn delete-btn"
					onclick="deleteReview('12346')">삭제</button>
			</div>
		</div>

		<div class="review-card" data-review-id="12347">
			<div class="card-header">
				<span class="user-id">프론트엔드꿈나무</span> <span class="date">2025.10.25</span>
			</div>
			<div class="card-rating">
				<div class="stars" data-rating="3.5">
					<span class="star-filled">★★★★★</span> <span class="star-empty">☆☆☆☆☆</span>
				</div>
				<span class="rating-score">3.5점</span>
			</div>
			<div class="card-content">
				<p class="review-text">전반적으로 좋았지만, 가끔 회의 시간이 지연되는 문제가 있었습니다. 콘텐츠
					자체는 유익했습니다.</p>
			</div>
			<div class="card-actions">
				<button class="action-btn edit-btn" onclick="editReview('12347')">수정</button>
				<button class="action-btn delete-btn"
					onclick="deleteReview('12347')">삭제</button>
			</div>
		</div>

		<div class="review-card" data-review-id="12348">
			<div class="card-header">
				<span class="user-id">Java짱</span> <span class="date">2025.10.20</span>
			</div>
			<div class="card-rating">
				<div class="stars" data-rating="4.0">
					<span class="star-filled">★★★★★</span> <span class="star-empty">☆☆☆☆☆</span>
				</div>
				<span class="rating-score">4.0점</span>
			</div>
			<div class="card-content">
				<p class="review-text">커리큘럼이 체계적이었고, 특히 코딩 테스트 준비에 도움이 많이 되었어요.
					기대했던 것보다 자료가 풍부했습니다.</p>
			</div>
			<div class="card-actions">
				<button class="action-btn edit-btn" onclick="editReview('12348')">수정</button>
				<button class="action-btn delete-btn"
					onclick="deleteReview('12348')">삭제</button>
			</div>
		</div>

		<div class="review-card" data-review-id="12349">
			<div class="card-header">
				<span class="user-id">신입개발자</span> <span class="date">2025.10.15</span>
			</div>
			<div class="card-rating">
				<div class="stars" data-rating="2.5">
					<span class="star-filled">★★★★★</span> <span class="star-empty">☆☆☆☆☆</span>
				</div>
				<span class="rating-score">2.5점</span>
			</div>
			<div class="card-content">
				<p class="review-text">난이도가 저에게는 조금 높았습니다. 초보자를 위한 보충 자료가 더
					제공되었으면 좋겠습니다.</p>
			</div>
			<div class="card-actions">
				<button class="action-btn edit-btn" onclick="editReview('12349')">수정</button>
				<button class="action-btn delete-btn"
					onclick="deleteReview('12349')">삭제</button>
			</div>
		</div>

		<div class="review-card" data-review-id="12350">
			<div class="card-header">
				<span class="user-id">알고리즘광</span> <span class="date">2025.10.10</span>
			</div>
			<div class="card-rating">
				<div class="stars" data-rating="5.0">
					<span class="star-filled">★★★★★</span> <span class="star-empty">☆☆☆☆☆</span>
				</div>
				<span class="rating-score">5.0점</span>
			</div>
			<div class="card-content">
				<p class="review-text">완벽한 스터디였습니다. 토론 분위기도 좋았고, 매주 진행된 모의 테스트가
					실력 향상에 직결되었습니다. 매우 만족합니다.</p>
			</div>
			<div class="card-actions">
				<button class="action-btn edit-btn" onclick="editReview('12350')">수정</button>
				<button class="action-btn delete-btn"
					onclick="deleteReview('12350')">삭제</button>
			</div>
		</div>

	</div>
</body>
</html>