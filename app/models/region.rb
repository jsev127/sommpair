class Region < ApplicationRecord
  # Direct associations

  belongs_to :country

  has_many   :wineries,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
