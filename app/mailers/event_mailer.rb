class EventMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.event_mailer.participation_email.subject
  #
  def participation_email(user)
    @user = user
    @event = event
    mail(to: @event.user.email, subject: "Un nouveau participant s'est inscrit à votre évènement ;)")
  end
end
