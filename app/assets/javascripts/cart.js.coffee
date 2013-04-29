jQuery ($) ->
  cartDiv = $("div.shop-cart")
  current_product_quantity = 0
  cartDiv.delegate "input.txt-product-quantity", "focusin", (event) ->
    current_product_quantity = $(this).val()

  cartDiv.delegate "input.txt-product-quantity", "change", (event) ->
    event.preventDefault()
    if isNaN($(this).val())
      alert $(this).data("invalid-value")
      $(this).val current_product_quantity
    else
      $.ajax
        dataType: "script"
        url: $(this).data("path") + ".js"
        type: "PUT"
        data:
          quantity: $(this).attr("value")


  cartDiv.delegate "a.btn-remove-from-cart", "click", (event) ->
    event.preventDefault()
    $.ajax
      dataType: "script"
      url: $(this).attr("href")
      type: "DELETE"

