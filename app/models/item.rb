class Item < ApplicationRecord
  belongs_to :list
  has_many :item_tags
  has_many :tags, through: :item_tags

  validates :title, presence: true
  validates :points, presence: true
  validates :list_id, presence: true
  validates :points, :inclusion => { :in => 1..3 }

  def tags_attributes=(tag_attribute)
    if tag_attribute && !tag_attribute[:name].blank?
      self.tags << Tag.find_or_create_by(name: tag_attribute[:name])
    end
  end

  def tag_ids=(ids)
   ids.each do |id|
     if !id.nil? || !id.blanks?
       tag = Tag.find(id)
       self.tags << tag if !self.tags.include?(tag)
     end
   end
 end

end
