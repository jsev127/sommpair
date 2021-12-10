class UserProfile < ApplicationRecord
  # Direct associations

  has_many   :bookmarks,
             :foreign_key => "user_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :username, :presence => true

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
