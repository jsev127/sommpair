class Review < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :class_name => "UserProfile"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    wine.to_s
  end

end
