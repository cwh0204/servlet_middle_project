<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 게시물 목록</title>
<link href='css/mypage/myboard/myboard.css' rel='stylesheet' />
</head>
<body>
	<div class="container">
		<h2>나의 게시물 목록</h2>

		<table class="board-table">
			<tbody>
				<tr>
					<td>1</td>
					<td><a href="boardDetail.do?postId=102">C++ 벡터 메모리 할당 관련
							질문드립니다.</a></td>
					<td>공부</td>
					<td>2025-11-05</td>
				</tr>
				<tr>
					<td>2</td>
					<td><a href="boardDetail.do?postId=103">MySQL 성능 튜닝 팁 공유
							(인덱스 최적화)</a></td>
					<td>공부</td>
					<td>2025-11-04</td>
				</tr>
				<tr>
					<td>3</td>
					<td><a href="boardDetail.do?postId=201">점심 메뉴 추천 받아요!</a></td>
					<td>자유</td>
					<td>2025-11-03</td>
				</tr>
				<tr>
					<td>4</td>
					<td><a href="boardDetail.do?postId=202">퇴근 후 코딩 국룰인가요?</a></td>
					<td>자유</td>
					<td>2025-10-30</td>
				</tr>
				<tr>
					<td>5</td>
					<td><a href="boardDetail.do?postId=203">맥북 vs 윈도우 개발 환경 추천</a>
					</td>
					<td>자유</td>
					<td>2025-10-25</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
<script type="text/javascript">
$.ajax({
    // 데이터를 요청할 서버 URL (여러분이 만든 서블릿의 매핑 주소)
    url: '', 
    type: 'GET', 
    data: {
        memNick: memNick 
    },
    dataType: 'json', 
    
    success: function(response) {
        console.log("✅ 게시글 조회 성공:", response);
        
        if (response.length > 0) {
            console.log(`첫 번째 게시글 제목: ${response[0].POST_TITLE}`); 
        } else {
            console.log("해당 닉네임으로 작성된 게시글이 없습니다.");
        }
    },
    
    error: function(xhr, status, error) {
        console.error("❌ Ajax 통신 실패:", status, error);
        alert("게시글을 불러오는 중 오류가 발생했습니다.");
    },
    
    complete: function() {
        console.log("Ajax 요청 완료.");
    }
});
}

</script>
</html>