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
        
    }); // $(document).ready() 끝!