class ApplicationMailer < ActionMailer::Base
  # default from: "yoman@inter-log.co.il"
  default from: "postmaster@no-reply.bdoadmin.co.il"
  layout "mailer"
end
