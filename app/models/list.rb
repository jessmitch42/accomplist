class List < ApplicationRecord
  belongs_to :user
  has_many :items

  validates :date, presence: true
  validates :date, uniqueness: true

end
