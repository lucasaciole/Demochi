jQuery(function($){
	var search_field = $("input#search_field");

	$("#search_form").on("submit", function(event){
    event.preventDefault();
    $.ajax({
      dataType: "script",
      url: this.action,
      data: $(this).serialize()
    })
  }); 

  search_field.on("keyup", function() {
    if (search_field.val() === "") {
      $("#search_form").submit();
    }
  });
});