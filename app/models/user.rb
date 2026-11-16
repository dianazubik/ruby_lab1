
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { user: 0, admin: 1 }

  has_many :conference_sessions, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
