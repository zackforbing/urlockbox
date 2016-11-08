class LinkMailer < ApplicationMailer
  default from: 'zackforbing@gmail.com'

  def link_email(link)
    mail(to: current_user.email, subject: here is your link)
  end
