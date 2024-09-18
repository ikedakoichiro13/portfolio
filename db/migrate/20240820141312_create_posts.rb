class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.string :dogcat, null: false
      t.text :title, null: false
      t.string :kinds, null: false
      t.string :age, null: false
      t.string :gender, null: false
      t.text :health_condition, null: false
      t.boolean :vaccination, null: false
      t.boolean :infertility_treatment, null: false
      t.text :features, null: false
      t.text :recruitment_area, null: false
      t.text :transfer_condition, null: false

      t.timestamps
    end
  end
end
