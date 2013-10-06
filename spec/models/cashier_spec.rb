require 'spec_helper'

describe Cashier do

  it {should belongs_to :enterprise}

  it {should has_many :releases}

end
