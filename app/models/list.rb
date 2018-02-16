class List < ApplicationRecord
  belongs_to :user
  has_many :items

  validates :date, presence: true

end
