class List < ApplicationRecord
  belongs_to :user
  has_many :items

  validates :date, presence: true
  validates :date, uniqueness: true

  def list_tags_unique #no need to display repeats
    tags = []
    self.items.each do |item|
      item.tags.each do |tag|
        tags << tag if !tags.include?(tag)
      end
    end
    tags
  end

end
