class Winery < ApplicationRecord
  # Direct associations

  belongs_to :region

  has_many   :wines,
             :dependent => :nullify

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
