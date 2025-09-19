$(document).ready(function() {
        // AJAX 코드는 이 안에 작성
        $.ajax({
            url: "/groo/index",
            type: "GET",
            dataType: "json",
            success: function(data) {
				//이곳에 ~님 환영합니다.
                console.log(data);
                for (let i = 0; i < data.length; i++) {
                    const team = data[i];
                    console.log("팀 이름:", team.teamName);
                    console.log("팀장 이름:", team.userId);
                    console.log("팀 설명:", team.teamInfo);
                }
            },
            error: function(_xhr, status, error) {
                console.error("오류 발생:", status, error);
            }
        });
    });
