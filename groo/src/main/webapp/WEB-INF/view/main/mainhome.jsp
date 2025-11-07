<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link href="css/team/myteam/myteamhome.css" rel="stylesheet">

<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div class="container">
		<div class="header">
			<h1 class="title">스터디</h1>
			<p class="subtitle">Groo 스터디를 확인해보세요</p>
		</div>

		<div class="card-grid" id="cardGrid"></div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		var memLoginId = sessionStorage.getItem('userId');
		console.log(memLoginId);
		grooteam();
		$('#cardGrid').on('click', '.btn-detail', function() {
			const studyId = $(this).data('studyId');
			if (studyId) {
				window.location.href = 'teamdetail.do?studyId=' + studyId;
			} else {
				console.error("❌ 오류: studyId를 가져올 수 없습니다.");
			}
		});
	});
</script>
</html>

