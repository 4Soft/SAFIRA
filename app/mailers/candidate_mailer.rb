# -*- encoding : utf-8 -*-
class CandidateMailer < ActionMailer::Base
  default from: "safira.4soft@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.candidate_mailer.send_confirmation.subject
  #
  def send_confirmation(selection_process, candidate)
    @candidate = candidate
    @selection_process = selection_process

    mail to: candidate.email, subject: "[#{selection_process.enterprise.name}] Cadastro confirmado"
  end

end
