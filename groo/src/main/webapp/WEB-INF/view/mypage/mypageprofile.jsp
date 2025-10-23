<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>

.total_container {
	display: flex;
	margin-top : 40px;
	margin-left : 250px;
	flex-direction: row;
	align-items: flex-start;
	padding: 20px;
	gap: 30px; /* 좌우 간격 */
}

.mypage_profile_container {
	
	display: flex;
	flex-direction: column;
	align-items: center;
	width: 200px; /* 프로필 영역 폭 고정 */
}

.text_container {
	display : flex;
	gap : 15px;
	flex-direction: column;
	justify-content: center;
	width: 400px;
	margin-top : 40px;
	
}

.profile-image {
	width: 140px;
	height: 140px;
	border-radius: 50%;
	background: linear-gradient(135deg, #667eea20 0%, #764ba220 100%);
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	border: 3px solid #28a745;;
	overflow: hidden;
	position: relative;
	cursor: pointer;
	transition: all 0.3s;
}

.profile-image img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.profile-info {
	text-align: center;
	width: 100%;
	display: flex;
	flex-direction: column;
	
}

#fileInput {
	display: none;
}

.upload-btn {
	background: #9acd32;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 8px;
	cursor: pointer;
	font-size: 13px;
	font-weight: 600;
	transition: all 0.3s;
	width: 50%;
	margin-bottom: 10px;
	width: 80%;
	margin: 10px auto;
	display: block;
	box-sizing: border-box;
}

.upload-btn:hover {
	background: #7fb824;
	transform: translateY(-2px);
	box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
}

.file-name {
	font-size: 11px;
	color: #999;
	word-break: break-all;
	padding: 8px;
}
</style>
</head>
<body>
	<div class="total_container">
		<div class="mypage_profile_container">
			<div class="profile-image" id="profileImage"></div>
			<div class="profile-info">
				<div class="file-name" id="fileName"></div>
				<input type="file" id="fileInput" accept="image/*">
				<button type="button" class="upload-btn"
					onclick="document.getElementById('fileInput').click()">이미지
					업로드</button>

			</div>
		</div>
		<div>
			<div>
				<div class="text_container">
					<h6>그루에서 사용할 닉네일과 이메일을 입력해 주세요</h6>
					<input type="text" placeholder="닉네임을 작성해 주세요">
					<input type="text" placeholder="이메일을 작성해 주세요">
				</div>
			</div>
		</div>
	</div>
</body>
<script>
<!-- 프로필 미리보기 -->
function previewProfile(event) {
    const file = event.target.files[0];
    const preview = document.getElementById('profilePreview');
    if (file) {
        const reader = new FileReader();
        reader.onload = e => preview.src = e.target.result;
        reader.readAsDataURL(file);
    } else {
        preview.src = "https://i.postimg.cc/sX337p8B/user-2.png";
    }
}


	const fileInput = document.getElementById('fileInput');
	const profileImage = document.getElementById('profileImage');
	const fileName = document.getElementById('fileName');

	fileInput.addEventListener('change', function(e) {
		const file = e.target.files[0];

		if (file) {
			// 파일명 표시
			fileName.textContent = file.name;

			// 이미지 미리보기
			const reader = new FileReader();

			reader.onload = function(e) {
				// 기존 이미지가 있으면 제거
				const existingImg = profileImage.querySelector('img');
				if (existingImg) {
					existingImg.remove();
				}

				// 새 이미지 추가
				const img = document.createElement('img');
				img.src = e.target.result;
				profileImage.appendChild(img);
				profileImage.classList.add('has-image');
			}

			reader.readAsDataURL(file);
		}
	});
</script>
</html>