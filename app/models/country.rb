class Country < ApplicationRecord
  # Direct associations

  has_many   :regions,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
