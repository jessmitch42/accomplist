class Item < ApplicationRecord
  belongs_to :list

  validates :title, presence: true
  validates :points, presence: true
  validates :list_id, presence: true
  validates :points, numericality: { only_integer: true }
end
