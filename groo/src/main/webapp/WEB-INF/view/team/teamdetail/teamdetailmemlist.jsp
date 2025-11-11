<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- team_member_view.jsp --%>
<script src="js/team/teamdetail/teamdetailmemlist.js">

</script>
<style>
h3 {
    text-align: center;
    margin-top: 20px; /* 상단 여백 추가 (필요하다면) */
    margin-bottom: 20px; /* 하단 여백 추가 (필요하다면) */
    font-size: 30px;
}

.member-cards-container {
    display: flex; /* 카드를 가로로 배치 */
    flex-wrap: wrap; /* 공간이 부족하면 다음 줄로 넘김 */
    gap: 20px; /* 카드 사이의 간격 */
    padding: 20px 0;
    margin-left: 20px;
}

/* 개별 팀원 카드 스타일 */
.member-card {
    background-color: #ffffff;
    border: 1px solid #e0e0e0;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05); /* 은은한 그림자 */
    padding: 20px;
    width: calc(33.333% - 20px); /* 한 줄에 3개씩 배치 (33.333% - gap) */
    min-width: 250px;
    box-sizing: border-box;
    transition: transform 0.2s;
}

.member-card:hover {
    transform: translateY(-3px); /* 마우스 오버 시 살짝 떠오르는 효과 */
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
}

.card-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid #f0f0f0;
    padding-bottom: 10px;
    margin-bottom: 10px;
}

.card-header h4 {
    margin: 0;
    font-size: 1.2em;
    color: #333;
}

.card-group {
    font-weight: bold;
    color: #007bff; /* 스터디 그룹 색상 강조 */
    font-size: 0.9em;
}

.card-detail-list {
    list-style: none;
    padding: 0;
    margin: 0;
}

.card-detail-list li {
    padding: 5px 0;
    font-size: 0.95em;
    color: #555;
    display: flex;
    justify-content: space-between;
}

.card-detail-list strong {
    color: #222;
}

</style>

<h3>스터디 인원 목록</h3>

<div class="member-list-container">
    <div id="memberCardsBody" class="member-cards-container">
        </div>
    
    <%-- TODO: 페이지네이션이 필요하다면 여기에 추가합니다. --%>
</div>