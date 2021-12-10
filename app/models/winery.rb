class Winery < ApplicationRecord
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
