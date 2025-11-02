/**
 * 
 */


function initializeDisableUserGrid() {
	reportUsergrid = new tui.Grid({
		el: document.getElementById('reportUsergrid'),
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
			width: 100
		}, {
			header: '신고자',
			name: 'memReporter',
			width: 100
		}, {
			header: '신고아이디',
			name: 'memSuspect',
			width: 100
		}, {
			header: '글번호',
			name: 'reportBoard',
			width: 100
		}, {
			header: '신고사유',
			name: 'reportContent'
		},{
			header: '신고일',
			name: 'reportDate',
			width: 150
		},{
			header: 'Grade',
			name: 'grade',
			width: 150,
			renderer: {
				type: CustomReportProcessBtnRenderer,
			}
		}
		]
	});
	reportUsergrid.setBodyHeight(450);
}