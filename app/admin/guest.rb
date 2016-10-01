ActiveAdmin.register Guest do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :full_name, :email, :plus

form do |f|
  inputs 'Details' do
    input :email
    input :full_name
    input :plus
  end
  actions
end


end