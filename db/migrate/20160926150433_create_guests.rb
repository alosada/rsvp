class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :email
      t.string :full_name
      t.boolean :attending
      t.integer :plus
      t.timestamps null: false
    end
  end
end
