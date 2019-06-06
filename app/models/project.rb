class Project < ApplicationRecord
  has_ancestry
  belongs_to :user

  validates :todoist_id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :color, presence: true
end
