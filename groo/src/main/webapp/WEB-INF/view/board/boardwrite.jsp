<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시글 작성</title>
<link href="css/base.css" rel="stylesheet">
<style>
/* html, body 태그는 건드리지 않음 */

/* write_main은 중앙 정렬 및 여백 확보 용도로 유지 */
.write_main {
	display: flex;
	justify-content: center;
	align-items: flex-start;
	padding: 20px 0;
	box-sizing: border-box;
}

/* board-write-container의 너비와 최소 높이를 설정하여 레이아웃을 확장 */
.board-write-container {
	width: 90%;
	max-width: 1200px;
	/* 최소 높이를 뷰포트 높이에 비례하여 설정 */
	min-height: 80vh;
	padding: 20px;
	background-color: white;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
	/* 내부 요소들을 수직으로 배치하기 위한 flex 설정 */
	display: flex;
	flex-direction: column;
}

h2 {
	text-align: center;
	color: #333;
	margin-bottom: 25px;
	border-bottom: 2px solid #4CAF50;
	padding-bottom: 10px;
}
/* 테이블 스타일 - flex-grow를 주어 남은 공간을 차지하도록 설정 */
table {
	width: 100%;
	border-collapse: collapse;
	flex-grow: 1; /* 컨테이너 내에서 남은 수직 공간을 모두 차지 */
}

th, td {
	padding: 12px;
	border-bottom: 1px solid #eee;
	text-align: left;
}

th {
	width: 18%;
	min-width: 80px;
	background-color: #f8f9fa;
	color: #495057;
	font-weight: bold;
	vertical-align: top;
}
/* 입력 필드 스타일 */
input[type="text"], textarea {
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 4px;
	transition: border-color 0.3s;
}

input[type="text"]:focus, textarea:focus {
	border-color: #007bff;
	outline: none;
}

/* 내용 입력 행에 class를 적용하여 높이 확보 */
.content-row {
	/* 테이블 구조에서 높이 확보를 위해 CSS 유지 */
	
}

/* 4. textarea에 직접 높이를 vh 단위로 지정하여 확장 */
textarea {
	resize: vertical;
	/* 최소 높이를 뷰포트 높이의 50%로 설정하여 화면을 가득 채우는 효과 */
	min-height: 50vh;
}

/* 파일 입력 필드 */
input[type="file"] {
	padding: 5px 0;
}

.file-info {
	margin-top: 5px;
	font-size: 0.85em;
	color: #6c757d;
}

/* 버튼 영역 */
.btn-area {
	text-align: right;
	margin-top: 20px;
	padding-top: 10px;
}

.btn-area button {
	padding: 10px 20px;
	margin-left: 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-weight: 600;
	transition: background-color 0.3s;
}

.submit-btn {
	background-color: #4CAF50;
	color: white;
}

.cancel-btn, .list-btn { /* 목록 버튼 스타일 추가 */
	background-color: #6c757d;
	color: white;
}

.cancel-btn:hover, .list-btn:hover {
	background-color: #5a6268;
}

/* 목록/취소 버튼을 왼쪽으로 정렬 */
.left-btns {
	float: left;
}
</style>
</head>
<body>
	<div class="write_main">
		<div class="board-write-container">
			<h2>새 게시글 작성</h2>

			<table>
				<tr>
					<th>타이틀</th>
					<td><input type="text" id="title" placeholder="제목을 입력하세요"
						required></td>
				</tr>

				<tr class="content-row">
					<th>내용</th>
					<td><textarea id="content" placeholder="게시글 내용을 입력하세요"
							required></textarea></td>
				</tr>

				<tr>
					<th>파일 첨부</th>
					<td><input type="file" id="upfile" accept="image/*,.pdf,.zip"
						multiple>
						<p class="file-info">(사진 및 기타 파일 첨부 가능. 다중 선택 가능)</p></td>
				</tr>
			</table>

			<div class="btn-area">
			<button type="button" class="submit-btn" onclick="submitPost()">작성
					완료</button>
				<button type="button" class="list-btn" onclick="goToList()">목록으로
					가기</button>
				<button type="button" class="cancel-btn" onclick="history.back()">취소</button>
			</div>
		</div>
	</div>

	<script>
    /**
     * 목록 페이지로 이동하는 함수
     */
    function goToList() {
        // 실제 게시판 목록 페이지 URL로 변경해야 합니다.
        window.location.href = '/board/list.do'; 
    }
    
    // 폼 없이 AJAX로 데이터를 전송하는 예시 함수
    function submitPost() {
        const title = document.getElementById('title').value;
        const content = document.getElementById('content').value;
        const files = document.getElementById('upfile').files;

        // 필수 입력값 검증
        if (title.trim() === '' || content.trim() === '') {
            alert('제목과 내용을 입력해주세요.');
            return;
        }
        
        const formData = new FormData();
        formData.append('title', title);
        formData.append('content', content);

        for (let i = 0; i < files.length; i++) {
            formData.append('upfiles', files[i]); 
        }

        // Fetch API를 사용한 비동기 POST 요청 예시
        fetch('/board/write', { 
            method: 'POST',
            body: formData 
        })
        .then(response => {
            if (response.ok) {
                alert('게시글이 성공적으로 등록되었습니다.');
                // 성공 시 목록으로 이동
                goToList(); 
            } else {
                alert('게시글 등록에 실패했습니다. (상태 코드: ' + response.status + ')');
            }
        })
        .catch(error => {
            console.error('통신 오류:', error);
            alert('서버와 통신 중 오류가 발생했습니다.');
        });
    }
</script>
</body>
</html>