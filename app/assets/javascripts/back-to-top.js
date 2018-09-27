$(document).ready(function(){
     $(window).scroll(function () {
            if ($(this).scrollTop() > 250) {
                $('.back-to-top').fadeIn();
            } else {
                $('.back-to-top').fadeOut();
            }
        });
        // scroll body to 0px on click
        $('.back-to-top').click(function (event) {
            event.preventDefault();
            $('.back-to-top').tooltip('hide');
            $('body,html').animate({
                scrollTop: 0
            }, 800);
            return false;
        });
        
        $('.back-to-top').tooltip('show');
});