# -*- encoding : utf-8 -*-
class CandidateMailer < ActionMailer::Base
  default from: "boladaodeamor123@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.candidate_mailer.send_confirmation.subject
  #
  def send_confirmation(candidate)
    @candidate = candidate

    mail to: candidate.email, subject: "[#{candidate.selection_process.enterprise.name}] Cadastro confirmado"
  end

end