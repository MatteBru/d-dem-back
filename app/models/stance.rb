class Stance < ApplicationRecord
  belongs_to :user
  belongs_to :view
  delegate :issue, :to => :view
end
