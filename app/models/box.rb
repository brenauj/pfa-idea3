class Box < ActiveRecord::Base
  belongs_to :user
  has_many :ideas

  attr_accessible :description, :name

  validates_presence_of :name, :description
  validates_length_of :name, :minimum => 6
end
