<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 좋아요 목록</title>
<link href='css/mypage/mylike/mylike.css' rel='stylesheet' />
</head>
<body>
	<div class="container">
		<h2>나의 좋아요 목록</h2>

		<table class="like-list-table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>원문 링크</th>
				</tr>
			</thead>
			<tbody id="likeData">
				<tr>
					<td colspan="4">좋아요 목록을 불러오는 중입니다...</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function() {
    // sessionStorage에서 ID 가져오기
    var memLoginId = sessionStorage.getItem('userId');
    const $tbody = $("#likeData");

    // 1. memLoginId 유효성 체크 및 Ajax 실행 중지
    if (!memLoginId || memLoginId.trim() === "" || memLoginId === "null") {
        $tbody.html('<tr><td colspan="4">로그인 정보(userId)를 찾을 수 없습니다.</td></tr>');
        console.error("❌ sessionStorage에 userId가 없습니다.");
        return; 
    }
    
    $.ajax({
        url: '/groo/mylikecontroller.do', 
        dataType: 'json',
        type: 'POST', 
        data: {
            memLoginId: memLoginId
        },
        
        success: function(response) {
            $tbody.empty(); // 기존 '로딩 중' 메시지 제거

            if (response && response.length > 0) {
                
                // 좋아요 목록 (게시글 정보 + 좋아요 날짜 포함 가정) 바인딩
                $.each(response, function(index, item) {
                    
                    const $tr = $("<tr>");
                    $tr.append($("<td>").text(index + 1)); // 번호

                    // 🚨 제목 필드 가정: BoardDTO에 postTitle 또는 boardTitle 필드가 있어야 함
                    const title = item.postTitle || item.boardTitle || item.postContent.substring(0, 20) + '...';
                    $tr.append($("<td>").text(title)); // 제목 (필드명 확인 필요)
                    
                    // 원문 링크 (원문 링크는 boardId 사용)
                    const $link = $("<a>")
                                    .attr("href", "postdetail.do?id=" + item.boardId) 
                                    .text("원문 보기"); 
                    $tr.append($("<td>").append($link));

                    $tbody.append($tr);
                });

            } else {
                // 데이터가 없는 경우
                $tbody.append('<tr><td colspan="4">좋아요한 게시글이 없습니다.</td></tr>');
            }
        },
        error: function(xhr, status, error) {
            // 통신 오류 발생 시
            console.error("AJAX Error:", status, error);
            $tbody.html('<tr><td colspan="4">좋아요 목록을 불러오는 중 오류가 발생했습니다.</td></tr>');
        }
    });
});
</script>
</html>