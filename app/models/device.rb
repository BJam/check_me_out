class Device < ActiveRecord::Base
  belongs_to :user
  validates :status, presence: true
  validates :name, presence: true, length: { maximum: 100 }
end
