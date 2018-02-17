class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook, :github]

  has_many :lists
  has_many :items, through: :lists
  has_many :list_tags
  has_many :tags, through: :list_tags

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def username
    self.email.split("@")[0]
  end

  def todays_list
    self.lists.find_or_create_by(date: Date.today)
  end

  def find_list_by_date(date)
    self.lists.find_by(date: date)
  end

  def has_list_today?
    self.lists.where("date = ?", Date.today).exists?
  end

end
