class Holiday < ActiveRecord::Base
  belongs_to :user

  validates :name, :date, presence:true
  validates :date, uniqueness:true
end
