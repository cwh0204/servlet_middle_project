/**
 * 
 */

function initializeDisableUserGrid() {
	reportProcessUserGrid = new tui.Grid({
		el: document.getElementById('reportProcessUserGrid'),
		data: [], // 초기 데이터는 빈 배열로 설정
		rowKey: 'id',
		scrollX: true,
		scrollY: true,
		columnOptions: {
			resizable: true // 이 값이 false이면 리사이징 기능이 비활성화됩니다.
		},
		columns: [{
			header: '신고번호',
			name: 'reportId',
			width: 50
		}, {
			header: '신고자',
			name: 'memReporter',
			width: 80
		}, {
			header: '신고아이디',
			name: 'memSuspect',
			width: 80
		}, {
			header: '글번호',
			name: 'reportBoard',
			width: 50
		}, {
			header: '신고사유',
			name: 'reportContent'
		}, {
			header: '신고일',
			name: 'reportDate',
			width: 100
		}, {
			header: '조치내용',
			name: 'actionContent'
		}, {
			header: '벤시작일',
			name: 'actionDate',
			width: 100
		}, {
			header: '벤종료일',
			name: 'endActionDate',
			width: 100
		}
		]
	});
	reportProcessUserGrid.setBodyHeight(450);
}