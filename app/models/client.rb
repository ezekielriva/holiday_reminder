class Client < ActiveRecord::Base
  belongs_to :user

  validates :email, :name, presence:true
  validates :email, uniqueness:true
end
