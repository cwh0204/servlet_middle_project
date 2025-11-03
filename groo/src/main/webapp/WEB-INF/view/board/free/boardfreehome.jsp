<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	$(document).ready(function() {
		boardselect();
	});
</script>
</html>
