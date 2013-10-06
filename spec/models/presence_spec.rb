require 'spec_helper'

describe Presence do
  
	it {should belong_to (:event)}

	it {should belong_to (:entrepreneur)}

end
