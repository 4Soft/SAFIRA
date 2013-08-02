class Enterprise < User
  attr_accessible :corporate_name

  usar_como_cnpj :cnpj
end
