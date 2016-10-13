ActiveAdmin.register Guest do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :full_name, :email, :plus

  batch_action :send_invites, method: :post do |ids|
    Guest.find(ids).each do |guest|
      BaseMailer.invite(guest).deliver_now
    end
    redirect_to :back, notice: "emails sent!"
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