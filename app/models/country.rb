class Country < ApplicationRecord
  # Direct associations

  has_many   :regions,
             dependent: :destroy

  # Indirect associations

  has_many   :wineries,
             through: :regions,
             source: :wineries

  # Validations

  # Scopes

  def to_s
    name
  end
end
