<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시글 작성</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .board-write-container {
            width: 800px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #eee;
            text-align: left;
        }
        th {
            width: 15%;
            background-color: #f8f8f8;
        }
        input[type="text"], textarea {
            width: calc(100% - 22px); /* 패딩과 보더를 고려 */
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        textarea {
            resize: vertical;
            min-height: 300px;
        }
        .btn-area {
            text-align: center;
            margin-top: 20px;
        }
        .btn-area button {
            padding: 10px 20px;
            margin: 0 5px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .submit-btn {
            background-color: #007bff;
            color: white;
        }
        .cancel-btn {
            background-color: #6c757d;
            color: white;
        }
    </style>
</head>
<body>

<div class="board-write-container">
    <h2>게시글 작성</h2>
    
    <form action="/api/board/write" method="POST" enctype="multipart/form-data">
        <table>
            <tr>
                <th>타이틀 (제목)</th>
                <td>
                    <input type="text" name="title" id="title" placeholder="제목을 입력하세요" required>
                </td>
            </tr>
            
            <tr>
                <th>내용</th>
                <td>
                    <textarea name="content" id="content" placeholder="내용을 입력하세요" required></textarea>
                </td>
            </tr>
            
            <tr>
                <th>파일 첨부</th>
                <td>
                    <input type="file" name="upfile" id="upfile" accept="image/*,.pdf,.zip" multiple>
                    <p style="margin-top: 5px; font-size: 0.9em; color: #666;">(사진 및 기타 파일 첨부 가능)</p>
                </td>
            </tr>
            
            </table>
        
        <div class="btn-area">
            <button type="submit" class="submit-btn">작성 완료</button>
            <button type="button" class="cancel-btn" onclick="history.back()">취소</button>
        </div>
    </form>
</div>

</body>
</html>