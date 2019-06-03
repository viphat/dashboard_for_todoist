class User < ApplicationRecord
  has_many :projects, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :todoist_id, presence: true, uniqueness: true
  validates :todoist_access_token, presence: true, uniqueness: true
  validates :full_name, presence: true
end
