<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link href="css/myteam.css" rel="stylesheet">
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
  	<article class="glass-card">
  	  <div class="card-gradient"></div>
  	   <div class="card-header">
  	     <div class="study-name">
  	       <span class="name-text">스터디명</span>
  	     </div>
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
  	     <button class="btn-report">
  	       <span>신고</span>
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