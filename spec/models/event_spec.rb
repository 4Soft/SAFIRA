require 'spec_helper'

describe Event do
  it {should have_many (:presences)}
end
