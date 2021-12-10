class WineResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :winery_id, :integer
  attribute :grape_varietal_id, :integer
  attribute :vintage, :integer
  attribute :category_id, :integer
  attribute :description_id, :integer

  # Direct associations

  belongs_to :category

  belongs_to :grape_varietal

  belongs_to :winery

  has_many   :reviews

  has_many   :bookmarks

  # Indirect associations

  many_to_many :reviewers,
               resource: UserProfileResource

end
