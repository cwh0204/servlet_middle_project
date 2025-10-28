<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/base.css" rel="stylesheet">
<link href="css/board/boardtable.css" rel="stylesheet">
</head>
<body>
	<%@ include file="freesearch.jsp"%>
	<table class="table table-hover">
		<thead class="table-light">
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">게시자</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
				<th scope="col">댓글</th>
				<th scope="col">좋아요</th>
			</tr>
		</thead>
		<tbody id="#boardDataBody">
			<tr class="table-success">
				<th scope="row">필독</th>
				<td><a href="noticedetail.do?id=NOTICE_0"><strong>[긴급]</strong>
						개인정보 보호를 위한 비밀번호 변경 권고</a></td>
				<td>관리자</td>
				<td>2025.10.22</td>
				<td>2,500</td>
				<td>15</td>
				<td>32</td>
			</tr>
			<tr>
				<th scope="row">10</th>
				<td><a href="noticedetail.do?id=${number}">101010</a></td>
				<td>김00</td>
				<td>2025.10.15</td>
				<td>870</td>
				<td>5</td>
				<td>18</td>
			</tr>
			<tr>
				<th scope="row">9</th>
				<td><a href="noticedetail.do?id=9">999</a></td>
				<td>이00</td>
				<td>2025.10.10</td>
				<td>1,120</td>
				<td>12</td>
				<td>55</td>
			</tr>
			<tr>
				<th scope="row">8</th>
				<td><a href="noticedetail.do?id=8">888</a></td>
				<td>박00</td>
				<td>2025.10.05</td>
				<td>450</td>
				<td>3</td>
				<td>10</td>
			</tr>
			<tr>
				<th scope="row">7</th>
				<td><a href="noticedetail.do?id=7">777</a></td>
				<td>최00</td>
				<td>2025.09.28</td>
				<td>620</td>
				<td>8</td>
				<td>22</td>
			</tr>
			<tr>
				<th scope="row">6</th>
				<td><a href="noticedetail.do?id=6">666</a></td>
				<td>정00</td>
				<td>2025.09.28</td>
				<td>620</td>
				<td>0</td>
				<td>1</td>
			</tr>
			<tr>
				<th scope="row">5</th>
				<td><a href="noticedetail.do?id=5">555</a></td>
				<td>윤00</td>
				<td>2025.09.28</td>
				<td>620</td>
				<td>1</td>
				<td>3</td>
			</tr>
			<tr>
				<th scope="row">4</th>
				<td><a href="noticedetail.do?id=4">444</a></td>
				<td>장00</td>
				<td>2025.09.28</td>
				<td>620</td>
				<td>4</td>
				<td>14</td>
			</tr>
			<tr>
				<th scope="row">3</th>
				<td><a href="noticedetail.do?id=3">333</a></td>
				<td>신00</td>
				<td>2025.09.28</td>
				<td>620</td>
				<td>7</td>
				<td>25</td>
			</tr>
			<tr>
				<th scope="row">2</th>
				<td><a href="noticedetail.do?id=2">222</a></td>
				<td>임00</td>
				<td>2025.09.28</td>
				<td>620</td>
				<td>2</td>
				<td>8</td>
			</tr>
			<tr>
				<th scope="row">1</th>
				<td><a href="noticedetail.do?id=1">111</a></td>
				<td>고00</td>
				<td>2025.09.28</td>
				<td>620</td>
				<td>1</td>
				<td>4</td>
			</tr>
		</tbody>
	</table>
	<c:set var="boardType" value="free" scope="request" />
	<jsp:include page="../writebtn.jsp" />
</body>
<script type="text/javascript">
$.ajax({
    // 필수 설정
    url: 'boardselect.do', 
    type: 'POST',
    dataType: 'json', // JSON 파싱을 명시합니다.
    data: {
        // 서버에 전달할 데이터
    },
    
    success: function(response) {
        
        console.log("=====================================");
        console.log("✅ Ajax 통신 성공");
        console.log("=====================================");
        
        // 1. 응답 값의 타입 및 배열 여부 확인
        console.log("1. response 타입:", typeof response);
        console.log("2. response가 배열인가?:", Array.isArray(response));
        
        // 2. 유효성 검사 및 데이터 출력
        if (Array.isArray(response) && response.length > 0) {
        
        console.log("총 게시글 개수:", response.length + "개");
        console.log("--- 모든 게시글 정보 상세 출력 ---");
        
        // for...of 루프를 사용하여 모든 boardItem의 상세 정보를 출력합니다.
        let index = 0;
        for (const boardItem of response) {
            index++;
            
            console.log(`\n--- [${index}번째 게시글] ---`);
            console.log(`ID (boardId): ${boardItem.boardId}`);
            console.log(`제목 (postTitle): ${boardItem.postTitle}`);
            console.log(`조회수 (postViews): ${boardItem.postViews}`);
            console.log(`댓글 수 (comentCount): ${boardItem.comentCount}`);
            
            // 💡 주의: JSON에 없는 필드(writer, writeDate 등)는 출력하지 않습니다.
            
            // response 객체 전체를 한 번 더 출력하여 숨겨진 속성이 없는지 확인합니다.
            console.log("전체 객체 (추가 필드 확인용):", boardItem); 
        }
        console.log("------------------------------------------");

    }
                
    },
    
    error: function(xhr, status, error) {
        console.error("=====================================");
        console.error("❌ Ajax 통신 실패");
        console.error("=====================================");
        console.error("상태:", status, "오류:", error);
        console.error("HTTP 상태 코드:", xhr.status);
    }
});
</script>

</html>
