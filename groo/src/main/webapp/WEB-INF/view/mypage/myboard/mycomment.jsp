<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        // 🚨 URL은 Context Root 동적 설정이 안전하지만, 문법 오류는 아님.
        url: '/groo/mycommentList.do', 
        dataType: 'json',
        type: 'POST', 

        data: {
            memLoginId: memLoginId
        },
        
        success: function(response) {
            console.log("✅ 댓글 데이터 수신 성공:", response);

            // 1. tbody 요소를 ID로 선택합니다. (HTML에 id="replyData"가 있다고 가정)
            const $tbody = $("#replyData");
            $tbody.empty(); // 기존 내용을 지웁니다.

            if (response && response.length > 0) {
                
                // 2. 서버에서 받은 댓글 데이터(response)를 반복하며 행을 생성합니다.
                $.each(response, function(index, item) {
                    
                    // 🚨 주의: JSON 키와 DTO 필드명이 'comentId', 'comentContent' 등 소문자로 일치해야 합니다.
                    
                    // 1. 새로운 <tr> 요소를 생성합니다.
                    const $tr = $("<tr>");

                    // 2. 순번 (<td>)을 추가합니다.
                    $tr.append($("<td>").text(index + 1));

                    // 3. 댓글 내용 (<td>)을 추가합니다.
                    $tr.append($("<td>").text(item.comentContent));

                    // 4. 원문 링크 (<a>)를 포함하는 <td>를 생성하고 추가합니다.
                    // 링크는 해당 댓글이 달린 게시글(boardId)로 이동해야 합니다.
                    const $link = $("<a>")
                                    .attr("href", "postdetail.do?id=" + item.boardId) 
                                    .text("원문 보기"); // '원문 보기' 등의 텍스트 사용

                    $tr.append($("<td>").append($link));

                    // 5. 작성일 (<td>)을 추가합니다.
                    // item.comentDate를 사용합니다.
                    $tr.append($("<td>").text(item.comentDate));

                    // 6. 완성된 <tr>을 <tbody>에 추가합니다.
                    $tbody.append($tr);
                });

            } else {
                // 댓글이 없는 경우
                $tbody.append('<tr><td colspan="4">작성된 댓글이 없습니다.</td></tr>');
            }
        }
	});
});
</script>

</html>