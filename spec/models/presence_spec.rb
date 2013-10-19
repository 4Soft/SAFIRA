require 'spec_helper'

describe Presence do
  it {should belong_to (:entrepreneur)}
  it {should belong_to (:event)}
end
