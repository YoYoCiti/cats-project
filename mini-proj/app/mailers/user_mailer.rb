class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.subscription_notice.subject
  #
  def subscription_notice(user, cat)
    @user = user
    @cat = cat
    mail to: user.email, subject: "Subscription Confirmation"
  end
end
