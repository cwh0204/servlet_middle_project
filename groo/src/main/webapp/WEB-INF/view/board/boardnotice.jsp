<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/base.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
.boardlist .write:active {
    background-color: #b0b0b0 !important; 
    color: black;
}

.pagination .page-link {
    color: black; 
}

/* 포커스 및 활성 상태의 box-shadow 제거 */
.pagination .page-link:focus,
.pagination .page-item.active .page-link {
    box-shadow: none !important; 
    outline: none !important;
}

/* 활성 상태 색상 */
.pagination .page-item.active .page-link {
    background-color: black;
    color: white;
    border-color: black;
}

/* 마우스 오버 시 스타일 */
.pagination .page-link:hover {
    background-color: #f0f0f0;
    color: black;
}

/* 마우스 클릭 시 (Active) 스타일 */
.pagination .page-link:active {
    background-color: #d0d5db !important;
    color: black;
}

/* 글쓰기 버튼 클릭 시 어두운 색 */
.boardlist .write:active {
    background-color: #b9dbcb !important;
    color: black;
}

.pagination .page-link {
    color: black;
}

/* 검색창에 x버튼 제거 */
input[type="search"]::-webkit-search-cancel-button {
    -webkit-appearance: none;
    appearance: none;
}

.search-input:focus {
    border-color:#D1E7DD;
}

</style>
</head>
<body>

	<div class="boardlist" style="width: 1300px; margin-left: auto; margin-right: 6%; margin-top: -150px; width: 800px;">
	
	<nav class="navbar p-0 mb-3 d-flex justify-content-center">
	<div class="search-container position-relative">
            <form class="d-flex">
                <input class="form-control form-control-sm me-2 rounded-pill search-input"
                type="search" placeholder="Search" aria-label="Search" style="box-shadow: none !important;">
                <i class="bi bi-search search-icon position-absolute top-50 translate-middle-y end-0 pe-4"
           style="font-size: 1rem; color: #6c757d; cursor: pointer;"></i>
            </form>
            </div>
        </nav>
        
	<table class="table table-hover">
            <thead class="table-light">
                <tr>
                    <th scope="col">번호</th>
                    <th scope="col">제목</th>
                    <th scope="col">게시자</th>
                    <th scope="col">대상</th>
                    <th scope="col">작성일</th>
                    <th scope="col">조회수</th>
                </tr>
            </thead>
            <tbody>
                <tr class="table-success"> 
                    <th scope="row">필독</th>
                    <td>**[긴급]** 개인정보 보호를 위한 비밀번호 변경 권고</td>
                    <td>관리자</td>
                    <td>공지사항222</td>
                    <td>2025.10.22</td>
                    <td>2,500</td>
                </tr>
                <tr>
                    <th scope="row">10</th>
                    <td>101010</td>
                    <td>김00</td>
                    <td>전체 회원</td>
                    <td>2025.10.15</td>
                    <td>870</td>
                </tr>
                <tr>
                    <th scope="row">9</th>
                    <td>999</td>
                    <td>이00</td>
                    <td>전체 회원</td>
                    <td>2025.10.10</td>
                    <td>1,120</td>
                </tr>
                <tr>
                    <th scope="row">8</th>
                    <td>888</td>
                    <td>박00</td>
                    <td>전체 회원</td>
                    <td>2025.10.05</td>
                    <td>450</td>
                </tr>
                <tr>
                    <th scope="row">7</th>
                    <td>777</td>
                    <td></td>
                    <td>일반 회원</td>
                    <td>2025.09.28</td>
                    <td>620</td>
                </tr>
                <tr>
                    <th scope="row">6</th>
                    <td>666</td>
                    <td></td>
                    <td>일반 회원</td>
                    <td>2025.09.28</td>
                    <td>620</td>
                </tr>
                <tr>
                    <th scope="row">5</th>
                    <td>555</td>
                    <td></td>
                    <td>일반 회원</td>
                    <td>2025.09.28</td>
                    <td>620</td>
                </tr>
                <tr>
                    <th scope="row">4</th>
                    <td>444</td>
                    <td></td>
                    <td>일반 회원</td>
                    <td>2025.09.28</td>
                    <td>620</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>333</td>
                    <td></td>
                    <td>일반 회원</td>
                    <td>2025.09.28</td>
                    <td>620</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>222</td>
                    <td></td>
                    <td>일반 회원</td>
                    <td>2025.09.28</td>
                    <td>620</td>
                </tr>
                <tr>
                    <th scope="row">1</th>
                    <td>111</td>
                    <td></td>
                    <td>일반 회원</td>
                    <td>2025.09.28</td>
                    <td>620</td>
                </tr>
            </tbody>
        </table>
        
        
        <div class="d-flex justify-content-end mt-3">
          <button type="button" 
        class="write" style="border: none; background-color: #D1E7DD;
                   color: black; box-shadow: none !important;">글쓰기</button>
        </div>
        </div>
        <nav aria-label="Page navigation example" 
     class="mt-4"
     style="width: 1300px; margin-left: auto; margin-right: auto; margin-top: -20px;"> <ul class="pagination justify-content-center">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav> 

</body>
</html>