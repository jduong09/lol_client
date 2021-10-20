class Friendship < ApplicationRecord

  belongs_to(
    :follower,
    class_name: 'User',
    foreign_key: 'to_user'
  )

  belongs_to(
    :followed,
    class_name: 'User',
    foreign_key: 'from_user'
  )
end