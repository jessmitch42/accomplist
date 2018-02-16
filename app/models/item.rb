class Item < ApplicationRecord
  belongs_to :list
  has_many :item_tags
  has_many :tags, through: :item_tags

  validates :title, presence: true
  validates :points, presence: true
  validates :list_id, presence: true
  validates :points, numericality: { only_integer: true }
end
