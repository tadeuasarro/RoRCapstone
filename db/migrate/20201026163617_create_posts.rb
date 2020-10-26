# frozen_string_literal: true

# :nodoc:
class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :author_id
      t.text :text

      t.timestamps
    end
  end
end
