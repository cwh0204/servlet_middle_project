<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 게시물 목록</title>
<script src="jquery/jquery-3.7.1.min.js"></script>
<link href='css/mypage/myboard/myboard.css' rel='stylesheet' />
</head>
<body>
	<div class="container">
		<h2>나의 게시물 목록</h2>

		<table class="board-table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>타입</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody id="boardData">
				<tr>
					<td colspan="4">게시물 목록을 불러오는 중입니다...</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function() {
    // sessionStorage에서 ID 가져오기
	var memLoginId = sessionStorage.getItem('userId');
	
    // 1. memLoginId 유효성 체크 및 Ajax 실행 중지
    if (!memLoginId || memLoginId.trim() === "" || memLoginId === "null") {
        $("#boardData").html('<tr><td colspan="4">로그인 정보(userId)를 찾을 수 없습니다.</td></tr>');
        console.error("❌ sessionStorage에 userId가 없습니다.");
        return; 
    }
    
	$.ajax({
        // 🚨 수정: JSP EL과 URL 연결 문법 오류 수정
        url: '<%= request.getContextPath() %>/myboardlist.do', 
        dataType: 'json',
        type: 'POST', // POST로 다시 변경 (이전 대화에서 POST로 요청했음)

        data: {
            memLoginId: memLoginId
        },
        
        success: function(response) {
            const $tbody = $("#boardData");
            $tbody.empty(); // 기존 로딩 메시지/데이터를 지웁니다.

            if (response && response.length > 0) {
                
                // 데이터 배열 반복 및 DOM 생성
                $.each(response, function(index, item) {
                    
                    // 1. 새로운 <tr> 요소를 생성합니다.
                    const $tr = $("<tr>");

                    // 2. 순번 (<td>)을 추가합니다.
                    $tr.append($("<td>").text(index + 1));

                    // 3. 제목 (<a>)을 포함하는 <td>를 생성하고 추가합니다.
                    const $link = $("<a>")
                                    .attr("href", "postdetail.do?id=" + item.boardId)
                                    .text(item.postTitle);

                    $tr.append($("<td>").append($link));

                    // 4. 게시판 타입 (<td>)을 추가합니다.
                    $tr.append($("<td>").text(item.boardTypeId));

                    // 5. 작성일 (<td>)을 추가합니다.
                    $tr.append($("<td>").text(item.postingDate));

                    // 6. 완성된 <tr>을 <tbody>에 추가합니다.
                    $tbody.append($tr);
                });
            } else {
                // 게시글이 없는 경우
                $tbody.append('<tr><td colspan="4">작성된 게시물이 없습니다.</td></tr>');
            }
        },

        error: function(xhr, status, error) {
            console.error("❌ 통신 실패:", status, error);
            // 통신 실패 시 사용자에게 알림
            $("#boardData").html('<tr><td colspan="4">게시물 목록을 불러오지 못했습니다. (서버 오류 확인 필요)</td></tr>');
        }
	});
});
</script>
</html>