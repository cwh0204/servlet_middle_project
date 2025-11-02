<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html style="overflow: hidden;">
<head>
<meta charset="UTF-8">
<title></title>
</head>
<link href="css/base.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<script src="js/adminComponent.js"></script>
<style>

body {
	min-width: 1080px;
}
.admin_container {
	height: calc(100% - 70px);
}
.a_r_container {
	width: calc(100% - 260px);
	height: 100%;
	background: #f8faf9;
	padding: 30px 40px;
	overflow: scroll;
	overflow-x: hidden;
}

</style>
<script src="jquery/jquery-3.7.1.min.js"></script>
<body>
	<%@ include file="../frontComponents/adminheader.jsp"%>
	<div class="flex_container full_w_h admin_container">
 		<%@ include file="../frontComponents/adminnav.jsp"%>
		<div class="a_r_container">
  			<%@ include file="admindashboard.jsp"%>
		</div>
	</div>
</body>
<script type="text/javascript">

window.chartColl();
adminHome();

class CustomReportProcessBtnRenderer {
    constructor(props) {
      const container = document.createElement('div');
      container.className = 'btn-renderer-container';
      
      const reportCheckBtn = document.createElement('button');
     
      
      reportCheckBtn.className = 'user-randarer-button';
      reportCheckBtn.textContent = '내용 확인';
      reportCheckBtn.dataset.type = 'reportCheck';
      
      reportCheckBtn.addEventListener('click', (event) => {
          this.onClick(props, event);
      });
      
      container.appendChild(reportCheckBtn);
      
      this.container = container;
      
      this.render(props);
    }

    getElement() {
      return this.container;
    }

    render(props) {
       this.container.value = String(props.value);
    }
    
    onClick(props, event) {
    	
        const { grid, rowKey } = props;
        const targetBtn = event.target.closest('button'); //클릭된 버튼 식별
        
        const rowData = grid.getRow(rowKey);

        if (!targetBtn) return;
        
        const actionType = targetBtn.dataset.type;
        
        if (actionType === 'reportCheck') {
        	$('#memReporter').text(rowData.memReporter);
        	$('#reportDate').text(rowData.reportDate);
        	$('#reportContent').text(rowData.reportContent);
        	$('#memSuspect').text(rowData.memSuspect);
        	$('#confirmBtn').val(rowData.reportId);
        	$('#boardIdBtn').val(rowData.boardId);
            $("#reportCheckBtn").trigger("click");
        }
        event.stopPropagation();
    }
}

class CustomTeamBtnRenderer {
    constructor(props) {
      const container = document.createElement('div');
      container.className = 'btn-renderer-container';
      
      const deleteBtn = document.createElement('button');
     
      
      deleteBtn.className = 'user-randarer-button';
      deleteBtn.textContent = '팀삭제';
      deleteBtn.dataset.type = 'delete';
      
      deleteBtn.addEventListener('click', (event) => {
          this.onClick(props, event);
      });
      
      container.appendChild(deleteBtn);
      
      this.container = container;
      
      this.render(props);
    }

    getElement() {
      return this.container;
    }

    render(props) {
       this.container.value = String(props.value);
    }
    
    onClick(props, event) {
    	
        const { grid, rowKey} = props;
        
        const rowData = grid.getRow(rowKey);
        
        const targetBtn = event.target.closest('button'); //클릭된 버튼 식별

        if (!targetBtn) return;
        
        const actionType = targetBtn.dataset.type;
        
        if (actionType === 'delete') {
        	
        	$.ajax({
        		// 데이터를 전송할 서버 URL
        		url: 'teamdelete.do',
        		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
        		type: 'POST',
        		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
        		data: {
        			studyId: rowData.studyId
        		},
        		// 데이터 전송 성공 시 실행
        		success: function(response) {
        			// response는 서버에서 돌려준 데이터입니다.
        			searchTeam();
        		},

        		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
        		error: function(xhr, status, error) {
        		}
        	});
        }
        event.stopPropagation();
    }
}

class CustomTeamActivateBtnRenderer {
    constructor(props) {
      const container = document.createElement('div');
      container.className = 'btn-renderer-container';
      
      const activateBtn = document.createElement('button');
     
      
      activateBtn.className = 'user-randarer-button';
      activateBtn.textContent = '팀활성';
      activateBtn.dataset.type = 'activate';
      
      activateBtn.addEventListener('click', (event) => {
          this.onClick(props, event);
      });
      
      container.appendChild(activateBtn);
      
      this.container = container;
      
      this.render(props);
    }

    getElement() {
      return this.container;
    }

    render(props) {
       this.container.value = String(props.value);
    }
    
    onClick(props, event) {
    	
        const { grid, rowKey} = props;
        
        const rowData = grid.getRow(rowKey);
        
        const targetBtn = event.target.closest('button'); //클릭된 버튼 식별

        if (!targetBtn) return;
        
        const actionType = targetBtn.dataset.type;
        
        if (actionType === 'activate') {
        	
        	$.ajax({
        		// 데이터를 전송할 서버 URL
        		url: 'teamactivate.do',
        		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
        		type: 'POST',
        		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
        		data: {
        			studyId: rowData.studyId
        		},
        		// 데이터 전송 성공 시 실행
        		success: function(response) {
        			// response는 서버에서 돌려준 데이터입니다.
        			searchTeam();
        		},

        		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
        		error: function(xhr, status, error) {
        		}
        	});
        }
        event.stopPropagation();
    }
}

class CustomTeamMemberBtnRenderer {
    constructor(props) {
      const container = document.createElement('div');
      container.className = 'btn-renderer-container';
      
      const deleteBtn = document.createElement('button');
     
      
      deleteBtn.className = 'user-randarer-button';
      deleteBtn.textContent = '팀 탈퇴';
      deleteBtn.dataset.type = 'delete';
      
      deleteBtn.addEventListener('click', (event) => {
          this.onClick(props, event);
      });
      
      container.appendChild(deleteBtn);
      
      this.container = container;
      
      this.render(props);
    }

    getElement() {
      return this.container;
    }

    render(props) {
       this.container.value = String(props.value);
    }
    
    onClick(props, event) {
    	
        const { grid, rowKey } = props;
        const targetBtn = event.target.closest('button'); //클릭된 버튼 식별
        const rowData = grid.getRow(rowKey);
        
        if (!targetBtn) return;
        
        const actionType = targetBtn.dataset.type;
        
        if (actionType === 'delete') {
        	$.ajax({
        		// 데이터를 전송할 서버 URL
        		url: 'adminstudymemberdelete.do',
        		// 전송 방식 (로그인/회원가입은 보통 POST 사용)
        		type: 'POST',
        		// 서버로 보낼 데이터 (키-값 쌍의 객체 형태)
        		data: {
        			memName: rowData.memName
        		},
        		// 데이터 전송 성공 시 실행
        		success: function(response) {
        			// response는 서버에서 돌려준 데이터입니다.
        			searchTeam();
        		},

        		// 통신 실패 시 실행 (네트워크 문제, 서버 에러 등)
        		error: function(xhr, status, error) {
        		}
        	});
        }
        event.stopPropagation();
    }
}
</script>
</html>