class Idea < ActiveRecord::Base
  belongs_to :box
  belongs_to :user
  has_many :comments, :as => :commentable

  NONE = 0
  VALIDATED = 1
  REFUSED = 2
  OFFICIAL = 3

  Status = [ "NONE",
             "VALIDATED",
             "REFUSED",
             "OFFICIAL" ]

  attr_accessible :description, :name, :box_id, :status

  validates_presence_of :name, :description
  validates_length_of :name, :minimum => 6
end
