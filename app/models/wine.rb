class Wine < ApplicationRecord
  # Direct associations

  belongs_to :category

  belongs_to :grape_varietal

  belongs_to :winery

  has_many   :reviews,
             dependent: :nullify

  has_many   :bookmarks,
             dependent: :destroy

  # Indirect associations

  has_many   :reviewers,
             through: :reviews,
             source: :user

  # Validations

  # Scopes

  def to_s
    winery.to_s
  end
end
