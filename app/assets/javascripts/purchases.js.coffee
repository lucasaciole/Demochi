jQuery ($) ->
  $(".purchase-items").hide()

  $(".single-purchase").on "click", ->
    $(this).children(".purchase-items").stop().slideToggle("fast")
  
  $(".single-purchase").toggle ->
      details = $(this).children().children(".label-details")
      details.html(details.data("info-close"))
    ,->
      details = $(this).children().children(".label-details")
      details.html(details.data("info-open"))
      
  $(".purchase-items").click (event) ->
    event.stopPropagation()