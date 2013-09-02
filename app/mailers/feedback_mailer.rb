# -*- encoding : utf-8 -*-
class FeedbackMailer < ActionMailer::Base
  default from: "safira.4soft@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.feedback_mailer.public_feedback.subject
  #
  def send_public_feedback(feedback)
    @feedback = feedback

    @candidate = feedback.candidate
    @process_step = feedback.process_step
    @selection_process = @process_step.selection_process
    @enterprise = @selection_process.enterprise

    mail to: feedback.candidate.email, subject: "[#{@enterprise.name}] Feedback da etapa #{@process_step.name}"
  end
end

