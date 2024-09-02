class CreatePostCoats < ActiveRecord::Migration[6.1]
  def change
    create_table :post_coats do |t|

      t.timestamps
    end
  end
end
