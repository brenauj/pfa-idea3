class Idea < ActiveRecord::Base
  belongs_to :box
  belongs_to :user

  attr_accessible :description, :name, :box_id

  validates_presence_of :name, :description
  validates_length_of :name, :minimum => 6
end
