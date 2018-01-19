class View < ApplicationRecord
  belongs_to :issue
  belongs_to :creator, :class_name => 'User'
  has_many :stances
  has_many :users, through: :stances

  def votes
    self.stances.count
  end
end
