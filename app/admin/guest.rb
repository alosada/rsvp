ActiveAdmin.register Guest do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :full_name, :email, :plus, :mex, :attending

  batch_action :send_invites, method: :post do |ids|
    Guest.find(ids).each do |guest|
      BaseMailer.invite(guest).deliver_now
    end
    redirect_to :back, notice: "emails sent!"
  end

  index do
    selectable_column
    id_column
    column :email
    column :full_name
    column :plus
    column :viewed
    column :attending
    column :invite_sent
    column :mex
    column :updated_at
    actions
  end

end