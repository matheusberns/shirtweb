# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'matheusberns@gmail.com'
  layout 'mailer'
end
