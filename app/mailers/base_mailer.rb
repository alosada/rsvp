class BaseMailer < ActionMailer::Base
  require 'rest-client'
 
  default from: 'no-reply@aleyaudrey.com'
 
  def welcome_email(user)
    mail(to: user.email, subject: "Welcome!")
  end

  def test_api
    api = 'key-24fd6ca31a5b16160796a3ca4de2be98'
    dom = 'appddd01dc7e1c44ac6b2778f374c67da29.mailgun.org'
    url = "https://api:#{api}@api.mailgun.net/v3/#{dom}/messages"

    RestClient.post url,
      :from => "Excited User <noreply@voyono.com>",
      :to => "Bob <alosada@gmail.com>",
      :subject => "This is subject",
      :text => "Text body",
      :html => "<b>HTML</b> version of the body!"
  end
end