<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/main.css" rel="stylesheet">
<link href="css/base.css" rel="stylesheet">
<script src="jquery/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script
	src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
</head>

<script>
mainHome(); //로고 클릭시 홈으로
	/* HotStudy carousel 라이브러리 */
	$(document)
			.ready(
					function() {

						$.ajax({
							url : "MemberSelectImplAPI.do",
							type : "GET",
							dataType : "json",
							success : function(response) {
								console.log("로그인 정보 : ", response);

								// 💡 response.userName도 세션에 저장했다면 추가하여 사용하세요.
								if (response.userId != null) {
									const currentUserName = response.userName
											|| response.userId;
									$('.member-info p').text(
											currentUserName + '님 환영합니다.');
								} else {
									$('.member-info p').text('로그인 해주세요.');
								}
							},
							error : function(jqXHR, textStatus, errorThrown) {
								// alert("Ajax 실패!"); // 디버깅 완료 후 제거
								console.error("ID 로드 실패:", textStatus,
										errorThrown);
								$('.member-info p').text('정보 로딩에 실패했습니다.');
							}
						});

						// Slick Carousel 초기화
						$('#hot-studies-carousel').slick({
							arrows : false,
							draggable : true,
							swipe : true,
							slidesToShow : 4,
							slidesToScroll : 1,
							dots : false, // 번호 제거
							infinite : false,
							speed : 500,
						});

						// Masonry 초기화 (활동중인 스터디)
						/* 💡 수정된: 활동중인 스터디 (Masonry) 초기화 코드 */
						var activeGrid = document
								.querySelector('#active-studies-grid'); // ID 변경

						if (activeGrid) {
							setTimeout(function() {
								var msnry = new Masonry(activeGrid, {
									itemSelector : '.active-grid-item', // 아이템 클래스 변경
									columnWidth : '.active-grid-sizer', // 크기 요소 클래스 변경
									percentPosition : true,
									gutter : 0
								});
							}, 500);
						}
					});
</script>
<body>
	<%@ include file="../frontComponents/mainheader.jsp"%>
	<main>
		<%@ include file="./mainhome.jsp"%>
	</main>
</body>
</html>