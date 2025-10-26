<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/main/main.css">
<script src="js/main/main.js"></script>
</head>
<body>
	<%@ include file="search.jsp"%>

	<div class="hot-study-slider-area">
		<a href="study_list.jsp" class="view-more-link">더 많은 스터디 보러가기 ></a>
		<h1>🔥 핫스터디</h1>
		<div class="hot-study-slider-area">
			<div class="hot-study-list">
				<div class="slide-container">

					<div class="slide-item">
						<div class="hot-study-card" data-hot-study-id="1"
							data-link-url="detail.jsp?id=1">
							<img src="images/hotstudy1.png" alt="핫스터디 리액트 이미지"
								class="hot-study-image">
							<div class="hot-study-tags">
								<span class="hot-study-tag">#프론트엔드</span> <span
									class="hot-study-tag">#온라인</span> <span class="hot-study-tag">#주2회</span>
							</div>
							<h3>리액트(React) 완벽 가이드</h3>
							<p class="hot-study-description">Hooks, Redux를 활용한 실전 프로젝트
								중심.</p>
							<div class="hot-study-info">
								<p>
									<strong>지역:</strong> 온라인 (Zoom)
								</p>
								<p>
									<strong>모집 인원:</strong> 4/6명
								</p>
							</div>
							<div class="hot-study-progress">
								<span class="hot-study-status">✅ 모집 중!</span> <span
									class="hot-study-likes-count">♥ 24</span>
							</div>
						</div>

						<div class="hot-study-card" data-hot-study-id="2"
							data-link-url="detail.jsp?id=2">
							<img src="images/hotstudy2.png" alt="핫스터디 스프링 부트 이미지"
								class="hot-study-image">
							<div class="hot-study-tags">
								<span class="hot-study-tag">#백엔드</span> <span
									class="hot-study-tag">#오프라인</span> <span class="hot-study-tag">#평일저녁</span>
							</div>
							<h3>Spring Boot로 API 서버 구축</h3>
							<p class="hot-study-description">REST API 설계 및 구현을 위한 백엔드
								스터디.</p>
							<div class="hot-study-info">
								<p>
									<strong>지역:</strong> 서울 강남
								</p>
								<p>
									<strong>모집 인원:</strong> 5/5명
								</p>
							</div>
							<div class="hot-study-progress">
								<span class="hot-study-status" style="color: #F44336;">❌
									마감 완료!</span> <span class="hot-study-likes-count">♥ 15</span>
							</div>
						</div>

						<div class="hot-study-card" data-hot-study-id="3"
							data-link-url="detail.jsp?id=3">
							<img src="images/hotstudy3.png" alt="핫스터디 영어 회화 이미지"
								class="hot-study-image">
							<div class="hot-study-tags">
								<span class="hot-study-tag">#외국어</span> <span
									class="hot-study-tag">#영어회화</span> <span class="hot-study-tag">#주말</span>
							</div>
							<h3>원어민과 함께하는 자유 회화</h3>
							<p class="hot-study-description">다양한 주제로 자유롭게 토론하며 실전 영어 감각
								키우기.</p>
							<div class="hot-study-info">
								<p>
									<strong>지역:</strong> 온라인
								</p>
								<p>
									<strong>모집 인원:</strong> 2/8명
								</p>
							</div>
							<div class="hot-study-progress">
								<span class="hot-study-status">✅ 모집 중!</span> <span
									class="hot-study-likes-count">♥ 31</span>
							</div>
						</div>
					</div>

					<div class="slide-item">
						<div class="hot-study-card" data-hot-study-id="4"
							data-link-url="detail.jsp?id=4">
							<img src="images/hotstudy4.png" alt="핫스터디 데이터 분석 이미지"
								class="hot-study-image">
							<div class="hot-study-tags">
								<span class="hot-study-tag">#자격증</span> <span
									class="hot-study-tag">#데이터분석</span> <span class="hot-study-tag">#파이썬</span>
							</div>
							<h3>ADP 실기 대비 문제풀이</h3>
							<p class="hot-study-description">데이터 분석 전문가(ADP) 실기 기출문제 풀이
								스터디.</p>
							<div class="hot-study-info">
								<p>
									<strong>지역:</strong> 오프라인 (부산)
								</p>
								<p>
									<strong>모집 인원:</strong> 3/5명
								</p>
							</div>
							<div class="hot-study-progress">
								<span class="hot-study-status">✅ 모집 중!</span> <span
									class="hot-study-likes-count">♥ 18</span>
							</div>
						</div>

						<div class="hot-study-card" data-hot-study-id="5"
							data-link-url="detail.jsp?id=5">
							<img src="images/hotstudy5.png" alt="핫스터디 UX/UI 디자인 이미지"
								class="hot-study-image">
							<div class="hot-study-tags">
								<span class="hot-study-tag">#디자인</span> <span
									class="hot-study-tag">#UX/UI</span> <span class="hot-study-tag">#포트폴리오</span>
							</div>
							<h3>Figma 활용 UX/UI 포트폴리오 제작</h3>
							<p class="hot-study-description">실제 프로젝트를 가상으로 진행하며 포트폴리오 완성.</p>
							<div class="hot-study-info">
								<p>
									<strong>지역:</strong> 온라인
								</p>
								<p>
									<strong>모집 인원:</strong> 1/4명
								</p>
							</div>
							<div class="hot-study-progress">
								<span class="hot-study-status">✅ 자리 여유 있음!</span> <span
									class="hot-study-likes-count">♥ 5</span>
							</div>
						</div>

						<div class="hot-study-card" data-hot-study-id="6"
							data-link-url="detail.jsp?id=6">
							<img src="images/hotstudy1.png" alt="핫스터디 알고리즘 이미지"
								class="hot-study-image">
							<div class="hot-study-tags">
								<span class="hot-study-tag">#코딩테스트</span> <span
									class="hot-study-tag">#알고리즘</span> <span class="hot-study-tag">#평일저녁</span>
							</div>
							<h3>백준 문제 풀이 (Java/Python)</h3>
							<p class="hot-study-description">주요 기업 코딩 테스트 대비를 위한 주 3회
								알고리즘 스터디입니다.</p>
							<div class="hot-study-info">
								<p>
									<strong>지역:</strong> 온라인 (Gather Town)
								</p>
								<p>
									<strong>모집 인원:</strong> 6/8명
								</p>
							</div>
							<div class="hot-study-progress">
								<span class="hot-study-status">✅ 모집 중! 2자리 남음</span> <span
									class="hot-study-likes-count">♥ 42</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>