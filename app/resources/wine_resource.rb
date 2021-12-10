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

  has_many   :reviews

  has_many   :bookmarks

  # Indirect associations

end
