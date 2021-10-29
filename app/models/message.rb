class Message < ApplicationRecord

  belongs_to(
    :sender,
    class_name: 'User',
    foreign_key: :sender_id
  )

  belongs_to(
    :receiver,
    class_name: 'User', 
    foreign_key: :receiver_id
  )

  def self.index_by_friend_id(user_id, friend_id)
    Message.where('sender_id = ? AND receiver_id = ?', user_id, friend_id)
    .or(Message.where('sender_id = ? AND receiver_id = ?', friend_id, user_id)).order("created_at")
  end

end