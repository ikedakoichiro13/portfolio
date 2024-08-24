class CreateLikeLists < ActiveRecord::Migration[6.1]
  def change
    create_table :like_lists do |t|
      t.integer :like_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
