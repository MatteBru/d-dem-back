class Issue < ApplicationRecord
  belongs_to :creator, :class_name => 'User'
  has_many :views
  has_many :stances, through: :views
  has_many :users, through: :stances

  def self.top
    self.left_joins(:stances).group(:id).order('COUNT(stances.id) DESC').limit(10).map{|i|  IssueSerializer.new(i).attributes}
  end

  def self.newest
    self.order('created_at DESC').limit(10).map{|i|  IssueSerializer.new(i).attributes}
  end

  def self.hot(period = 4)
    self.where("issues.created_at >= '#{Time.now.utc - period.hours}'").left_joins(:stances).group(:id).order('COUNT(stances.id) DESC').limit(10).map{|i|  IssueSerializer.new(i).attributes}
  end

  def votes
    self.stances.count
  end

  def district_votes(district_id)
    self.users.where(district_id: district_id).count
  end

  def top_views
    self.views.left_joins(:stances).group(:id).order('COUNT(stances.id) DESC')
  end


end
