class UserProfileResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :first_name, :string
  attribute :last_name, :string
  attribute :username, :string

  # Direct associations

  has_many   :reviews,
             foreign_key: :user_id

  has_many   :bookmarks,
             foreign_key: :user_id

  # Indirect associations

end
