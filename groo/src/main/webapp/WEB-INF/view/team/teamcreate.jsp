<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>team create</title>
<link href="css/base.css" rel="stylesheet">
<link href="css/teamcreate.css" rel="stylesheet">
<head>
</head>
   <main>
      <div class="underLine"></div>
      <div class="create_Line"></div>


      <form action="teamcreate" method="post">
         
         <div class="form-box">
            <div class="category_container">
               <div class="studyTitle_box">
                  <label>스터디명 </label><br>
                  <input type="text" name="teamName" class="form-control" placeholder="스터디명을 입력해주세요.">
               </div>
               
               <div class="studycontent_box">
                  여러분의 스터디를 소개해 주세요
                  <input type="text" name="teamInfo" class="form-control" placeholder="개설하실 스터디에 대해 설명해주세요.">
               </div>
               
            
               <div class="membercount_box">
                  <label for="teamMember">모집인원:</label> 
                  <select name="teamMember" id="teamMember" class="form-select">
                     <option value="" disabled selected>모집인원</option>
                     <option value="2명">2명</option>
                     <option value="3명">3명</option>
                     <option value="4명">4명</option>
                     <option value="5명">5명</option>
                     <option value="6명">6명</option>
                     <option value="7명 이상">7명 이상</option>
                  </select>
               </div>

               <div class="memberage_box">
                  <div><label for="teamMemberage">나이</label></div>
                  <div class="range-container">
                     <input type="range" id="teamMemberage" name="teamMemberage" min="19" max="50" step="1" value="25"> 
                     <span id="ageValue">25세</span>
                  </div>
               </div>
               
               <table class="region-table">
                  <caption>지역</caption>
                  <tbody>
                     <tr>
                        <td>서울</td>
                        <td>경기</td>
                        <td>인천</td>
                        <td>부산</td>
                     </tr>
                     <tr>
                        <td>충북</td>
                        <td>충남</td>
                        <td>대전</td>
                        <td>세종</td>
                     </tr>
                     <tr>
                        <td>광주</td>
                        <td>대구</td>
                        <td>울산</td>
                        <td>경북</td>
                     </tr>
                     <tr>
                        <td>전남</td>
                        <td>전북</td>
                        <td>제주</td>
                        <td>강원</td>
                     </tr>
                  </tbody>
               </table>
            
               <div class="teamCategory_box">
                  <label>개설하실 스터디의 분야를 선택해 주세요</label>

                  <div class="radio_group">
  <div class="radio_row">
    <input type="radio" id="catDev" name="teamCategory" value="개발">
    <label for="Dev">개발</label>

    <input type="radio" id="catDesign" name="teamCategory" value="디자인">
    <label for="Design">디자인</label>

    <input type="radio" id="catMarketing" name="teamCategory" value="마케팅">
    <label for="Marketing">마케팅</label>

    <input type="radio" id="catLang" name="teamCategory" value="어학">
    <label for="Lang">외국어</label>
  </div>

  <div class="radio_row">
    <input type="radio" id="catFinance" name="teamCategory" value="금융">
    <label for="Finance">재테크</label>

    <input type="radio" id="catPhoto" name="teamCategory" value="사진">
    <label for="Photo">사진</label>

    <input type="radio" id="catMusic" name="teamCategory" value="음악">
    <label for="Music">음악</label>

    <input type="radio" id="catArt" name="teamCategory" value="미술">
    <label for="Art">미술</label>
  </div>

  <div class="radio_row">
    <input type="radio" id="catArch" name="teamCategory" value="건축">
    <label for="Arch">건축</label>

    <input type="radio" id="catVideo" name="teamCategory" value="영상편집">
    <label for="Video">영상편집</label>

    <input type="radio" id="catFashion" name="teamCategory" value="패션">
    <label for="Fashion">패션</label>

    <input type="radio" id="catEng" name="teamCategory" value="공학">
    <label for="Eng">공학</label>
  </div>
</div>

               </div><br>

               <div class="studycontent_box">
                  <label>여러분의 스터디를 소개해 주세요</label>
                  <input type="text" name="teamInfo" class="form-control" placeholder="개설하실 스터디에 대해 설명해주세요.">
               </div>


               <button type="submit" class="btn btn-primary submit-btn">팀 생성하기</button>
               <button type="reset" class="btn btn-primary reset-btn">돌아가기</button>
            </div>
         </div>
        
      </form>
   </main>

   
   <script src="js/teamCreate.js"></script>
</body>
</html>
