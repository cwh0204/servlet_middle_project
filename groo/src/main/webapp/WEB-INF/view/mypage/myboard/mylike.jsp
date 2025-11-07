<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					<th>내용</th>
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
var memLoginId = sessionStorage.getItem('userId');
$.ajax({
    // 🚨 URL은 Context Root 동적 설정이 안전하지만, 문법 오류는 아님.
    url: '/groo/mylikecontroller.do', 
    dataType: 'json',
    type: 'POST', 

    data: {
        memLoginId: memLoginId
    },
    
    success: function(response) {
    	console.log("통신성공");
       console.log(response);
    }
});

</script>
</html>