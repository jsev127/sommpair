class WineryResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :address, :string
  attribute :website, :string
  attribute :region_id, :integer

  # Direct associations

  belongs_to :region

  has_many   :wines

  # Indirect associations
end
