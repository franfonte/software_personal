# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'no.reply.groups.groups@gmail.com'
  layout 'mailer'

end
