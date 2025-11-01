/**
 * 
 */

$(document).ready(
    function() {
        // 채팅창 열기
        function openChat() {
            $('#chatOverlay').addClass('active');
            $('#chatSidebar').addClass('active');
            $('body').css('overflow', 'hidden');
            // 배지 숨기기
            $('.floating-chat-btn .badge').hide();
        }
        // 채팅창 닫기
        function closeChat() {
            $('#chatOverlay').removeClass('active');
            $('#chatSidebar').removeClass('active');
            $('body').css('overflow', '');
        }
        // 버튼 클릭 이벤트
        $('#openChatBtn').on('click', openChat);
        $('#floatingChatBtn').on('click', openChat);
        $('#closeChatBtn').on('click', closeChat);
        $('#chatOverlay').on('click', closeChat);
        // 메시지 전송
        function sendMessage() {
            var message = $('#messageInput').val().trim();

            if (message !== '') {
                var currentTime = new Date()
                    .toLocaleTimeString('ko-KR', {
                        hour: '2-digit',
                        minute: '2-digit'
                    });

                var messageDiv = $('<div>').addClass('message')
                    .addClass('sent');
                var innerDiv = $('<div>');
                var contentDiv = $('<div>').addClass(
                    'message-content').text(message);
                var timeDiv = $('<div>').addClass(
                    'message-time').text(currentTime);

                innerDiv.append(contentDiv).append(timeDiv);
                messageDiv.append(innerDiv);

                var messageHtml = messageDiv;

                $('#chatMessages').append(messageHtml);
                $('#messageInput').val('');

                // 스크롤을 맨 아래로
                $('#chatMessages').scrollTop(
                    $('#chatMessages')[0].scrollHeight);

                // 자동 응답 시뮬레이션
                setTimeout(
                    function() {
                        $
                            .ajax({
                                // 데이터를 전송할 서버 URL
                                url: 'googlegenai.do',
                                // 전송 방식 (로그인/회원가입은 보통 POST 사용)
                                type: 'POST',
                                // 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
                                data: {
                                    userQuestion: message
                                },
                                // 데이터 전송 성공 시 실행
                                success: function(
                                    response) {
                                    // response는 서버에서 돌려준 데이터입니다.
                                    var htmlContent = marked
                                        .parse(response);
                                    var replyHtml = '<div class="message received">' +
                                        '<div>' +
                                        '<div class="message-content">' +
                                        htmlContent +
                                        '</div>' +
                                        '<div class="message-time">' +
                                        currentTime +
                                        '</div>' +
                                        '</div>' +
                                        '</div>';
                                    $('#chatMessages')
                                        .append(
                                            replyHtml);
                                    $('#chatMessages')
                                        .scrollTop(
                                            $('#chatMessages')[0].scrollHeight);
                                },

                                // 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
                                error: function(xhr,
                                    status, error) {}
                            });
                    }, 1000);
            }
        }

        // 전송 버튼 클릭
        $('#sendMessageBtn').on('click', sendMessage);

        // Enter 키로 전송
        $('#messageInput').on('keypress', function(e) {
            if (e.which === 13) {
                sendMessage();
            }
        });

        // ESC 키로 닫기
        $(document).on(
            'keydown',
            function(e) {
                if (e.key === 'Escape' &&
                    $('#chatSidebar').hasClass(
                        'active')) {
                    closeChat();
                }
            });
        $('#clearChatBtn').on('click', function() {
            $('#chatMessages').empty();
        });
    });