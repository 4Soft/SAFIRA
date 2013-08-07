# -*- encoding : utf-8 -*-
require "spec_helper"

describe FeedbackMailer do
  describe "public_feedback" do
    let(:mail) { FeedbackMailer.public_feedback }

    it "renders the headers" do
      mail.subject.should eq("Public feedback")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
