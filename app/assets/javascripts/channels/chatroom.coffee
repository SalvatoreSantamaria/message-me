App.chatroom = App.cable.subscriptions.create "ChatroomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    # alert data.mod_message #data takes in a hash, here is it taking in foo from messages controller, create function, which has the message body
    $('#message-container').append(data.mod_message) #grab message container, and append data.mod_message
    scroll_bottom() #right after appended, scroll to the bottom