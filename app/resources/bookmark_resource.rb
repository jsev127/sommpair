class BookmarkResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :wine_id, :integer

  # Direct associations

  belongs_to :wine

  belongs_to :user,
             resource: UserProfileResource

  # Indirect associations

end
