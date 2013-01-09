class User < ActiveRecord::Base
  User = 0
  Moderator = 1
  Administrator = 2

  Roles = [ "User",
            "Moderator",
            "Administrator" ]

  has_secure_password

  has_many :boxes
  has_many :ideas

  attr_accessible :name, :password, :password_confirmation, :role, :email

  validates_presence_of :name
  validates_presence_of :password, :on => :creation
  validates_uniqueness_of :name
  validates_inclusion_of :role, :in => [ User, Moderator, Administrator ]
  validates_format_of :name, :with => /^[a-zA-Z0-9_-]+$/
  validates_length_of :name, :minimum => 6
  validates_presence_of :email
  validates_format_of :email, :with => /^.+\@.+\..+$/

  include Gravtastic
  gravtastic

  def self.authenticate(login, passwd)
    find_by_name(login).try(:authenticate, passwd)
  end
end
