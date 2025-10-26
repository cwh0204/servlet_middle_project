$(document).ready(function() {
    $('.hot-study-card').on('click', function() {
		console.log("ASdas");
        const url = $(this).data('link-url'); 
        
        if (url) {
            window.location.href = url;
        }
    });
});