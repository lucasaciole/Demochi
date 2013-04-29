jQuery ($) ->
  fix_currency = ->
    value = $(this).val()
    validate = value.replace(",", "")
    value = ""  if isNaN(validate)
    if value is ""
      value = "0,00"
    else
      value = parseFloat(value.replace(/[R$\s]/g, "").replace(",", "."))
      value = value.toFixed(2).replace(".", ",")
    $(this).val value

  $(".form-inputs").delegate ".currency_field", "focusout", fix_currency
  $(".form-inputs").delegate ".currency_field", "focusin", ->
    $(this).val ""  if $(this).val() is "0,00"