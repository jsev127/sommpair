class CategoryResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string_enum, allow: Category.names.keys

  # Direct associations

  has_many :wines

  # Indirect associations
end
