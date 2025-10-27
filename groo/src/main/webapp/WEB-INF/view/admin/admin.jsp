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
      
      const deleteBtn = document.createElement('button');
     
      
      deleteBtn.className = 'user-randarer-button';
      deleteBtn.textContent = '내용 확인';
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

        if (!targetBtn) return;
        
        const actionType = targetBtn.dataset.type;
        
        if (actionType === 'delete') {
            console.log("안녕");
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
    	
        const { grid, rowKey } = props;
        const targetBtn = event.target.closest('button'); //클릭된 버튼 식별

        if (!targetBtn) return;
        
        const actionType = targetBtn.dataset.type;
        
        if (actionType === 'delete') {
            console.log("안녕");
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

        if (!targetBtn) return;
        
        const actionType = targetBtn.dataset.type;
        
        if (actionType === 'delete') {
            console.log("안녕");
        }
        event.stopPropagation();
    }
}
</script>
</html>