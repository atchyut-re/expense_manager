class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :categories
  has_many :expenses, through: :categories

  after_create :create_default_categories

  DEFAULT_CATEGORIES = [
     {name: 'Phone bill'},
     {name: 'Entertainment'},
     {name: 'Rent'},
     {name: 'Travel'},
     {name: 'Parties'},
     {name: 'Gifts'},
     {name: 'Phone bill'},
     {name: 'Miscellaneous'}
  ]

  def create_default_categories
    DEFAULT_CATEGORIES.each do |default_attrs|
      self.categories.build(default_attrs)
    end
  end

end
