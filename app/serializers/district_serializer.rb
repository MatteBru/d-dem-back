class DistrictSerializer < ActiveModel::Serializer
  attributes :id, :name, :rep, :state, :cdid

  attribute :issue_summary, key: :issues
end
