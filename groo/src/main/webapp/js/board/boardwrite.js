function boardInsert() {
	const postContent = $('#postContent').summernote('code');
	const postTitle = $('#postTitle').val();
	
	const queryString = window.location.search; 
	const urlParams = new URLSearchParams(queryString);
	const typeValue = urlParams.get('type');
	
	$.ajax({
	
	url: 'boardinsert.do',
	
	type: 'POST',
	
	data: {
		memId : '',
		boardType : typeValue,
		postContent : postContent,
		postTitle : postTitle
	},
        
		success: function(response) {
			console.log("성공");
		},
		
		error: function(xhr, status, error) {
			console.error("게시글 등록 실패:", status, error);
		}
	});
}

$(document).ready(function() {	
    $('.summernote').summernote({
          height: 400,
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

	
	
	
	
	
	