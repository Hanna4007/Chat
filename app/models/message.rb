class Message < ApplicationRecord
  belongs_to :user
  belongs_to :channel
 
  broadcasts_to :channel, target: "all_messages", partial: "messages/list_messages"
end
