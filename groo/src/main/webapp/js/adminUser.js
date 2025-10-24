/**
 * 
 */

var addUser = () => {
	// 사용자 추가 로직
	if (!grid) {
		alert('그리드가 초기화되지 않았습니다.');
		return;
	}
	const newRowData = {
	};
	// 가장 위에 새 행을 추가하고 포커스를 줍니다.
	grid.appendRow(newRowData, {
		at: 0,
		focus: true
	});
};

var rollbackRowData = () => {
	const targetRowKey = 0;
	const originalRowData = originalFullData.find(row => row.id === targetRowKey + 1);

	grid.setRow(targetRowKey, originalRowData, {
		extended: true
	});
	grid.removeRowClassName(targetRowKey, 'modified-row');
	const columns = grid.getColumns(); // 그리드의 모든 컬럼 정보를 가져옵니다.

	columns.forEach(column => {
		const columnName = column.name;

		// removeCellClassName을 사용하여 해당 행(targetRowKey)과 컬럼(columnName)의 셀에서
		// 'modified-cell' 클래스를 제거합니다.
		grid.removeCellClassName(targetRowKey, columnName, 'modified-cell');
	});
}

var exportData = () => {
	if (!grid) {
		alert('그리드가 초기화되지 않았습니다.');
		return;
	}

	// TOAST UI Grid의 export('csv') 기능을 사용하여 CSV 파일로 내보냅니다.
	grid.export('csv', {
		fileName: '사용자_관리_목록', // 다운로드될 파일명 설정
		includeHiddenColumns: true,      // 숨겨진 컬럼도 포함할지 여부
		onlySelected: false              // 선택된 행만 내보낼지 여부 (false면 전체)
	});
};
var userCeckInsert = () => {

	const createdRows = grid.getModifiedRows().createdRows;
	const updatedRows = grid.getModifiedRows().updatedRows;

	createdRows.forEach(function(row) {

		if (row.memLoginId !== null) {
			userCheck(row);
		}
	});

	updatedRows.forEach(function(row) {

		if (row.memLoginId !== null) {
			userCheck(row);
		}
	});
}

function initializeUserGrid() {
    // 1. Grid 인스턴스 생성
    grid = new tui.Grid({
        el: document.getElementById('grid'),
        data: [], // 초기 데이터는 빈 배열로 설정
        rowKey: 'id',
        scrollX: true,
        scrollY: true,
        columns: [{
            header: '아이디',
            name: 'memLoginId',
            editor: 'text'
        }, {
            header: '이름',
            name: 'memName',
            editor: 'text'
        }, {
            header: '비밀번호',
            name: 'memPass',
            editor: 'text'
        }, {
            header: '닉네임',
            name: 'memNick',
            editor: 'text'
        }, {
            header: '이메일',
            name: 'memEmail',
            editor: 'text'
        }, {
            header: '전화번호',
            name: 'memPhone',
            editor: 'text'
        }, {
            header: '주소',
            name: 'memAddr',
            editor: 'text'
        }, {
            header: '탈퇴여부',
            name: 'memStatus',
            editor: 'text'
        }]
    });

    // 2. 이벤트 바인딩
    
    // (이전에 사용하려고 했던) 'response' 이벤트 설정
    // 🚨 참고: data:[] 설정으로 인해 이 이벤트는 Grid의 API 통신 방식(data.api)을 사용하지 않으면 실행되지 않습니다.
    // 수동 AJAX 방식에서는 이 로직을 resetGridData 함수 내부에서 처리해야 합니다.
    grid.on('response', function(ev) {
        let response = ev.xhr.responseText;
        let data = JSON.parse(response);

        originalFullData = data; // originalFullData 변수가 외부 스코프에 있어야 접근 가능합니다.

        grid.resetData(data);
    });

    // 데이터 변경 후 이벤트 설정
    grid.on('afterChange', ev => {
        const changeUser = grid.getModifiedRows();
    });
    
    // 데이터 변경 전 이벤트 설정 (수정 셀/행 강조)
    grid.on('beforeChange', ev => {
        const { rowKey } = ev.changes[0];
        const columnName = ev.changes[0].columnName;
        
        // 수정이 발생한 행/셀에 클래스 추가
        grid.addRowClassName(rowKey, 'modified-row');
        grid.addCellClassName(rowKey, columnName, 'modified-cell');
    });

    // 3. 기타 설정 및 반환
    grid.setBodyHeight(450);

    return grid; // 생성된 인스턴스를 반환
}