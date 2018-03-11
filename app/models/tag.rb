class Tag < ApplicationRecord
  has_many :item_tags
  has_many :items, through: :item_tags

  validates :name, uniqueness: true


  def self.users_tags(id)
    tags = []
    self.all.each do |tag|
      tag.items.each do |item|
        if item.list.user_id == id && !tags.include?(tag)
          tags << tag
        end
      end
    end
    tags
  end

end
