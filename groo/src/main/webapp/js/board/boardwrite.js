$(document).ready(function() {
	
	// Summernote 초기화
	        $('.summernote').summernote({
	              height: 400, // 높이 조정
	              placeholder: '게시글 내용을 입력해 주세요.',
	              tabsize: 2,
	              
	              toolbar: [
	                  ['fontname', ['fontname']],
	                  ['fontsize', ['fontsize']],
	                  ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
	                  ['color', ['forecolor','color']],
	                  ['table', ['table']],
	                  ['para', ['ul', 'ol', 'paragraph']],
	                  ['height', ['height']],
	                  ['insert',['picture','link','video']],
	                  ['view', ['fullscreen', 'help']]
	              ],
	              
	              fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
	              fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']  	
	        });
			
		$('#submitBtn').click(function () {
			boardInsert();
		});        
		
    }); // $(document).ready() 끝!
	
	boardInsert = () => {
		const postContent = $('#postContent').summernote('code');
		const postTitle = $('#postTitle').val();
								
		$.ajax({
		// 데이터를 전송할 서버 URL
		url: 'boardinsert.do',
		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
		type: 'POST',
		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
		data: {
		memId : '',
		boardType : '',
		postContent : postContent,
		postTitle : postTitle
	},
			// 데이터 전송 성공 시 실행
			success: function(response) {
			console.log("성공");
		},
		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
		error: function(xhr, status, error) {
		
		}
	});
}
		
	
	
	
	
	
	