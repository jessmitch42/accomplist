class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]

  has_many :lists
  has_many :items, through: :lists

  validates :email, uniqueness: true

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # users to be created if they don't exist
    unless user
      user = User.create(name: data['name'],
         email: data['email'],
         password: Devise.friendly_token[0,20]
      )
    end
    user
  end

  def todays_list
    self.lists.find_or_create_by(date: Date.today, user_id: self.id)
  end

  def find_list_by_date(date)
    self.lists.find_by(date: date)
  end

  def has_list_today?
    self.lists.where("date = ?", Date.today).exists?
  end

  def has_lists?
    self.lists.exists?
  end

  def items
    items = []
    self.lists.each do |list|
      list.items.each { |item| items << item }
    end
    items
  end

  def user_tags_sorted
    tags = self.user_tags_used

    counter = tally_tags(tags)

    counter.sort_by {|_key, value| value}.reverse
  end

  def user_tags_used
    tags = []
    self.lists.each do |list|
      list.items.each do |item|
        item.tags.each { |tag| tags << tag }
      end
    end
    tags
  end

  def tally_tags(tags)
    counter = {}
    tags.each do |t|
      if counter[t.name]
        counter[t.name] = counter[t.name] + 1
      else
        counter[t.name] = 1
      end
    end
    counter
  end

end
