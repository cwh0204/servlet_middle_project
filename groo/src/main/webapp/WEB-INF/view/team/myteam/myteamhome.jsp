<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<link href="css/team/myteam/myteamhome.css" rel="stylesheet">

<meta charset="UTF-8">
<title> </title>
</head>
<body>
 <div class="container">
  <div class="header">
	<h1 class="title">내 스터디</h1>
	<p class="subtitle">참여 중인 스터디를 확인해보세요</p>
  </div>
  
  <div class="card-grid" id="cardGrid">
  
    <%--'studyList'라는 이름의 List/Array 를 반복합니다. <c:forEach> --%>
    
  
  	<article class="study-card glass-card">
  	  <div class="card-gradient"></div>
  	  
  	  <div class="badge-corner badge-gold"></div>
  	  
  	   <div class="card-header">
  	     <div class="study-name">
  	     
  	     <%-- 스터디명 ${study.name} --%>
  	       <span class="name-text">스터디명</span>
  	     </div>
  	     
  	     <button class="btn-report">
  	     <img src="https://i.postimg.cc/kXrTz88D/icons8-warning-20.png" class="warning"/>신고</button>
  	   </div>
  	   
  	   <div class="study-stats">
  	     <div class="stat-item">
  	       <div class="stat-icon">👥</div>
  	       <div class="stat-info">
             <span class="stat-label">팀원</span>
             
             <%-- 팀원 수 동적 출력 ${study.userCount} --%>
             <span class="stat-value">8명</span>
           </div>
  	     </div>
  	     <div class="stat-divider"></div>
           <div class="stat-item">
              <div class="stat-icon">❤️</div>
                 <div class="stat-info">
                    <span class="stat-label">좋아요</span>
                    
                    <%-- 좋아요 수 동적 출력 ${study.likes} --%>
                    <span class="stat-value">214</span>
           		 </div>
           </div>
  	   </div>
  	   
  	   <div class="badge-info">
  	      <div class="badge-stat-gold">
  	        <div class="badge-stat-count">0</div>
  	        <div class="badge-stat-icon"></div>
  	      </div>
  	       
  	      <div class="badge-divider"></div>
  	       
  	      <div class="badge-stat-silver">
  	        <div class="badge-stat-count">3</div>
  	        <div class="badge-stat-icon"></div>
  	      </div>
  	       
  	      <div class="badge-divider"></div>
  	       
  	      <div class="badge-stat-bronze">
  	        <div class="badge-stat-count">2</div>
  	        <div class="badge-stat-icon"></div>
  	      </div>
  	   </div>
  	   
  	   <div class="leader-info">
  	       <span>팀장</span>
  	       
  	       <%-- 팀장 이름 동적 출력 ${study.leaderName} --%>
  	     <span class="leader-name">아무개</span>
  	   </div>
  	   
  	   <div class="card-actions">
  	     <button class="btn-detail">
  	       <span>상세보기</span>
  	     </button>
  	     
  	     <button class="btn-leave">
  	       <span>탈퇴</span>
  	     </button>
  	   </div>
  	</article>
  	
       <%-- 반복문 종료 	</c:forEach> --%>
  	
  	<article class="study-card glass-card">
  	  <div class="card-gradient"></div>
  	  
  	  <div class="badge-corner badge-silver"></div>
  	  
  	   <div class="card-header">
  	     <div class="study-name">
  	       <span class="name-text">스터디명</span>
  	     </div>
  	     
  	     <button class="btn-report">
  	     <img src="https://i.postimg.cc/kXrTz88D/icons8-warning-20.png" class="warning"/>신고</button>
  	   </div>
  	   
  	   <div class="study-stats">
  	     <div class="stat-item">
  	       <div class="stat-icon">👥</div>
  	       <div class="stat-info">
             <span class="stat-label">팀원</span>
             <span class="stat-value">8명</span>
           </div>
  	     </div>
  	     <div class="stat-divider"></div>
           <div class="stat-item">
              <div class="stat-icon">❤️</div>
                 <div class="stat-info">
                    <span class="stat-label">좋아요</span>
                    <span class="stat-value">124</span>
           		 </div>
           </div>
  	   </div>
  	   
  	   <div class="leader-info">
  	       <span>팀장</span>
  	     <span class="leader-name">김아무개</span>
  	   </div>
  	   
  	   <div class="card-actions">
  	     <button class="btn-detail">
  	       <span>상세보기</span>
  	     </button>
  	     
  	     <button class="btn-leave">
  	       <span>탈퇴</span>
  	     </button>
  	   </div>
  	</article>
  	
  	<article class="study-card glass-card">
  	  <div class="card-gradient"></div>
  	  
  	  <div class="badge-corner badge-bronze"></div>
  	  
  	   <div class="card-header">
  	     <div class="study-name">
  	       <span class="name-text">스터디명</span>
  	     </div>
  	     
  	     <button class="btn-report">
  	     <img src="https://i.postimg.cc/kXrTz88D/icons8-warning-20.png" class="warning"/>신고</button>
  	   </div>
  	   
  	   <div class="study-stats">
  	     <div class="stat-item">
  	       <div class="stat-icon">👥</div>
  	       <div class="stat-info">
             <span class="stat-label">팀원</span>
             <span class="stat-value">8명</span>
           </div>
  	     </div>
  	     <div class="stat-divider"></div>
           <div class="stat-item">
              <div class="stat-icon">❤️</div>
                 <div class="stat-info">
                    <span class="stat-label">좋아요</span>
                    <span class="stat-value">124</span>
           		 </div>
           </div>
  	   </div>
  	   
  	   <div class="leader-info">
  	       <span>팀장</span>
  	     <span class="leader-name">김아무개</span>
  	   </div>
  	   
  	   <div class="card-actions">
  	     <button class="btn-detail">
  	       <span>상세보기</span>
  	     </button>
  	     
  	     <button class="btn-leave">
  	       <span>탈퇴</span>
  	     </button>
  	   </div>
  	</article>
  	
  	<article class="study-card glass-card">
  	  <div class="card-gradient"></div>
  	  
  	   <div class="card-header">
  	     <div class="study-name">
  	       <span class="name-text">스터디명</span>
  	     </div>
  	     
  	     <button class="btn-report">
  	     <img src="https://i.postimg.cc/kXrTz88D/icons8-warning-20.png" class="warning"/>신고</button>
  	   </div>
  	   
  	   <div class="study-stats">
  	     <div class="stat-item">
  	       <div class="stat-icon">👥</div>
  	       <div class="stat-info">
             <span class="stat-label">팀원</span>
             <span class="stat-value">8명</span>
           </div>
  	     </div>
  	     <div class="stat-divider"></div>
           <div class="stat-item">
              <div class="stat-icon">❤️</div>
                 <div class="stat-info">
                    <span class="stat-label">좋아요</span>
                    <span class="stat-value">124</span>
           		 </div>
           </div>
  	   </div>
  	   
  	   <div class="leader-info">
  	       <span>팀장</span>
  	     <span class="leader-name">김아무개</span>
  	   </div>
  	   
  	   <div class="card-actions">
  	     <button class="btn-detail">
  	       <span>상세보기</span>
  	     </button>
  	     
  	     <button class="btn-leave">
  	       <span>탈퇴</span>
  	     </button>
  	   </div>
  	</article>
  </div>	
 </div>
</body>
</html>

