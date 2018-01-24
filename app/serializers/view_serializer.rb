class ViewSerializer < ActiveModel::Serializer
  attributes :id, :attitude, :description, :votes, :created_at

  attribute :created_by, key: :creator

  has_one :issue
  has_one :creator

  def created_by
    {id: object.creator_id, username: object.creator.username}
  end
end
