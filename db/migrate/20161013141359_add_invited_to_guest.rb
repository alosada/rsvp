class AddInvitedToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :invite_sent, :boolean, default: false
  end
end
