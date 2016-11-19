class BaseMailer < ActionMailer::Base
  require 'rest-client'
 
  default from: 'no-reply@aleyaudrey.com'
 
  def invite(guest)
    guest.invite_sent = true
    guest.save
    @guest = guest
    if guest.mex
      subject = "Audrey y Ale se casan en Mexico!"
    else
      subject = "Audrey y Ale se casan!"
    end
    mail(to: @guest.email, subject: subject)
  end

end

# BaseMailer.invite(Guest.find(638)).deliver_now