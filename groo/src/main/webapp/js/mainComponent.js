/**
 * 
 */
const mainHome = () => {
	$('.heder_container').click(function() {
		sessionStorage.setItem('admin_last_view','main.do');
		window.location.href = 'main.do';
	});
}