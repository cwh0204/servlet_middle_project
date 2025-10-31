$(document).ready(function() {
	const writer = sessionStorage.getItem('userId');

	if (!writer) {
		$('.write-post-btn').on('click', function(e) {
			e.preventDefault();
			if (!writer) {
				alert("로그인을 해야 이용할 수 있는 서비스입니다.");
				location.reload();
			}
		});
	}
});