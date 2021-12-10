class CountryResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string

  # Direct associations

  has_many :regions

  # Indirect associations

  has_many :wineries do
    assign_each do |country, wineries|
      wineries.select do |w|
        w.id.in?(country.wineries.map(&:id))
      end
    end
  end
end
