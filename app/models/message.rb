class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  attr_accessor :tempkey
  after_create_commit { MessageBroadcastJob.perform_later(self) }

end
