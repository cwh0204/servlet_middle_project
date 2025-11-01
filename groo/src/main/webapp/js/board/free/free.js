var boardselect = () => {
	console.log("board");
	$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'boardselect.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: {

		},
		// 데이터 전송 성공 시 실행
		success: function(response) {

			$('#boardDataBody').empty();

			// response는 서버에서 돌려준 데이터입니다.
			response.forEach(item => {
				const writeDateOnly = item.postingDate ? item.postingDate.split(' ')[0] : '-';
				const $newRow = $('<tr>').addClass('table-hover'); // table-success 대신 table-hover 사용

				// 2. <th> 요소 (번호)를 생성하고 <tr>에 추가합니다.
				const $th = $('<th>').attr('scope', 'row').text(item.boardId);
				$newRow.append($th);

				// 3. <td> 요소 (제목)를 생성하고 <tr>에 추가합니다.
				const $a = $('<a>').attr('href', 'postdetail.do?id=' + item.boardId).text(item.postTitle);
				const $tdTitle = $('<td>').append($a);
				$newRow.append($tdTitle);

				// 4. 나머지 <td> 요소들을 생성하고 <tr>에 추가합니다.
				$newRow.append($('<td>').text(item.memNick));
				$newRow.append($('<td>').text(writeDateOnly));
				const $tdViews = $('<td>').addClass('post-views-' + item.boardId).text(item.postViews);
				$newRow.append($tdViews);
				$newRow.append($('<td>').text(item.comentCount));
				$newRow.append($('<td>').text('12'));

				// 5. 완성된 <tr>을 <tbody>에 추가합니다.
				$('#boardDataBody').append($newRow);

				$a.on('click', function(e) {
					// e.preventDefault(); // 페이지 이동을 막으려면 이 줄을 사용

					// 현재 DB에 저장된 조회수 값 (문자열)을 가져옵니다.
					let currentViews = parseInt($tdViews.text());

					// 1을 더하고 (DB에 반영된 것으로 가정)
					currentViews += 1;

					// 화면의 텍스트를 즉시 업데이트합니다.
					$tdViews.text(currentViews);

					// 참고: e.preventDefault()를 사용하지 않으면, 이 작업 후 바로 페이지 이동이 일어납니다.
				});
			});
		},
		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
		}
	});
}