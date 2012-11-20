class Idea < ActiveRecord::Base
  belongs_to :box
  belongs_to :user
  attr_accessible :description, :name
end
