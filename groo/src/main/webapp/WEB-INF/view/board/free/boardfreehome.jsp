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
		<tbody id="boardDataBody">

		</tbody>
	</table>
	<c:set var="boardType" value="free" scope="request" />
	<jsp:include page="../writebtn.jsp" />
</body>
<script type="text/javascript">

$.ajax({
    // 데이터를 전송할 서버 URL
    url: 'boardselect.do',
    // 전송 방식 (로그인/회원가입은 보통 POST 사용)
    type: 'POST',
    // 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
    data: {
    },
    // 데이터 전송 성공 시 실행
    success: function(response) {
       // response는 서버에서 돌려준 데이터입니다.
       const $tableBody = $('#boardDataBody');
       $tableBody.empty();
       console.log(response);
       response.forEach(item => {
        const writeDateOnly = item.postingDate ? item.postingDate.split(' ')[0] : '-';
        const $newRow = $('<tr>').addClass('table-hover'); // table-success 대신 table-hover 사용

        // 2. <th> 요소 (번호)를 생성하고 <tr>에 추가합니다.
        const $th = $('<th>').attr('scope', 'row').text(item.boardId);
        $newRow.append($th);

        // 3. <td> 요소 (제목)를 생성하고 <tr>에 추가합니다.
        const $a = $('<a>').attr('href', 'noticedetail.do?id=12').text(item.postTitle);
        const $tdTitle = $('<td>').append($a);
        $newRow.append($tdTitle);

        // 4. 나머지 <td> 요소들을 생성하고 <tr>에 추가합니다.
        $newRow.append($('<td>').text(item.memNick));
        $newRow.append($('<td>').text(writeDateOnly));
        $newRow.append($('<td>').text(item.postViews));
        $newRow.append($('<td>').text(item.comentCount));
        $newRow.append($('<td>').text('12'));

        // 5. 완성된 <tr>을 <tbody>에 추가합니다.
        $('#boardDataBody').append($newRow);
       });
    },
 
    // 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
    error: function(xhr, status, error) {
    }
 });
</script>

</html>
