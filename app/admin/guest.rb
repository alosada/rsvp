ActiveAdmin.register Guest do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :full_name, :email, :plus

  collection_action :send_invites, method: :post do
    collection.each do |guest|
      BaseMailer.test(guest).deliver_now
    end
    redirect_to :back, notice: "emails sent!"
  end

  action_item only: :index do
    link_to 'Send invites!', send_invites_admin_guests_path, method: :post
  end


form do |f|
  inputs 'Details' do
    input :email
    input :full_name
    input :plus
  end
  actions
end


end