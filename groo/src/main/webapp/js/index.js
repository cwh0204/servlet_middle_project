$(document).ready(function() {
    // 이 안에 AJAX 코드를 작성
     $.ajax({
        url: "/groo/indexs.do",
        type: "GET",
        dataType: "json",
        success: function(data) {
            console.log(data);
             for (let i = 0; i < data.length; i++) {
                const team = data[i];
                console.log("팀 이름:", team.teamName);
                console.log("팀장 이름:", team.userId);
                console.log("팀 설명:", team.teamInfo);
            }
        },
        error: function(xhr, status, error) {
            console.error("오류 발생:", status, error);
        }
    });
});  