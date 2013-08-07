# -*- encoding : utf-8 -*-
require "spec_helper"

describe CandidateMailer do
  describe "send_confirmation" do
    let(:mail) { CandidateMailer.send_confirmation }

    it "renders the headers" do
      mail.subject.should eq("Send confirmation")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
