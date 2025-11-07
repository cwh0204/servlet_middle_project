<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/board/boardtable.css" rel="stylesheet">
<link href="css/board/writebtn.css" rel="stylesheet">
<script src="jquery/jquery-3.7.1.min.js"></script>
<style type="text/css">
.teamLeaderdiv {
	display: none;
}
</style>
</head>
<body>
	<%@ include file="teamsearch.jsp"%>
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
				<th class="teamLeaderdiv" scope="col">게시하기</th>
			</tr>
		</thead>
		<tbody id="boardDataBody">

		</tbody>
	</table>
	<div class="d-flex justify-content-end">
		<a id="studyBoard" class="btn btn-primary write-post-btn"> 글쓰기 </a>
	</div>
</body>
<script type="text/javascript">

var studyId = sessionStorage.getItem('teamId');
var memLoginId = sessionStorage.getItem('userId');

var boardselect = () => {
	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'boardselect.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: {
			boardTypeId : studyId
		},
		// 데이터 전송 성공 시 실행
		success: function(response) {

			$('#boardDataBody').empty();

			// response는 서버에서 돌려준 데이터입니다.
			response.forEach(item => {
				
				console.log(item);
				
				const writeDateOnly = item.postingDate ? item.postingDate.split(' ')[0] : '-';
				const $newRow = $('<tr>').addClass('table-hover'); // table-success 대신 table-hover 사용

				// 2. <th> 요소 (번호)를 생성하고 <tr>에 추가합니다.
				const $th = $('<th>').attr('scope', 'row').text(item.boardId);
				$newRow.append($th);

				// 3. <td> 요소 (제목)를 생성하고 <tr>에 추가합니다.
				const $a = $('<a>').attr('href', 'postteamdetail.do?id=' + item.boardId).text(item.postTitle);
				const $tdTitle = $('<td>').append($a);
				$newRow.append($tdTitle);

				// 4. 나머지 <td> 요소들을 생성하고 <tr>에 추가합니다.
				$newRow.append($('<td>').text(item.memNick));
				$newRow.append($('<td>').text(writeDateOnly));
				const $tdViews = $('<td>').addClass('post-views-' + item.boardId).text(item.postViews);
				$newRow.append($tdViews);
				$newRow.append($('<td>').text(item.comentCount));
				$newRow.append($('<td>').text('12'));
				$newRow.append(
					    $('<td>').addClass('teamLeaderdiv').append(
					        $('<button>').text('게시하기').attr('data-boardId', item.boardId).addClass('btn btn-sm btn-primary team-board-post')
					    )
					);
				// 5. 완성된 <tr>을 <tbody>에 추가합니다.
				$('#boardDataBody').append($newRow);
				$('.teamLeaderdiv').hide();
				
				teamLeaderPost();
				
				$a.on('click', function(e) {
					// e.preventDefault(); // 페이지 이동을 막으려면 이 줄을 사용

					// 현재 DB에 저장된 조회수 값 (문자열)을 가져옵니다.
					let currentViews = parseInt($tdViews.text());

					// 1을 더하고 (DB에 반영된 것으로 가정)
					currentViews += 1;

					// 화면의 텍스트를 즉시 업데이트합니다.
					$tdViews.text(currentViews);

					// 참고: e.preventDefault()를 사용하지 않으면, 이 작업 후 바로 페이지 이동이 일어납니다.
				});
			});
		},
		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
		}
	});
}

teamLeaderPost = () => {
	
	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'teamleaderteampage.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: {
			studyId : studyId,
			memLoginId : memLoginId
		},
		// 데이터 전송 성공 시 실행
		success: function(response) {
			console.log(response);
			if(response.studyRoll == 'L'){
				$('.teamLeaderdiv').show();
			}
		},
		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
		}
	
	 });
}

teamRankPost = (boardId) => {
	
	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'boardrankinsert.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: {
			boardId : boardId
		},
		// 데이터 전송 성공 시 실행
		success: function(response) {
			console.log(response);
			alert("베스트 게시판 등록 성공!");
		},
		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
		}
	
	 });
}

$(document).ready(function() {
	boardselect();
	console.log(studyId);
	$('#studyBoard').on('click',function(){
		window.location.href = 'boardwrite.do?type=' + studyId;
	});
	
	$('#boardDataBody').on('click', '.team-board-post', function(){
        var boardId = $(this).attr('data-boardId'); 
        teamRankPost(boardId);
    });
	
 	teamLeaderPost();
});
</script>
</html>