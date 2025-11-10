<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/adminChart.js"></script>
<style>
.content-header {
	margin-bottom: 24px;
}

.content-header h1 {
	font-size: 28px;
	color: #1f2937;
	font-weight: 700;
	margin-bottom: 8px;
}

.content-header p {
	color: #6b7280;
	font-size: 14px;
}

/* 그리드 */
.dashboard-grid {
	display: grid;
	grid-template-columns: repeat(12, 1fr);
	gap: 24px;
}

/* 박스 */
.card-header {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 20px;
	padding-bottom: 16px;
	border-bottom: 2px solid #f3f4f6;
	background-color: white;
}

.card-title {
	font-size: 18px;
	font-weight: 600;
	color: #1f2937;
	display: flex;
	align-items: center;
	gap: 8px;
}

.card-title-icon {
	color: #2d6a4f;
}

.card-badge {
	background: #d1fae5;
	color: #2d6a4f;
	padding: 4px 12px;
	border-radius: 12px;
	font-size: 12px;
	font-weight: 600;
}

/* 통계 카드 */
.card {
	background: white;
	border-radius: 12px;
	padding: 24px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
	border: 1px solid #e5e7eb;
	transition: all 0.3s ease;
}

.card-full {
	grid-column: span 12;
}

.card-half {
	grid-column: span 6;
}

.card-third {
	grid-column: span 4;
}

.stats-grid {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 16px;
}

.stat-card {
	background: linear-gradient(135deg, #f0fdf4 0%, #d1fae5 100%);
	padding: 20px;
	border-radius: 10px;
	border: 1px solid #a7f3d0;
}

.stat-label {
	color: #059669;
	font-size: 13px;
	font-weight: 600;
	margin-bottom: 8px;
	text-transform: uppercase;
	letter-spacing: 0.5px;
}

.stat-value {
	font-size: 32px;
	font-weight: 700;
	color: #2d6a4f;
	display: flex;
	align-items: baseline;
	gap: 8px;
}

.stat-unit {
	font-size: 14px;
	color: #059669;
	font-weight: 500;
}

.stat-change {
	margin-top: 8px;
	font-size: 13px;
	color: #059669;
	font-weight: 500;
}
/*차트박스*/

.c_chart_box{
	height: 350px;
}
.b_chart_box{
	height: 450px;
}
</style>
</head>
<body>
	<div class="content-header">
		<h1>대시보드</h1>
		<p>실시간 사이트 운영 현황을 확인하세요</p>
	</div>
	<div class="dashboard-grid">
		<div class="card card-full">
			<div class="card-header">
				<div class="card-title">
					<span class="card-title-icon"></span> 오늘의 주요 지표
				</div>
				<div class="card-badge">실시간</div>
			</div>
			<div class="stats-grid">
				<div class="stat-card">
					<div class="stat-label">신규게시글</div>
					<div class="stat-value" id="newPost">
						4 <span class="stat-unit">명</span>
					</div>
					<div class="stat-change">↑ 전일 대비 +12%</div>
				</div>
				<div class="stat-card">
					<div class="stat-label">신규 가입자</div>
					<div class="stat-value" id="newMember">
						- <span class="stat-unit">명</span>
					</div>
					<div class="stat-change">데이터 없음</div>
				</div>
				<div class="stat-card">
					<div class="stat-label">탈퇴자수</div>
					<div class="stat-value" id="newDelMember">
						2 <span class="stat-unit">명</span>
					</div>
					<div class="stat-change">↓ 전일 대비 -5%</div>
				</div>
			</div>
		</div>

		<div class="card card-half">
			<div class="c_chart_box">
				<canvas id="AlineChart"></canvas>
			</div>
		</div>
		<div class="card card-half">
			<div class="c_chart_box">
				<canvas id="donutChart"></canvas>
			</div>
		</div>

		<div class="card card-full">
			<div class="b_chart_box">
				<canvas id="lineChart"></canvas>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">


var statsDay = () => {
	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'adminselectstatsday.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: {
		},
		// 데이터 전송 성공 시 실행
		success: function(response) {
			$('#newPost').text(response.newBoard);
			$('#newMember').text(response.newMember);
			$('#newDelMember').text(response.outMember);
		},

		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
		}
	});
}
var statsPost = () => {
	$.ajax({
		url: 'adminselectstatspostday.do',
		type: 'POST',
		data: {
			// 서버로 보낼 데이터가 있다면 여기에 추가
		},
		success: function(response) {

			const chartLabels = [];
			const chartData = [];

			// 2. 서버 응답 배열을 순회하며 데이터 추출 및 가공
			response.forEach(item => {
				// dayOfWeek는 label에 사용
				chartLabels.push(item.dayOfWeek + '요일'); // 예: "월" -> "월요일"로 변환

				// postCount는 숫자로 변환하여 data에 사용
				chartData.push(parseInt(item.postCount));
			});

			// 3. Chart.js에 전달할 최종 Adata 객체 생성
			const Adata = {
				labels: chartLabels, // [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일' ]
				datasets: [{
					label: '게시글 등록수',
					backgroundColor: 'rgba(175, 75, 192, 0.5)',
					borderColor: 'rgba(175, 75, 192, 1)',
					borderWidth: 1,
					data: chartData, // [ 0, 12, 0, 0, 0, 0, 0 ]
				}]
			};

			const Aconfig = {
				type: 'bar',
				data: Adata,
				options: {
					responsive: true,
					maintainAspectRatio: false,
					plugins: {
						legend: {
							position: 'top',
						},
						title: {
							display: true,
							text: '일별 가입자수'
						}
					}
				},
			};
			const $AlineChart = $('#AlineChart');
			if ($AlineChart.length) {
				const Actx = $AlineChart[0].getContext('2d');
                if (window.activeCharts && window.activeCharts.Aline) {
                    window.activeCharts.Aline.destroy();
                }
                if (!window.activeCharts) {
                    window.activeCharts = {};
                }
				window.activeCharts.Aline = new Chart(Actx, Aconfig);
			}
		},

		error: function(xhr, status, error) {
		}
	});
}

