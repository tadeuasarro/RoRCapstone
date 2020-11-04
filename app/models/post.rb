# :nodoc:
class Post < ApplicationRecord
  validates :text,
            presence: true,
            length: { minimum: 1, maximum: 200 }

  belongs_to :user, foreign_key: :author_id
end
