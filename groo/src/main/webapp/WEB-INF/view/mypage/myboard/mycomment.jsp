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
                    <th>좋아요한 게시글 내용</th>
                    <th>원문 링크</th>
                    <th>좋아요 누른 날짜</th>
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
	
    // 1. memLoginId 유효성 체크 및 Ajax 실행 중지
    if (!memLoginId || memLoginId.trim() === "" || memLoginId === "null") {
        $("#likeData").html('<tr><td colspan="4">로그인 정보(userId)를 찾을 수 없습니다.</td></tr>');
        console.error("❌ sessionStorage에 userId가 없습니다.");
        return; 
    }
    
	$.ajax({
        // URL은 '/groo/myLikeList.do'로 유지
        url: '/groo/myLikeList.do', 
        dataType: 'json',
        type: 'POST', 

        data: {
            memLoginId: memLoginId
        },
        
        success: function(response) {
            const $tbody = $("#likeData");
            $tbody.empty(); 

            if (response && response.length > 0) {
                
                $.each(response, function(index, item) {
                    
                    const $tr = $("<tr>");
                    $tr.append($("<td>").text(index + 1));

                    // 게시글 내용
                    // 내용이 길 경우를 대비해 텍스트 오버플로우 처리가 필요할 수 있습니다 (CSS에서 처리)
                    $tr.append($("<td>").text(item.postContent)); 

                    // 원문 링크
                    const $link = $("<a>")
                                    .attr("href", "postdetail.do?id=" + item.boardId) 
                                    .text("원문 보기"); 

                    $tr.append($("<td>").append($link));

                    // 💡 좋아요 누른 날짜 필드 적용 (LikedDTO에 likeDate 필드가 있어야 함)
                    // item.likeDate가 있다면 그 값을 사용하고, 없다면 '날짜 정보 없음'을 표시
                    const likeDate = item.likeDate ? item.likeDate : "날짜 정보 없음";
                    $tr.append($("<td>").text(likeDate)); 

                    $tbody.append($tr);
                });

            } else {
                // 데이터가 없는 경우
                $tbody.append('<tr><td colspan="4">좋아요한 게시글이 없습니다.</td></tr>');
            }
        },
        error: function(xhr, status, error) {
            console.error("AJAX Error: ", status, error);
            $("#likeData").html('<tr><td colspan="4">좋아요 목록을 불러오는 중 오류가 발생했습니다.</td></tr>');
        }
	});
});
</script>

</html>