var statsCategory = () => {
    // getDynamicColors 함수를 이 안에 정의하여 전역 범위에서 중복 선언되는 것을 방지합니다.
    const getDynamicColors = (count) => {
        const baseColors = [
            'rgba(255, 99, 132, 0.8)', // Red
            'rgba(54, 162, 235, 0.8)', // Blue
            'rgba(255, 205, 86, 0.8)', // Yellow
            'rgba(75, 192, 192, 0.8)', // Green
            'rgba(153, 102, 255, 0.8)', // Purple
            'rgba(255, 159, 64, 0.8)', // Orange
            'rgba(201, 203, 207, 0.8)', // Grey
            'rgba(23, 162, 184, 0.8)', // Cyan
            'rgba(10, 207, 151, 0.8)',  // Teal
            'rgba(240, 128, 128, 0.8)', // Light Coral
            'rgba(147, 112, 219, 0.8)', // Medium Purple
            'rgba(60, 179, 113, 0.8)'   // Medium Sea Green
        ];
        // 필요한 만큼 색상을 반환하고, 부족하면 반복하여 사용합니다.
        return Array.from({ length: count }, (_, i) => baseColors[i % baseColors.length]);
    };
    
	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'adminselectstatscategory.do',
		// 전송 방식
		type: 'POST',
		// 서버로 보낼 데이터
		data: {
		},
		// 데이터 전송 성공 시 실행
		success: function(response) {
            
            // 1. Chart.js의 labels (카테고리명)과 data (팀 수)를 저장할 배열 초기화
            const chartLabels = [];
            const chartData = [];

            // 2. 서버 응답 배열을 순회하며 데이터 추출 및 가공
            response.forEach(item => {
                // studyCategory는 label에 사용
                chartLabels.push(item.studyCategory);

                // categoryCount는 숫자로 변환하여 data에 사용
                chartData.push(parseInt(item.categoryCount));
            });

            // 3. 데이터 개수에 맞는 동적인 색상 배열 생성
            const chartColors = getDynamicColors(chartData.length);

			// 4. Chart.js에 전달할 최종 Ddata 객체 생성
			const Ddata = {
				labels: chartLabels,
				datasets: [{
					label: '카테고리별 팀수', 
					data: chartData,
                    // 동적으로 생성된 색상 적용
					backgroundColor: chartColors,
				}]
			};

			// 5. Chart.js config 설정
			const dconfig = {
				type: 'doughnut',
				data: Ddata,
				options: {
					responsive: true,
					maintainAspectRatio: false,
					plugins: {
						legend: {
							position: 'top',
						},
						title: {
							display: true,
							text: '카테고리별 팀수' // 도넛 차트의 제목
						}
					}
				},
			};
            
			const $donutChart = $('#donutChart');
			if ($donutChart.length) {
				const Dctx = $donutChart[0].getContext('2d');
                
                // 기존 차트가 있으면 파괴하고 새로 생성합니다.
                if (window.activeCharts && window.activeCharts.donut) {
                    window.activeCharts.donut.destroy();
                }

                // window.activeCharts가 정의되지 않았을 경우를 대비해 안전하게 객체를 생성합니다.
                if (!window.activeCharts) {
                    window.activeCharts = {};
                }

                // 새 Chart 인스턴스를 생성하고 저장합니다.
				window.activeCharts.donut = new Chart(Dctx, dconfig);
			}
		},

		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
		}
	});
}
var statsSignUpMonth = () => {
	$.ajax({
		url: 'adminselectstatssignupmonth.do',
		type: 'POST',
		data: {
		},
		success: function(response) {
            
            // 1. Chart.js의 labels (월 이름)과 data (가입자 수)를 저장할 배열 초기화
            const chartLabels = [];
            const chartData = [];

            // 2. 서버 응답 배열을 순회하며 데이터 추출 및 가공
            response.forEach(item => {
                // signupMonthName은 label에 사용
                chartLabels.push(item.signupMonthName);

                // monthlySignups는 숫자로 변환하여 data에 사용
                chartData.push(parseInt(item.monthlySignups));
            });

			// 3. Chart.js에 전달할 최종 데이터 객체 생성
            const Sdata = {
                labels: chartLabels,
                datasets: [{
                    label: '월별 가입자수',
                    backgroundColor: 'rgba(75, 192, 192, 0.7)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1,
                    data: chartData,
                }]
            };
            
            // 4. Chart.js config 설정
            const Sconfig = {
                type: 'bar',
                data: Sdata,
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
                    },
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                },
            };
            
			const $lineChart = $('#lineChart'); // 캔버스 ID가 lineChart라고 가정합니다.
			if ($lineChart.length) {
				const Sctx = $lineChart[0].getContext('2d');
				
                // 기존 차트가 있으면 파괴하고 새로 생성합니다.
                if (window.activeCharts.line) {
                    window.activeCharts.line.destroy();
                }

				// 새 Chart 인스턴스를 생성하고 저장합니다.
				window.activeCharts.line = new Chart(Sctx, Sconfig);
			}
		},

		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
		}
	});
}
$(document).ready(function() {
	statsDay();
	statsPost();
	statsCategory();
	statsSignUpMonth();
});
</script>
</html>