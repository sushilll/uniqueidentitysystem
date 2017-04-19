/**
 * Created by Sushil on 26-02-2017.
 */
 //scroll to about div
$("#about").click(function() {
    $('html,body').animate({
        scrollTop: $(".middle").offset().top}, 'slow');
});
$("#banner").click(function() {
    $('html,body').animate({
        scrollTop: $(".middle").offset().top}, 'slow');
});


function checkSignupForm(form) {
    if(form.pwd1.value != form.pwd2.value){
        form.pwd2.focus();
        return false;
    }
    return true;
}