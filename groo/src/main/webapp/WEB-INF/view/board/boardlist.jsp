<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<link href="css/base.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>

<body>
	<%@ include file="../frontComponents/boardlistheader.jsp"%>
	<%@ include file="../frontComponents/boardlistnav.jsp"%>
	
	<div class="custom-board-area" style="width: 1300px; margin-left: auto; margin-right: 6%; margin-top: -180px;">
	
	<nav class="navbar p-0 mb-3 d-flex justify-content-end">
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
                    <td>시스템 관리자</td>
                    <td>전체 회원</td>
                    <td>2025.10.22</td>
                    <td>2,500</td>
                </tr>
                <tr>
                    <th scope="row">10</th>
                    <td>101010</td>
                    <td>운영팀</td>
                    <td>전체 회원</td>
                    <td>2025.10.15</td>
                    <td>870</td>
                </tr>
                <tr>
                    <th scope="row">9</th>
                    <td>999</td>
                    <td>개발팀</td>
                    <td>프리미엄 회원</td>
                    <td>2025.10.10</td>
                    <td>1,120</td>
                </tr>
                <tr>
                    <th scope="row">8</th>
                    <td>888</td>
                    <td>운영팀</td>
                    <td>전체 사용자</td>
                    <td>2025.10.05</td>
                    <td>450</td>
                </tr>
                <tr>
                    <th scope="row">7</th>
                    <td>777</td>
                    <td>고객지원팀</td>
                    <td>일반 회원</td>
                    <td>2025.09.28</td>
                    <td>620</td>
                </tr>
                <tr>
                    <th scope="row">6</th>
                    <td>666</td>
                    <td>고객지원팀</td>
                    <td>일반 회원</td>
                    <td>2025.09.28</td>
                    <td>620</td>
                </tr>
                <tr>
                    <th scope="row">5</th>
                    <td>555</td>
                    <td>고객지원팀</td>
                    <td>일반 회원</td>
                    <td>2025.09.28</td>
                    <td>620</td>
                </tr>
                <tr>
                    <th scope="row">4</th>
                    <td>444</td>
                    <td>고객지원팀</td>
                    <td>일반 회원</td>
                    <td>2025.09.28</td>
                    <td>620</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>333</td>
                    <td>고객지원팀</td>
                    <td>일반 회원</td>
                    <td>2025.09.28</td>
                    <td>620</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>222</td>
                    <td>고객지원팀</td>
                    <td>일반 회원</td>
                    <td>2025.09.28</td>
                    <td>620</td>
                </tr>
                <tr>
                    <th scope="row">1</th>
                    <td>111</td>
                    <td>고객지원팀</td>
                    <td>일반 회원</td>
                    <td>2025.09.28</td>
                    <td>620</td>
                </tr>
            </tbody>
        </table>
        
        
        <div class="d-flex justify-content-end mt-3">
          <button type="button" 
        class="btn btn-success btn-sm" style="border: none; border-radius: 0; background-color: #dcdcdc;
                   color: black; box-shadow: none !important;">글쓰기</button>
        </div>
        </div>
        <nav aria-label="Page navigation example">
  <ul class="pagination">
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