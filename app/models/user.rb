class User < ActiveRecord::Base
  User = 0
  Moderator = 1
  Administrator = 2

  Roles = [ "User",
            "Moderator",
            "Adminitrator" ]

  has_many :boxes
  has_many :ideas

  attr_accessible :name, :password, :role

  validates_presence_of :name, :password
  validates_uniqueness_of :name
  validates_inclusion_of :role, :in => [ User, Moderator, Administrator ]
  validates_format_of :name, :with => /^[a-zA-Z0-9_-]+$/
  validates_length_of :name, :minimum => 6
end
