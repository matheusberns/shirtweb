user = document.getElementById("#user")

App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
# Called when the subscription is ready for use on the server

  disconnected: ->
# Called when the subscription has been terminated by the server

  received: (data) ->
#alert(data['message'])
    $('#messages').append data['message']


  speak: (message) ->

    @perform 'speak', message: message, created_by: ''

#$('#messages').append data['message']


# FIXME sdgkljsddsgkljsdgkljs
$(document).on 'keypress', '[data-behavior~=chat_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    App.chat.speak event.target.value
    event.target.value = ""
    $('#chat-box').animate {'scrollTop': $(document).height()}, 8
    event.preventDefault()
