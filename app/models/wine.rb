class Wine < ApplicationRecord
  # Direct associations

  belongs_to :grape_varietal

  belongs_to :winery

  has_many   :reviews,
             :dependent => :nullify

  has_many   :bookmarks,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    winery.to_s
  end

end
