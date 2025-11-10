<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.demo-section {
	max-width: 1200px;
	margin: 0 auto;
}

.radio-item {
	cursor: pointer;
	transition: all 0.2s;
}

.radio-item:hover {
	background-color: #f8f9fa;
}

.form-check-input:checked ~ .form-check-label {
	font-weight: 500;
}

.modal-header {
	border-bottom: 1px solid #dee2e6;
}

.modal-footer {
	border-top: 1px solid #dee2e6;
}

.char-count {
	font-size: 0.875rem;
	color: #6c757d;
}

.alert-warning {
	font-size: 0.875rem;
}

.toast-container {
	position: fixed;
	bottom: 20px;
	left: 50%;
	transform: translateX(-50%);
	z-index: 1090;
}

#detailSection {
	display: none;
}
</style>
</head>

<body>
	<div class="modal fade" id="reportModal" tabindex="-1"
		aria-labelledby="reportModalLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<!-- 모달 헤더 -->
				<div class="modal-header">
					<h5 class="modal-title fw-bold" id="reportModalLabel">
						<i class="bi bi-flag-fill text-danger me-2"></i>게시글 신고하기
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<!-- 모달 바디 -->
				<div class="modal-body">
					<form id="reportForm">
						<!-- 신고 사유 선택 -->
						<div class="mb-4">
							<label class="form-label fw-semibold"> 신고 사유 선택 <span
								class="text-danger">*</span>
							</label>

							<div class="list-group">
								<label class="list-group-item radio-item"> <input
									class="form-check-input me-2" type="radio" name="reportReason"
									value="스팸/광고성 게시글" id="reason1" required> <span
									class="form-check-label">스팸/광고성 게시글</span>
								</label> <label class="list-group-item radio-item"> <input
									class="form-check-input me-2" type="radio" name="reportReason"
									value="욕설/혐오 발언" id="reason2"> <span
									class="form-check-label">욕설/혐오 발언</span>
								</label> <label class="list-group-item radio-item"> <input
									class="form-check-input me-2" type="radio" name="reportReason"
									value="허위 정보 유포" id="reason3"> <span
									class="form-check-label">허위 정보 유포</span>
								</label> <label class="list-group-item radio-item"> <input
									class="form-check-input me-2" type="radio" name="reportReason"
									value="개인정보 노출" id="reason4"> <span
									class="form-check-label">개인정보 노출</span>
								</label> <label class="list-group-item radio-item"> <input
									class="form-check-input me-2" type="radio" name="reportReason"
									value="음란물/부적절한 콘텐츠" id="reason5"> <span
									class="form-check-label">음란물/부적절한 콘텐츠</span>
								</label> <label class="list-group-item radio-item"> <input
									class="form-check-input me-2" type="radio" name="reportReason"
									value="저작권 침해" id="reason6"> <span
									class="form-check-label">저작권 침해</span>
								</label> <label class="list-group-item radio-item"> <input
									class="form-check-input me-2" type="radio" name="reportReason"
									value="other" id="reason7"> <span
									class="form-check-label">기타 (직접 입력)</span>
								</label>
							</div>
						</div>

						<!-- 상세 설명 (기타 선택 시에만 표시) -->
						<div class="mb-3" id="detailSection">
							<label for="reportDetail" class="form-label fw-semibold">
								상세 설명 <span class="text-danger">*</span>
							</label>
							<textarea class="form-control" id="reportDetail"
								name="reportDetail" rows="4" placeholder="신고 사유를 자세히 설명해 주세요"
								maxlength="500"></textarea>
							<div class="d-flex justify-content-end mt-1">
								<small class="char-count"> <span id="charCount">0</span>
									/ 500
								</small>
							</div>
						</div>

						<!-- 경고 문구 -->
						<div class="alert alert-warning d-flex align-items-center mb-0"
							role="alert">
							<i class="bi bi-exclamation-triangle-fill me-2"></i>
							<div>허위 신고 시 서비스 이용에 제한이 있을 수 있습니다.</div>
						</div>
					</form>
				</div>

				<!-- 모달 푸터 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-danger" id="submitReport"
						disabled>
						<i class="bi bi-check-circle me-1"></i>신고하기
					</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	var reportCommentId = '';
	reportInsert = (memReporter,boardId,comentId,reportContent) => {
		$.ajax({
			url : 'reportinsert.do', // 실제 서버 URL로 변경
			type : 'POST',
			data : {
				memReporter : memReporter,
				boardId : boardId,
				comentId : comentId,
				reportContent : reportContent
			},
			success : function(response) {
				// 모달 닫기
				$('#reportModal').modal('hide');
			},
			error : function(xhr, status, error) {
				alert('신고 처리 중 오류가 발생했습니다.');
				console.error('Error:', error);
			}
		});
	}

	$(document).ready(function() {
		
		const memReporter = sessionStorage.getItem('userId');
		const queryString = window.location.search;
		const urlParams = new URLSearchParams(queryString);
		const boardId = urlParams.get('id');
		
		$('#reportDetail').on('input', function() {
			$('#charCount').text($(this).val().length);			
		});
		$('.comment-report').on('click', function() {
		});
		// 신고 사유 선택 시
		$('input[name="reportReason"]').on('change', function() {
			var selectedValue = $(this).val();

			// 기타 선택 시 상세 설명 표시
			if (selectedValue === 'other') {
				$('#detailSection').slideDown(300);
				$('#reportDetail').prop('required', true);
				// 기타 선택 시 상세설명 입력해야 버튼 활성화
				checkSubmitButton();
			} else {
				$('#detailSection').slideUp(300);
				$('#reportDetail').prop('required', false).val('');
				$('#charCount').text('0');
				$('#submitReport').prop('disabled', false);
			}
		});
		
		$('#reportPostBtn').on('click', function(){
			reportCommentId = '';
		});
		
		// 기타 선택 시 상세설명 입력 확인
		$('#reportDetail').on('input', function() {
			checkSubmitButton();
		});

		function checkSubmitButton() {
			var selectedReason = $('input[name="reportReason"]:checked').val();
			if (selectedReason === 'other') {
				var detailValue = $('#reportDetail').val().trim();
				$('#submitReport').prop('disabled', detailValue.length === 0);
			}
		}

		// 신고하기 버튼 클릭
		$('#submitReport').on('click', function() {
			var selectedReason = $('input[name="reportReason"]:checked').val();
			var reportDetail = $('#reportDetail').val();

			if (selectedReason) {
				if (selectedReason == 'other') {
					selectedReason = reportDetail;
				}
				reportInsert(memReporter,boardId,reportCommentId,selectedReason);
			}
		});

		// 모달 닫힐 때 폼 초기화
		$('#reportModal').on('hidden.bs.modal', function() {
			$('#reportForm')[0].reset();
			$('#detailSection').hide();
			$('#charCount').text('0');
			$('#submitReport').prop('disabled', true);
			$('#reportDetail').prop('required', false);
		});
	});
</script>
</html>