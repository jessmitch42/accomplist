class Item < ApplicationRecord
  belongs_to :list
  belongs_to :current_list, class_name: 'List'

  validates :title, presence: true
  validates :points, presence: true
  validates :list_id, presence: true
  validates :points, numericality: { only_integer: true }
end
