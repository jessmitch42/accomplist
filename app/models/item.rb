class Item < ApplicationRecord
  belongs_to :list
  has_many :item_tags
  has_many :tags, through: :item_tags

  validates :title, presence: true
  validates :points, presence: true
  validates :list_id, presence: true
  validates :points, :inclusion => { :in => 1..3 }

  accepts_nested_attributes_for :tags

  def tags_attributes=(tag_attributes)
    tag_attributes.values.each do |tag_attribute|
      tag = Tag.find_or_create_by(tag_attribute)
      self.tags << tag
    end
  end

end
