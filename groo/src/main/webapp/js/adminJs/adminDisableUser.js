/**
 * 
 */

function initializeDisableUserGrid() {
	disableusergrid = new tui.Grid({
	        el: document.getElementById('disableusergrid'),
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
	    disableusergrid.on('response', function(ev) {
	        let response = ev.xhr.responseText;
	        let data = JSON.parse(response);

	        originalFullData = data; // originalFullData 변수가 외부 스코프에 있어야 접근 가능합니다.

	        disableusergrid.resetData(data);
	    });

	    // 데이터 변경 후 이벤트 설정
	    disableusergrid.on('afterChange', ev => {
	        const changeUser = disableusergrid.getModifiedRows();
	    });
	    
	    // 데이터 변경 전 이벤트 설정 (수정 셀/행 강조)
	    disableusergrid.on('beforeChange', ev => {
	        const { rowKey } = ev.changes[0];
	        const columnName = ev.changes[0].columnName;
	        
	        // 수정이 발생한 행/셀에 클래스 추가
	        disableusergrid.addRowClassName(rowKey, 'modified-row');
	        disableusergrid.addCellClassName(rowKey, columnName, 'modified-cell');
	    });

	    // 3. 기타 설정 및 반환
	    disableusergrid.setBodyHeight(450);
}