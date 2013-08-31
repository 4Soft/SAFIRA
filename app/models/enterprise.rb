# -*- encoding : utf-8 -*-
class Enterprise < User
  attr_accessible :corporate_name

  usar_como_cnpj :cnpj

  has_many :entrepreneurs
  has_many :selection_process
end
