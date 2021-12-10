class Category < ApplicationRecord
  enum name: {"red"=>0, "white"=>1, "ros"=>2, "sparkling"=>3, "dessert"=>4, "fortified"=>5} 

  # Direct associations

  has_many   :wines,
             :dependent => :nullify

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
