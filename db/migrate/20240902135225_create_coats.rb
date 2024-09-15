class CreateCoats < ActiveRecord::Migration[6.1]
  def change
    create_table :coats do |t|
      t.string "name", null: false

      t.timestamps
    end
    
    Coat.create(name: 'もふもふ')
    Coat.create(name: 'さらさら')
    Coat.create(name: 'もじゃもじゃ')
    Coat.create(name: 'くるくる')
    Coat.create(name: '硬い')
    Coat.create(name: '長い')
    Coat.create(name: '短い')
    Coat.create(name: '毛がない')
  end
end
