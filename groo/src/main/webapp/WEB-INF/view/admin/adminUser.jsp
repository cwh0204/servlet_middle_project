<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="css/base.css" rel="stylesheet">
<style>
.a_r_t_box {
	height: 100px;
	padding: 20px;
}

.a_r_m_box {
	height: calc(100% - 100px);
	padding: 20px;
}
</style>
</head>
<body>
	<div class="a_r_container">
		<div class="a_r_m_box">
			<div>
				<button>저장</button>
			</div>
			<div id="grid"></div>
		</div>
	</div>
</body>
<script type="text/javascript">

$(document).ready(function() {
	const grid = new tui.Grid({
		el : document.getElementById('grid'),
		data : {
			api : {
				readData : {
					url : 'https://koreanjson.com/users',
					method : 'GET',
				}
			},
		},
		scrollX : true,
		scrollY : true,
		columns : [ {
			header : 'ID',
			name : 'id'
		}, {
			header : '이름',
			name : 'name',
			editor : 'text'
		}, {
			header : '유저',
			name : 'username',
			editor : 'text'
		}, {
			header : '이메일',
			name : 'email',
			editor : 'text'
		}, {
			header : '전화번호',
			name : 'phone',
			editor : 'text'
		} ]
	});

	grid.on('response', function(ev) {
		let response = ev.xhr.responseText;
		let data = JSON.parse(response);
		grid.resetData(data);
	});
	
    grid.on('afterChange', ev => {
    	console.log('after change:', ev.changes[0].columnName);
        console.log('after change:', ev.changes[0].value);
        console.log(grid.getModifiedRows());
    });
    grid.setBodyHeight(600); 
});
</script>
</html>