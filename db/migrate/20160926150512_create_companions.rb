class CreateCompanions < ActiveRecord::Migration
  def change
    create_table :companions do |t|
      t.string :full_name
      t.references :guest
      t.timestamps null: false
    end
  end
end
