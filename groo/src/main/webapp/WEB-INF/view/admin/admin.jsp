<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html style="overflow: hidden;">
<head>
<meta charset="UTF-8">
<title></title>
</head>
<link href="css/base.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
class CustomUserDeletRenderer {
    constructor(props) {
      const el = document.createElement('button');
      
      el.className = 'my-delete-button';
      el.textContent = '삭제';
      
      el.addEventListener('click', (event) => {
          this.onClick(props, event);
      });
      
      this.el = el;
      this.render(props);
    }

    getElement() {
      return this.el;
    }

    render(props) {
      this.el.value = String(props.value);
    }
    
    onClick(props, event) {
    	
        const { grid, rowKey } = props;
        
        // 여기에 실제로 삭제 로직을 구현합니다.
        console.log(rowKey);
        
        // 예시: 해당 행을 그리드에서 제거
        grid.removeRow(rowKey); 
        
        // 버튼 클릭 후 포커스 이동 방지
        event.stopPropagation();
    }
}

class CustomUserBtnRenderer {
    constructor(props) {
      const container = document.createElement('div');
      container.className = 'btn-renderer-container';
      
      const updateBtn = document.createElement('button');
      const deleteBtn = document.createElement('button');
      
      updateBtn.className = 'user-randarer-button';
      updateBtn.textContent = '저장';
      updateBtn.dataset.type = 'update';
      
      deleteBtn.className = 'user-randarer-button';
      deleteBtn.textContent = '삭제';
      deleteBtn.dataset.type = 'delete';
      
      
      updateBtn.addEventListener('click', (event) => {
          this.onClick(props, event);
      });
      
      deleteBtn.addEventListener('click', (event) => {
          this.onClick(props, event);
      });
      
      container.appendChild(updateBtn);
      container.appendChild(deleteBtn);
      
      this.container = container;
      
      this.render(props);
    }

    getElement() {
      return this.container;
    }

    render(props) {
/*       this.container.value = String(props.value); */
    }
    
    onClick(props, event) {
    	
        const { grid, rowKey } = props;
        const targetBtn = event.target.closest('button'); //클릭된 버튼 식별
        
        console.log("클릭");
        
        if (!targetBtn) return;
        
        const actionType = targetBtn.dataset.type;
        
        if (actionType === 'delete') {
            // 삭제 기능 구현
            grid.removeRow(rowKey);
            console.log("삭제"+rowKey);
        } else if (actionType === 'update') {
            // 수정 기능 구현 (예: 특정 셀 편집 모드로 전환 또는 팝업 열기)
            console.log("저장"+rowKey);
        }
        // 버튼 클릭 후 포커스 이동 방지
        event.stopPropagation();
    }
}

</script>
</html>