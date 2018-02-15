class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :lists
  has_many :list_items, through: :lists
  has_many :list_tags
  has_many :tags, through: :list_tags

  def username
    self.email.split("@")[0]
  end

  def no_lists_yet?
    current_user.lists.nil?
  end
end
