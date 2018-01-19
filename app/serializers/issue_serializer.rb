class IssueSerializer < ActiveModel::Serializer
  attributes :id, :title, :blurb, :category, :created_at, :votes, :views

  attribute :created_by, key: :creator

  def created_by
    {id: object.creator_id, username: object.creator.username}
  end

  def views
    object.views.map{|v| ViewSerializer.new(v).attributes}
  end


  # def votes
  #   object.vote_count
  # end
  # has_one :creator

  # has_many :views
end
