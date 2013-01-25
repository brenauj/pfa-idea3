class Box < ActiveRecord::Base
  belongs_to :user
  has_many :ideas
  has_many :comments, :as => :commentable

  attr_accessible :description, :name

  validates_presence_of :name, :description
  validates_length_of :name, :minimum => 6
end
