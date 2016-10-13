class BaseMailer < ActionMailer::Base
  require 'rest-client'
 
  default from: 'no-reply@aleyaudrey.com'
 
  def invite(guest)
    guest.invite_sent = true
    guest.save
    @guest = guest
    mail(to: @guest.email, subject: "Audrey y Ale se casan! ")
  end

end

# BaseMailer.invite(Guest.find(638)).deliver_now