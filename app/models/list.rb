class List < ApplicationRecord
  belongs_to :user
  has_many :list_items
  has_many :list_tags

  validates :date, presence: true


end
