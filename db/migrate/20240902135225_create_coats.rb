class CreateCoats < ActiveRecord::Migration[6.1]
  def change
    create_table :coats do |t|

      t.timestamps
    end
  end
end
