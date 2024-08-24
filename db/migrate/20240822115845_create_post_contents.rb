class CreatePostContents < ActiveRecord::Migration[6.1]
  def change
    create_table :post_contents do |t|
      t.integer :post_id, null: false
      t.integer :like_id, null: false

      t.timestamps
    end
  end
end
