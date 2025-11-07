<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 댓글 목록</title>
<link href='css/mypage/mycomment/mycomment.css' rel='stylesheet' />
</head>
<body>
	<div class="container">
		<h2>나의 댓글 목록</h2>

		<table class="reply-table">
			<thead>
				<tr>
					<th>번호</th>
					<th>댓글 내용</th>
					<th>원문 링크</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody id="replyData">
				<tr>
					<td colspan="4">댓글 목록을 불러오는 중입니다...</td>
				</tr>
			</tbody>
		</table>
	</div>

</body>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    // sessionStorage에서 ID 가져오기
	var memLoginId = sessionStorage.getItem('userId');
	
    // 1. memLoginId 유효성 체크 및 Ajax 실행 중지
    if (!memLoginId || memLoginId.trim() === "" || memLoginId === "null") {
        $("#replyData").html('<tr><td colspan="4">로그인 정보(userId)를 찾을 수 없습니다.</td></tr>');
        console.error("❌ sessionStorage에 userId가 없습니다.");
        return; 
    }
    
	$.ajax({
        // URL을 댓글 목록을 가져오는 곳으로 변경
        url: '/groo/mycommentList.do', 
        dataType: 'json',
        type: 'POST', 

        data: {
            memLoginId: memLoginId
        },
        
        success: function(response) {
        	console.log(response);
            const $tbody = $("#replyData");
            $tbody.empty(); 

            if (response && response.length > 0) {
                
                $.each(response, function(index, item) {
                    
                    const $tr = $("<tr>");
                    $tr.append($("<td>").text(index + 1));

                    // 💡 댓글 내용 필드 적용 (commentContent)
                    // (댓글 DTO에 commentContent 필드가 있어야 함)
                    const comentContent = item.comentContent ? item.comentContent : "내용 없음";
                    $tr.append($("<td>").text(comentContent)); 

                    // 원문 링크 (게시글 ID는 boardId 또는 postId라고 가정)
                    const boardId = item.boardId || item.postId; // DTO에 맞게 조정 필요
                    const $link = $("<a>")
                                    .attr("href", "postdetail.do?id=" + boardId) 
                                    .text("원문 보기"); 
                    $tr.append($("<td>").append($link));

                    // 💡 작성일 필드 적용 (commentDate)
                    const commentDate = item.comentDate ? item.comentDate : "날짜 정보 없음";
                    $tr.append($("<td>").text(commentDate)); 

                    $tbody.append($tr);
                });

            } else {
                // 데이터가 없는 경우
                $tbody.append('<tr><td colspan="4">작성한 댓글이 없습니다.</td></tr>');
            }
        },
        error: function(xhr, status, error) {
            console.error("AJAX Error: ", status, error);
            $("#replyData").html('<tr><td colspan="4">댓글 목록을 불러오는 중 오류가 발생했습니다.</td></tr>');
        }
	});
});
</script>

</html>