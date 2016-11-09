class LinkMailer < ApplicationMailer
  default from: 'zackforbing@gmail.com'

  def link_email(email, link)
    @link = link
    @email = email
    mail(to: email, subject: 'here is your link')
  end
