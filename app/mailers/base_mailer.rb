class BaseMailer < ActionMailer::Base
  require 'rest-client'
 
  default from: 'no-reply@aleyaudrey.com'
 
  def test(guest)
    @guest = guest
    mail(to: @guest.email, subject: "Welcome!")
  end

end