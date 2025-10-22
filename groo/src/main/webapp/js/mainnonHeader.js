$(() => {
	$('#login').click(()=>{
		window.location.href = 'login.do';
	});
	
	$('#signUp').click(()=>{
		window.location.href = 'signup.do';
	});
	
	$('#logo').click(()=> {
		sessionStorage.setItem('main_last_view','mainhome.do');
		window.location.href = 'main.do'
	});
	
});
