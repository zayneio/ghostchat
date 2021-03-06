$ ->
  messages = $('#messages')
  if $('#messages').length > 0
    messages_to_bottom = -> messages.scrollTop(messages.prop("scrollHeight"))

    messages_to_bottom()
    App.global_chat = App.cable.subscriptions.create {
        channel: "GroupsChannel"
        group_id: messages.data('group-id')
      },
      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        messages.append data['message']
        messages_to_bottom()

      send_message: (message, group_id, user_id, group_access) ->
        @perform 'send_message', message: message, group_id: group_id, user_id: user_id, group_access: group_access

    $('#new_message').submit (e) ->
      $this = $(this)
      textarea = $this.find('#message_body')
      if $.trim(textarea.val()).length > 1
        App.global_chat.send_message textarea.val(), messages.data('group-id'), messages.data('user-id'), messages.data('group-access')
        textarea.val('')
      e.preventDefault()
      return false
