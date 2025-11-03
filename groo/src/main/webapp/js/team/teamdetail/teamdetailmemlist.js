// js/team/teamdetail/teamdetailmemlist.js (강퇴 버튼 추가 버전)

(function() {
    // 1. 더미 데이터 정의
    const dummyMembers = [
        { memberId: 101, name: "김철수", groupName: "Java 웹 개발", studyRoll: "스터디 장", email: "chulsoo@study.com", joinDate: "2024-01-10" },
        { memberId: 102, name: "이영희", groupName: "Java 웹 개발", studyRoll: "부반장", email: "younghee@study.com", joinDate: "2024-01-10" },
        { memberId: 103, name: "박민준", groupName: "Java 웹 개발", studyRoll: "스터디 원", email: "minjun@study.com", joinDate: "2024-02-01" },
        { memberId: 104, name: "정수민", groupName: "Java 웹 개발", studyRoll: "스터디 원", email: "sumin@study.com", joinDate: "2024-03-15" },
        { memberId: 105, name: "최지우", groupName: "Java 웹 개발", studyRoll: "스터디 원", email: "jiwoo@study.com", joinDate: "2024-04-22" }
    ];
    
    // 2. 카드를 삽입할 컨테이너를 선택
    const $container = $('#memberCardsBody');
    $container.empty();
    
    // 3. 데이터로 카드(Card) 생성 및 추가 (jQuery 사용)
    if (dummyMembers.length > 0) {
        dummyMembers.forEach(function(member) {
            
            // 🔹 1. 메인 카드 요소 생성 및 데이터 속성 추가
            const $card = $('<div>')
                .addClass('member-card')
                .data('member-id', member.memberId); 
            
            // 🔹 2. card-header 및 card-detail-list 생성 (이전과 동일)
            const $header = $('<div>').addClass('card-header');
            const $name = $('<h4>').text(member.name);
            const $group = $('<span>').addClass('card-group').text(member.groupName);
            $header.append($name, $group);
            
            const $details = $('<ul>').addClass('card-detail-list');
            const $rollItem = $('<li>').append(
                $('<strong>').text('스터디 직책:'),
                $('<span>').text(member.studyRoll)
            );
            const $emailItem = $('<li>').append(
                $('<strong>').text('이메일:'),
                $('<span>').text(member.email)
            );
            const $joinDateItem = $('<li>').append(
                $('<strong>').text('가입일:'),
                $('<span>').text(member.joinDate)
            );
            $details.append($rollItem, $emailItem, $joinDateItem);

            // 🔹 4. 버튼 컨테이너 생성 (직책 부여 / 반장 넘기기)
            const $buttonGroup = $('<div>').addClass('button-group').css({
                'display': 'flex',
                'gap': '10px',
                'margin-top': '15px'
            });

            // 4-1. 직책 부여 버튼
            const $assignRollButton = $('<button>')
                .addClass('btn assign-roll-btn') 
                .css({
                    'flex-grow': 1,
                    'padding': '8px',
                    'background-color': '#007bff',
                    'color': '#fff',
                    'border': 'none',
                    'border-radius': '4px',
                    'cursor': 'pointer',
                    'font-size': '1em'
                })
                .text('직책 부여');

            // 4-2. 반장 넘기기 버튼
            const $transferRollButton = $('<button>')
                .addClass('btn transfer-roll-btn') 
                .css({
                    'flex-grow': 1,
                    'padding': '8px',
                    'background-color': '#28a745',
                    'color': '#fff',
                    'border': 'none',
                    'border-radius': '4px',
                    'cursor': 'pointer',
                    'font-size': '1em'
                })
                .text('반장 넘기기');

            $buttonGroup.append($assignRollButton, $transferRollButton);
            
            // 🔹 5. 강퇴 버튼 생성 (새로운 행) 🆕
            const $kickButton = $('<button>')
                .addClass('btn kick-member-btn')
                .css({
                    'display': 'block',
                    'width': '100%',
                    'padding': '8px',
                    'margin-top': '10px', // 버튼 그룹과의 간격
                    'background-color': '#dc3545', // 빨간색
                    'color': '#fff',
                    'border': 'none',
                    'border-radius': '4px',
                    'cursor': 'pointer',
                    'font-size': '1em'
                })
                .text('강퇴');

            // 🔹 6. 카드에 모든 요소 추가 후 컨테이너에 삽입
            $card.append($header, $details, $buttonGroup, $kickButton); // 강퇴 버튼 추가
            $container.append($card);
        });

        // 4. 이벤트 핸들러 추가
        
        // 4-1. 직책 부여 버튼 클릭 이벤트
        $container.on('click', '.assign-roll-btn', function() {
            const $cardElement = $(this).closest('.member-card');
            const memberId = $cardElement.data('member-id');
            const memberName = $cardElement.find('.card-header h4').text();

            console.log(`[직책 부여 요청] ID: ${memberId}, 이름: ${memberName}`);
            // 모달 표시 로직으로 대체하거나 현재는 alert 유지
            alert(`${memberName}님(ID: ${memberId})의 직책을 부여/변경하는 기능을 실행합니다. (모달 필요)`);
        });

        // 4-2. 반장 넘기기 버튼 클릭 이벤트
        $container.on('click', '.transfer-roll-btn', function() {
            const $cardElement = $(this).closest('.member-card');
            const memberId = $cardElement.data('member-id');
            const memberName = $cardElement.find('.card-header h4').text();

            console.log(`[반장 넘기기 요청] ID: ${memberId}, 이름: ${memberName}`);
            alert(`${memberName}님(ID: ${memberId})에게 스터디 반장 권한을 넘기는 기능을 실행합니다. (주의: 스터디 장만 실행 가능)`);
        });

        // 4-3. 강퇴 버튼 클릭 이벤트 🆕
        $container.on('click', '.kick-member-btn', function() {
            const $cardElement = $(this).closest('.member-card');
            const memberId = $cardElement.data('member-id');
            const memberName = $cardElement.find('.card-header h4').text();

            if (confirm(`경고: ${memberName}님(ID: ${memberId})을 스터디에서 강퇴하시겠습니까? 이 작업은 되돌릴 수 없습니다.`)) {
                console.log(`[강퇴 요청] ID: ${memberId}, 이름: ${memberName}`);
                // TODO: 여기에 AJAX를 사용하여 백엔드에 강퇴 요청을 하는 코드를 구현합니다.
                alert(`${memberName}님(ID: ${memberId}) 강퇴 요청을 서버에 전송했습니다.`);
                // 성공 시, $cardElement.remove(); 를 실행하여 카드를 제거할 수 있습니다.
            }
        });

    } else {
        // 멤버가 없을 경우 메시지 표시
        $container.append('<p style="text-align: center; width: 100%; color: #888; margin-top: 20px;">해당 팀의 인원이 없습니다.</p>');
    }
})();