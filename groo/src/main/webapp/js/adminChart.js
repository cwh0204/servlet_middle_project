// 이 함수는 AJAX 로딩 완료 후, 메인 페이지의 콜백에서 window.chartColl() 형태로 호출되어야 합니다.
// 중복 선언 방지를 위해 window 객체에 직접 함수를 할당합니다.

window.chartColl = function() {

	// 💡 1. 이전 차트 인스턴스 파괴 (캔버스 재사용 오류 해결)
	// 이 로직이 다른 페이지로 이동했다가 돌아올 때 Canvas가 이미 사용 중이라는 오류를 막습니다.
	if (window.activeCharts) {
		for (let key in window.activeCharts) {
			const chart = window.activeCharts[key];
			if (chart instanceof Chart) {
				chart.destroy();
			}
		}
	}
	// 차트 저장소를 초기화하거나 재정의합니다.
	window.activeCharts = {};

	// =========================================================
	// 2. 데이터 및 설정 정의 (이 부분은 유지)
	// =========================================================
	const data = {
		labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월',
			'11월', '12월'],
		datasets: [{
			label: '월별 가입자수',
			backgroundColor: 'rgba(75, 192, 192, 0.5)',
			borderColor: 'rgba(75, 192, 192, 1)',
			borderWidth: 1,
			data: [12, 19, 3, 5, 2, 3, 15, 8, 5, 3, 9, 3],
		}]
	};
	const config = {
		type: 'bar',
		data: data,
		options: {
			responsive: true,
			maintainAspectRatio: false,
			plugins: {
				legend: {
					position: 'top',
				},
				title: {
					display: true,
					text: '월별 가입자수'
				}
			}
		},
	};
	// =========================================================

	// 3. 차트 생성 및 저장

	// 캔버스 요소를 찾고, 존재할 경우에만 차트를 생성합니다. (jQuery 사용)
	const $lineChart = $('#lineChart');
	if ($lineChart.length) {
		const ctx = $lineChart[0].getContext('2d');
		// 생성된 차트 인스턴스를 전역 저장소에 저장
		window.activeCharts.line = new Chart(ctx, config);
	}
};

// 💡 참고: AJAX 로드 시 실행될 필요가 없으므로 이 파일에서는 chartColl()을 바로 호출하지 않습니다.
// 메인 페이지의 $(document).ready와 AJAX 콜백에서만 호출됩니다.
