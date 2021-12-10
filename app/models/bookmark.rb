class Bookmark < ApplicationRecord
  # Direct associations

  belongs_to :wine

  belongs_to :user,
             class_name: "UserProfile"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end
end
