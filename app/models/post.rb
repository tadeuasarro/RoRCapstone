# frozen_string_literal: true

# :nodoc:
class Post < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
end
