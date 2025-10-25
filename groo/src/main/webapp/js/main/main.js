$(document).ready(function() {
	mainHome();
	mainHeder();
	refreshPage();
	
	// 네이버 소셜로그인 확인용
	const naverServiceResponse = '${sessionScope.naverServiceResponse}';
	if (naverServiceResponse !== '' && naverServiceResponse !== 'null') {
		const responseObject = JSON.parse(naverServiceResponse);
		console.log(responseObject); //소셜로그인 테스트용	
	}

	// 깃허브 소셜로그인 확인용
	const gitHubServiceResponse = '${sessionScope.gitHubServiceResponse}';
	if (gitHubServiceResponse !== '' && gitHubServiceResponse !== 'null') {
		const responseObject = JSON.parse(gitHubServiceResponse);
		console.log(responseObject); //소셜로그인 테스트용	
	}

	//카카오 소셜로그인 확인용
	const kakaoServiceResponse = '${sessionScope.kakaoServiceResponse}';
	if (kakaoServiceResponse !== '' && kakaoServiceResponse !== 'null') {
		const responseObject = JSON.parse(kakaoServiceResponse);
		console.log(responseObject); //소셜로그인 테스트용
	}
});