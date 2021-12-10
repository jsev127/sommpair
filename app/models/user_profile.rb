class UserProfile < ApplicationRecord
  include JwtToken
  # Direct associations

  has_many   :reviews,
             foreign_key: "user_id",
             dependent: :destroy

  has_many   :bookmarks,
             foreign_key: "user_id",
             dependent: :destroy

  # Indirect associations

  has_many   :wines_tasted,
             through: :reviews,
             source: :wine

  # Validations

  validates :username, presence: true

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
