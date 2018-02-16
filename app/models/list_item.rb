class ListItem < ApplicationRecord
  belongs_to :list
  belongs_to :item

  validates :title, presence: true
  validates :points, presence: true
  validates :list_id, presence: true
  validates :points, numericality: { only_integer: true }
end
