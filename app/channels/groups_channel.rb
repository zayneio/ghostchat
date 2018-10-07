class GroupsChannel < ApplicationCable::Channel

  def subscribed
    stream_from "groups_#{params['group_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    # process data sent from the page
    # iv = EncryptText.make_iv
    # key = data['group_access']
    # User.find(data['user_id']).messages.create!(
    #   tempkey: key, 
    #   body: EncryptText.encrypt(data['message'], nil, iv), 
    #   body: data['message'],
    #   group_id: data['group_id'],
    #   iv: iv
    # )
    User.find(data['user_id']).messages.create!(
      body: data['message'],
      group_id: data['group_id']
    )
  end
end