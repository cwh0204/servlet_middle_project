<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- team_member_view.jsp --%>
<style>
/* team_member_view.css - 필요하다면 별도 파일로 분리하세요 */
.member-list-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}
.member-list-table th, .member-list-table td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: left;
}
.member-list-table th {
    background-color: #f2f2f2;
    font-weight: bold;
}
.member-list-table tr:hover {
    background-color: #f9f9f9;
}
</style>

<h3>👥 팀 인원 목록</h3>

<div class="member-list-container">
    <table class="member-list-table">
        <thead>
            <tr>
                <th>No.</th>
                <th>이름</th>
                <th>부서/팀</th>
                <th>직급</th>
                <th>이메일</th>
                <th>입사일</th>
            </tr>
        </thead>
        <tbody>
            <%
                // TODO: 실제로는 서버(Controller/Service/DAO)에서 팀원 목록 데이터를 가져와서 반복문으로 출력해야 합니다.
                // 임시 데이터 예시
                String[][] members = {
                    {"1", "김철수", "개발팀", "팀장", "chulsoo@corp.com", "2018-03-01"},
                    {"2", "이영희", "디자인팀", "대리", "younghee@corp.com", "2020-07-15"},
                    {"3", "박민준", "개발팀", "사원", "minjun@corp.com", "2023-11-20"}
                };
                
                for (int i = 0; i < members.length; i++) {
            %>
            <tr>
                <td><%= members[i][0] %></td>
                <td><%= members[i][1] %></td>
                <td><%= members[i][2] %></td>
                <td><%= members[i][3] %></td>
                <td><%= members[i][4] %></td>
                <td><%= members[i][5] %></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    
    <%-- TODO: 페이지네이션(Pagination)이 필요하다면 여기에 추가합니다. --%>
</div>