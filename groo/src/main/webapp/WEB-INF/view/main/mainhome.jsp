<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/main/main.css">
</head>
<body>
	<%@ include file="search.jsp"%>

	<h1 sytle="min-width:1200px">🔥 핫스터디 목록</h1>
	
	<div class="hot-study-list">
		<div class="hot-study-card" data-hot-study-id="1">
			<img src="images/hotstudy1.png" alt="핫스터디 리액트 이미지"
				class="hot-study-image">
			<div class="hot-study-tags">
				<span class="hot-study-tag">#프론트엔드</span> <span
					class="hot-study-tag">#온라인</span> <span class="hot-study-tag">#주2회</span>
			</div>
			<h3>리액트(React) 완벽 가이드 핫스터디</h3>
			<p class="hot-study-description">Hooks, Redux를 활용한 실전 프로젝트 중심의 웹
				개발 핫스터디입니다.</p>
			<div class="hot-study-info">
				<p>
					<strong>지역:</strong> 온라인 (Zoom)
				</p>
				<p>
					<strong>모집 인원:</strong> 4/6명
				</p>
				<p>
					<strong>기간:</strong> 8주 과정
				</p>
			</div>
			<div class="hot-study-progress">✅ 모집 중! 마감 임박</div>
			<a href="#" class="hot-study-link">자세히 보기</a>
		</div>

		<div class="hot-study-card" data-hot-study-id="2">
			<img src="images/hotstudy2.png" alt="핫스터디 스프링 부트 이미지"
				class="hot-study-image">
			<div class="hot-study-tags">
				<span class="hot-study-tag">#백엔드</span> <span class="hot-study-tag">#오프라인</span>
				<span class="hot-study-tag">#평일저녁</span>
			</div>
			<h3>Spring Boot로 배우는 API 서버 구축</h3>
			<p class="hot-study-description">기초부터 실무까지, REST API 설계 및 구현을 위한
				백엔드 핫스터디입니다.</p>
			<div class="hot-study-info">
				<p>
					<strong>지역:</strong> 서울 강남
				</p>
				<p>
					<strong>모집 인원:</strong> 5/5명
				</p>
				<p>
					<strong>기간:</strong> 6주 과정
				</p>
			</div>
			<div class="hot-study-progress" style="color: #F44336;">❌ 마감
				완료! 다음 기수 대기</div>
			<a href="#" class="hot-study-link">자세히 보기</a>
		</div>

		<div class="hot-study-card" data-hot-study-id="3">
			<img src="images/hotstudy3.png" alt="핫스터디 영어 회화 이미지"
				class="hot-study-image">
			<div class="hot-study-tags">
				<span class="hot-study-tag">#외국어</span> <span class="hot-study-tag">#영어회화</span>
				<span class="hot-study-tag">#주말</span>
			</div>
			<h3>원어민과 함께하는 자유 회화 핫스터디</h3>
			<p class="hot-study-description">다양한 주제로 자유롭게 토론하며 실전 영어 감각을
				키웁니다.</p>
			<div class="hot-study-info">
				<p>
					<strong>지역:</strong> 온라인 (Discord)
				</p>
				<p>
					<strong>모집 인원:</strong> 2/8명
				</p>
				<p>
					<strong>기간:</strong> 상시 모집
				</p>
			</div>
			<div class="hot-study-progress">✅ 모집 중!</div>
			<a href="#" class="hot-study-link">자세히 보기</a>
		</div>

		<div class="hot-study-card" data-hot-study-id="4">
			<img src="images/hotstudy4.png" alt="핫스터디 데이터 분석 이미지"
				class="hot-study-image">
			<div class="hot-study-tags">
				<span class="hot-study-tag">#자격증</span> <span class="hot-study-tag">#데이터분석</span>
				<span class="hot-study-tag">#파이썬</span>
			</div>
			<h3>ADP 실기 대비 문제풀이 핫스터디</h3>
			<p class="hot-study-description">데이터 분석 전문가(ADP) 자격증 실기 기출문제 풀이 및
				해설 핫스터디입니다.</p>
			<div class="hot-study-info">
				<p>
					<strong>지역:</strong> 오프라인 (부산)
				</p>
				<p>
					<strong>모집 인원:</strong> 3/5명
				</p>
				<p>
					<strong>기간:</strong> 5주 단기
				</p>
			</div>
			<div class="hot-study-progress">✅ 모집 중! 늦기 전에 신청하세요</div>
			<a href="#" class="hot-study-link">자세히 보기</a>
		</div>

		<div class="hot-study-card" data-hot-study-id="5">
			<img src="images/hotstudy5.png" alt="핫스터디 UX/UI 디자인 이미지"
				class="hot-study-image">
			<div class="hot-study-tags">
				<span class="hot-study-tag">#디자인</span> <span class="hot-study-tag">#UX/UI</span>
				<span class="hot-study-tag">#포트폴리오</span>
			</div>
			<h3>Figma를 활용한 UX/UI 포트폴리오 제작</h3>
			<p class="hot-study-description">실제 프로젝트를 가상으로 진행하며 개인 포트폴리오를
				완성하는 핫스터디입니다.</p>
			<div class="hot-study-info">
				<p>
					<strong>지역:</strong> 온라인
				</p>
				<p>
					<strong>모집 인원:</strong> 1/4명
				</p>
				<p>
					<strong>기간:</strong> 10주
				</p>
			</div>
			<div class="hot-study-progress">✅ 자리 여유 있음! 부담 없이 신청하세요</div>
			<a href="#" class="hot-study-link">자세히 보기</a>
		</div>
	</div>

</body>
</html>