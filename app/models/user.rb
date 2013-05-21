class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :validatable, :recoverable, :trackable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :confirmed_at, :admin

  has_many :sales
end
