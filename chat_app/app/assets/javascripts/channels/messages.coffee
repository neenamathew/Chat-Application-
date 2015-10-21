App.messages = App.cable.subscriptions.create 'MessagesChannel' ,

  received: (data) ->
    $('#messages').append @renderMessage(data)

  renderMessage: (data) ->
    "<p><b>[#{data.username}]:</b> #{data.message}</p>"    

  appear: (value) ->
    @perform 'appear', m: value

$(document).on 'page:load', ->
  $('body').on 'click', 'div.m', ->
   value = $(this).attr("value")
   App.messages.appear(value)