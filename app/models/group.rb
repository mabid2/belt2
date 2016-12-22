class Group < ActiveRecord::Base
  belongs_to :user

  has_many :members
  has_many :users, through: :members

  validates :name, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 10 }
end
