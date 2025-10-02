<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<link href="css/base.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>

.a_r_t_box {
	height: 100px;
	padding: 20px;
}

.a_r_m_box {
	height: calc(60% - 50px);
	padding: 20px;
}

.a_r_b_box {
	height: calc(40% - 50px);
	padding: 20px;
}

.a_r_l_item {
	width: 70%;
	height: 100%;
	border: solid 1px #ebebeb;
	border-radius: 20px;
	overflow: auto;
}

.a_r_r_item {
	width: 30%;
	height: 100%;
	border: solid 1px #ebebeb;
	border-radius: 20px;
	margin-left: 20px;
}

.user_chart {
	width: 800px;
	height: 600px;
}
</style>

<body>
	<div class="flex_container full_w_h">
		<%@ include file="adminNav.jsp"%>
		<div class="a_r_container">
			<div class="a_r_t_box flex_container">
				<h1>관리자 페이지</h1>
			</div>
			<div class="a_r_m_box flex_container">
				<div class="a_r_l_item flex_container">
					<div class="user_chart flex_container">
						<canvas id="lineChart"></canvas>
					</div>
				</div>
				<div class="a_r_r_item flex_container">
					<div>
						<canvas id="donutChart"></canvas>
					</div>
				</div>
			</div>
			<div class="a_r_b_box flex_container">
				<div class="a_r_l_item flex_container">
					<div class="user_chart flex_container">
						<canvas id="AlineChart"></canvas>
					</div>
				</div>
				<div class="a_r_r_item">
					<span>오늘의 방분자수 : 4</span><br> <span>오늘의 가입자수 : </span><br>
					<span>오늘의 팀생성수 : 2</span><br>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

<script>
	const data = {
		labels : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월',
				'11월', '12월' ],
		datasets : [ {
			label : '월별 가입자수',
			backgroundColor : 'rgba(75, 192, 192, 0.5)',
			borderColor : 'rgba(75, 192, 192, 1)',
			borderWidth : 1,
			data : [ 12, 19, 3, 5, 2, 3, 15, 8, 5, 3, 9, 3 ],
		} ]
	};

	const Ddata = {
		labels : [ '레저', '프론트엔드', '백엔드', '골프', '영어' ],
		datasets : [ {
			label : 'Dataset 1',
			data : [ 15, 25, 30, 20, 10 ], // 실제 데이터 값으로 수정
			backgroundColor : [ 'rgba(255, 99, 132, 0.8)',
					'rgba(255, 159, 64, 0.8)', 'rgba(255, 205, 86, 0.8)',
					'rgba(75, 192, 192, 0.8)', 'rgba(54, 162, 235, 0.8)' ],
		} ]
	};

	const Adata = {
		labels : [ '월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일' ],
		datasets : [ {
			label : '게시글 등록수',
			backgroundColor : 'rgba(175, 75, 192, 0.5)',
			borderColor : 'rgba(175, 75, 192, 1)',
			borderWidth : 1,
			data : [ 12, 19, 3, 5, 2, 3, 15 ],
		} ]
	};

	const config = {
		type : 'bar', // 차트 유형
		data : data, // 위에서 정의한 데이터
		options : {
			responsive : true,
			plugins : {
				legend : {
					position : 'top',
				},
				title : {
					display : true,
					text : '월별 가입자수'
				}
			}
		},
	};

	const dconfig = {
		type : 'doughnut',
		data : Ddata,
		options : {
			responsive : true,
			plugins : {
				legend : {
					position : 'top',
				},
				title : {
					display : true,
					text : '카테고리별 팀수'
				}
			}
		},
	};

	const Aconfig = {
		type : 'bar', // 차트 유형
		data : Adata, // 위에서 정의한 데이터
		options : {
			responsive : true,
			plugins : {
				legend : {
					position : 'top',
				},
				title : {
					display : true,
					text : '월별 가입자수'
				}
			}
		},
	};
	window.onload = function() {
		const ctx = document.getElementById('lineChart').getContext('2d');
		const myBarChart = new Chart(ctx, config); // 변수명 변경

		const Actx = document.getElementById('AlineChart').getContext('2d');
		const AmyBarChart = new Chart(Actx, Aconfig); // 변수명 변경
		// 도넛 차트
		const Dctx = document.getElementById('donutChart').getContext('2d');
		const myDoughnutChart = new Chart(Dctx, dconfig);
	};
</script>