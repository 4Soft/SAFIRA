require 'spec_helper'

describe Cashier do

  it {should belong_to :enterprise}

  it {should have_many :releases}

end
