jQuery ($) ->
	productsDiv = $("div#products_and_paginator")
	productsDiv.delegate "a.btn-add-to-cart", "click", (event) ->
		event.preventDefault()
		$.ajax
			dataType: "script"
			url: $(this).attr("href")
			data:
				id: $(this).data.id

			type: "POST"