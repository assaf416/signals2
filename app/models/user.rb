class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :activities
  has_many :notes

  has_many :imports

  def self.demo_roles
    for u in User.all
      u.role = ["מנהל קרן", "כלכלן", "אדמין", "משקיע", "נאמן מס"]
    end
  end
end
