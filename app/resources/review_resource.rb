class ReviewResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :wine_id, :integer
  attribute :comment, :string
  attribute :rating, :string
  attribute :user_id, :integer

  # Direct associations

  belongs_to :user,
             resource: UserProfileResource

  # Indirect associations

end
