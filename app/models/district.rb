class District < ApplicationRecord
  has_many :users
  has_many :stances, through: :users
  has_many :views, through: :stances
  has_many :issues, through: :views

  def unique_issues
    self.issues.uniq
  end

  def district_votes(issue)
    issue.district_votes(self.id)
  end

  def district_importance(issue)
    district_stances = self.stances.select{|s| s.issue === issue}
    district_stances.inject(0.0){|sum, s| sum + s.importance}.to_f / district_stances.length
  end

  def district_attitude(issue)
    district_views = self.views.select{|s| s.issue === issue}
    district_views.inject(0.0){|sum, v| sum + v.attitude}.to_f / district_views.length
  end

  def issue_summary
    self.issues.uniq.map{|i| {issue: i, district_votes: self.district_votes(i), district_importance: self.district_importance(i), district_attitude: self.district_attitude(i)} }
  end

end
