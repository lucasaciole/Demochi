jQuery ($) ->
	$("div#products_and_paginator").on "click", "#paginator a", (event) ->
  	event.preventDefault()
  	$.getScript @href