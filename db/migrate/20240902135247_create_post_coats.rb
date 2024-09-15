class CreatePostCoats < ActiveRecord::Migration[6.1]
  def change
    create_table :post_coats do |t|
      t.integer :post_id, null: false
      t.integer :coat_id, null: false

      t.timestamps
    end
  end
end
