class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.integer :post_genre_id, null: false
      t.integer :post_content_id, null: false
      t.text :title, null: false
      t.string :kinds, null: false
      t.string :age, null: false
      t.string :gender, null: false
      t.text :health_condition, null: false
      t.string :vaccination, null: false
      t.string :infertility_treatment, null: false
      t.text :features, null: false
      t.text :transfer_condition, null: false

      t.timestamps
    end
  end
end
