class AddMexicoBoolean < ActiveRecord::Migration
  def change
    add_column :guests, :mex, :boolean, default: false
  end
end
