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

  has_one    :country

  filter :country_id, :integer do
    eq do |scope, value|
      scope.eager_load(:country).where(regions: { country_id: value })
    end
  end
end
