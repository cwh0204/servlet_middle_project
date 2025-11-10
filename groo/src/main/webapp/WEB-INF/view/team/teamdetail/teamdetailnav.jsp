<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="jquery/jquery-3.7.1.min.js"></script>
<script src="js/team/teamNav/teamdetailNav.js"></script>
<link href="css/team/teamnav.css" rel="stylesheet">
<link href="css/base.css" rel="stylesheet">
<title>게시판</title>
</head>
<body>
	<aside class="sidebar">
		<div class="sidebar-header">팀 관련 목록</div>

		<div class="menu-item active" data-page="teamdetailhome.do">
			<!-- 선택한 팀의 아이디를 받아와야함 -->
			<div class="menu-item-content">
				<span>팀 상세보기</span>
			</div>
		</div>

		<div class="menu-item" data-page="teamdetailmemlist.do">
			<!-- 선택한 팀의 아이디를 받아와야함 -->
			<div class="menu-item-content">
				<span>팀 인원</span>
			</div>
		</div>

		<div class="menu-item" data-page="teamvote.do">
			<div class="menu-item-content">
				<span>팀 투표</span>
			</div>
		</div>

		<div class="menu-item" data-page="teamschedule.do">
			<div class="menu-item-content">
				<span>팀 일정</span>
			</div>
		</div>

		<div class="menu-item" data-page="teamboard.do">
			<!-- 선택한 팀의 아이디를 받아와야함 -->
			<div class="menu-item-content">
				<span>팀 게시판</span>
			</div>
		</div>

	</aside>
	
<script>
/**
 * 현재 사용자가 특정 팀의 멤버인지 서버를 통해 확인합니다.
 * @param {string} studyId - 검사할 팀 ID
 * @param {string} memLoginId - 로그인된 사용자 ID
 * @returns {Promise<boolean>} - 멤버이면 true, 아니면 false를 반환하는 Promise
 */
 
const checkTeamMember = (studyId, memLoginId) => {
	return new Promise((resolve) => {
		// 서버의 팀 멤버 확인 URL
		$.ajax({
			url: '',
			type: 'POST',
			data: {
				studyId: studyId,
				memLoginId: memLoginId
			},
			success: function(response){
				// response.studyRoll이 null이 아니거나 'L' 또는 'M'일때 true
				const isMember = response && (response.studyRoll === 'L' || response.studyRoll === 'M');
				resolve(isMember);
			},
			error: function(){
				// AJAX 오류시 일단 멤버가 아닌 것으로 처리
				console.error("스터디 멤버 확인 실패");
				resolve(false);
			}
		});
	});
}; 

//메뉴 클릭 이벤트에 로직 적용

$(document).ready(function(){
	const studyId = sessionStorage.getItem('teamId');
	const memLoginId = sessionStorage.getItem('userId');
	const $menuItems = $('.menu-item');
	
	// 로그인 ID가 없으면 비회원 처리
	if(!memLoginId) {
		// 비회원이 클릭했을 때 
		$menuItems.on('click', function(e){
			const targetPage = $(this).data('page');
			
			// 팀 상세보기를 제외한 모든 메뉴 접근 차단
			if(targetPage !== teamdetailhome.do){
				e.preventDefault();
				alert('로그인 후 이용 가능한 메뉴입니다.');
				window.location.href = 'teamdetailhome.do?studyId='+studyId;
			}
		});
		return;
	}
	
	// 로그인된 회원이 클릭했을 때 
	$menuItems.on('click', function(){
		const targetPage = $(this).data('page');
		
		// 팀 상세보기는 항상 접근 가능
		if(targetPage === 'teamdetailhome.do'){
			return;
		}
		
		// 팀 상세보기가 아닌 다른 메뉴는 접근 전에 멤버 체크
		e.preventDefault();
		
		try {
			const isMember = await checkTeamMember(studyId, memLoginId);
			
			if(!isMember){
				alert('해당 팀의 멤버만 접근 가능한 메뉴입니다.');
				window.location.href = 'teamdetailhome.do?studyId='+studyId;
			}else {
				// 멤버가 맞으면 페이지 이동
				window.location.href = targetPage+'?studyId='+studyId;
			}
		}catch (error) {
			console.error("권한 체크 중 오류 발생:", error);
			alert('권한 확인 중 오류가 발생했습니다. 다시 시도해주세요.');
		}
	});
});
</script>	

</body>
</html>