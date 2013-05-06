jQuery(function($){
  $("#my_account .menu").hide();
  $("span.arrow").on("click",function(){
    $("#my_account .menu").toggle();
  });
});