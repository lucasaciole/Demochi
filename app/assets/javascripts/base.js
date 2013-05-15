jQuery(function($){
  $("#my_account .menu").hide();
  $("#my_account").on("click",function(){
    $("#my_account .menu").toggle();
  });
});