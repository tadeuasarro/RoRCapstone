# frozen_string_literal: true

# :nodoc:
class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id

  has_many :followed_relations, class_name: 'Following', foreign_key: :followed_id
  has_many :followers, through: :followed_relations

  has_many :follower_relations, class_name: 'Following', foreign_key: :follower_id
  has_many :followeds, through: :follower_relations
end
