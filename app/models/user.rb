class User < ApplicationRecord

  has_secure_password
  validates_uniqueness_of :username
  validates_presence_of :name, :username
  belongs_to :district

  has_many :stances
  has_many :created_views, :class_name => 'View', :foreign_key => 'creator_id'
  has_many :created_issues, :class_name => 'Issue', :foreign_key => 'creator_id'
  has_many :views, through: :stances
  has_many :issues, through: :views
end
